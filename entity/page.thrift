namespace py rpcx.common
namespace go rpcx.common

/** 枚举定义 */

// 判断优先级：Empty > Completed > Created > Rewarded = CanCreate
enum TaskStatus {
    Empty = 0,     // 无Instance
    Created = 1,   // 存在创建未达完成条件的Instance
    Completed = 2, // 存在已达完成条件的Instance但未发奖
    Rewarded = 3,  // 所有现存Instance已发奖或过期，且不可创建更多
    CanCreate = 4, // 所有现存Instance已发奖或过期，但可以创建更多
    Cooldown = 5,  // 在冷却中
}

enum SectionType {
    AssetGroup = 1,      // 资产组
    TaskGroup = 2,       // 基础任务组
    WidgetTaskGroup = 3, // 挂件任务组
}

enum TextType {
    Plain = 1,     // 纯文本
    Countdown = 2, // 倒计时
}

enum DurationUnit {
    Second = 1, // 秒级
    Day = 2,    // 天级
}

enum FeedbackType {
    FeedbackTypeNone = 0,
    RewardFeedbackTypeToast = 1,
    RewardFeedbackTypePopup = 2,
}

/** 类型别名定义 */
typedef string PopupType

const PopupType PopupTypeAdEntry = "ad_entry" // 广告容器入口弹窗
const PopupType PopupTypeAdAgain = "ad_again" // 看广告再得弹窗
const PopupType PopupTypeAdRetention = "ad_retention" // 看广告挽留弹窗
const PopupType PopupTypeRewardFeedback = "reward_feedback" // 奖励反馈

typedef string ButtonAction

const ButtonAction ActionReward = "reward" // 领奖
const ButtonAction ActionEnterAd = "enter_ad" // 进入广告容器
const ButtonAction ActionExitAd = "exit_ad" // 退出广告容器
const ButtonAction ActionContinueAd = "continue_ad" // 继续看广告
const ButtonAction ActionChangeAd = "change_ad" // 切换广告
const ButtonAction ActionFlipCard = "flip_card" // 翻卡
const ButtonAction ActionShowPopup = "show_popup" // 展示弹窗
const ButtonAction ActionClosePopup = "close_popup" // 关闭弹窗
const ButtonAction ActionToTask = "to_task" // 跳转任务
const ButtonAction ActionDoAction = "do_action" // 完成任务
const ButtonAction ActionIncentiveAd = "incentive_ad" // 激励广告
const ButtonAction ActionRedirect = "redirect" // 跳转链接

typedef string ButtonType

const ButtonType ButtonTypeUnfinished = "unfinished" // 未完成看广时关闭按钮
const ButtonType ButtonTypeFinished = "finished" // 完成看广时关闭按钮

typedef TaskGroup WidgetTaskGroup

typedef string AmountType

const AmountType AmountTypeGold = "gold" // 金币
const AmountType AmountTypeCNY = "CNY" // 人民币
const AmountType AmountTypeSecond = "second" // 秒
const AmountType AmountTypeDay = "day" // 天

/** 结构体定义 */
struct Popup {
    1: PopupType Type (api.body = "type", go.tag = "json:\"type\""),                                                              // 弹窗类型
    2: optional Text Title (api.body = "title,omitempty", go.tag = "json:\"title,omitempty\""),                                   // 主标题
    3: optional Text Subtitle (api.body = "subtitle,omitempty", go.tag = "json:\"subtitle,omitempty\""),                          // 副标题
    4: optional Text Reward (api.body = "reward,omitempty", go.tag = "json:\"reward,omitempty\""),                                // 奖励文案
    5: optional Button ConfirmButton (api.body = "confirm_button,omitempty", go.tag = "json:\"confirm_button,omitempty\""),       // 确认按钮
    6: optional Button CancelButton (api.body = "cancel_button,omitempty", go.tag = "json:\"cancel_button,omitempty\""),          // 取消、关闭按钮
}

struct TaskPageData {
    1: list<Section> Sections (api.body = "sections", go.tag = "json:\"sections\""),                                                   // 任务页卡片列表                                                                             // 任务页面资源
}

struct FeedbackSchema {
    1: FeedbackType FeedbackType (api.body = "feedback_type", go.tag = "json:\"feedback_type\""),                                              //反馈类型
    2: optional Toast RewardFeedbackToast (api.body = "reward_feedback_toast,omitempty", go.tag = "json:\"reward_feedback_toast,omitempty\""), //奖励反馈toast
    3: optional Popup RewardFeedbackPopup (api.body = "reward_feedback_popup,omitempty", go.tag = "json:\"reward_feedback_popup,omitempty\""), //奖励反馈popup
}

struct Section {
    1: required string Key (api.body = "key", go.tag = "json:\"key\""),         // 卡片key, 卡片的唯一标识
    2: required SectionType Type (api.body = "type", go.tag = "json:\"type\""),

    // 展示信息；资产卡使用View.Title作为卡片标题,View.Icon作为卡片图标;任务组使用View.Title作为卡片标题,View.Badge作为卡片角标; Header使用View.Title作为标题 ; Footer使用View.Button作为规则跳转
    50: optional View View (api.body = "view,omitempty", go.tag = "json:\"view,omitempty\""),

    100: optional AssetGroup AssetGroup (api.body = "asset_group,omitempty", go.tag = "json:\"asset_group,omitempty\""),                       // 资产组
    101: optional TaskGroup TaskGroup (api.body = "task_group,omitempty", go.tag = "json:\"task_group,omitempty\""),                           // 任务组
    102: optional WidgetTaskGroup WidgetTaskGroup (api.body = "widget_task_group,omitempty", go.tag = "json:\"widget_task_group,omitempty\""), // 挂件任务组
}

struct Asset {
    1: required Text Title (api.body = "title", go.tag = "json:\"title\""),
    2: required i64 Amount (api.body = "amount", go.tag = "json:\"amount\""),
    3: required AmountType AmountType (api.body = "amount_type", go.tag = "json:\"amount_type\""),   // 金币 gold/CNY 时长 second/day
    4: optional string Schema (api.body = "schema,omitempty", go.tag = "json:\"schema,omitempty\""),
}

struct AssetGroup {
    1: list<Asset> Assets (api.body = "assets", go.tag = "json:\"assets\""),                                                   // 资产列表
    2: optional Button WithdrawButton (api.body = "withdraw_button,omitempty", go.tag = "json:\"withdraw_button,omitempty\""), // 提现按钮
}

struct TaskGroup {
    1: list<Task> Tasks (api.body = "tasks", go.tag = "json:\"tasks\""),                          // 任务列表,按展示顺序排列
    2: optional string Style (api.body = "style,omitempty", go.tag = "json:\"style,omitempty\""), // 任务组样式

    51: optional list<Asset> Assets (api.body = "assets,omitempty", go.tag = "json:\"assets,omitempty\""), // 任务组资产

    253: optional map<string, map<string, string>> Strategy (api.body = "strategy,omitempty", go.tag = "json:\"strategy,omitempty\""), // 一致性策略
}

struct Task {
    // 任务基础数据
    1: required string Id (api.body = "id", go.tag = "json:\"id\""),                                     // 任务ID
    2: required string Key (api.body = "key", go.tag = "json:\"key\""),                                  // 任务key
    3: required string Type (api.body = "type", go.tag = "json:\"type\""),                               // 任务类型
    4: optional string Token (api.body = "token,omitempty", go.tag = "json:\"token,omitempty\""),        // 任务token
    5: optional TaskStatus Status (api.body = "status,omitempty", go.tag = "json:\"status,omitempty\""), // 任务状态
    6: required bool CanShow (api.body = "can_show", go.tag = "json:\"can_show\""),                      // 是否展示

    50: optional View View (api.body = "view,omitempty", go.tag = "json:\"view,omitempty\""),                  // 任务展示信息
    51: optional list<Reward> Rewards (api.body = "rewards,omitempty", go.tag = "json:\"rewards,omitempty\""), // 任务奖励信息
    52: optional list<Asset> Assets (api.body = "assets,omitempty", go.tag = "json:\"assets,omitempty\""),     // 任务资产信息

    // 差异化数据
    255: optional DiscrepancyData DiscrepancyData (api.body = "discrepancy_data,omitempty", go.tag = "json:\"discrepancy_data,omitempty\""), // 任务差异数据
}

// 差异化数据
struct DiscrepancyData {
}

struct AdConfig {
    1: map<PopupType, Popup> Popups (api.body = "popups", go.tag = "json:\"popups\""),      // 广告弹窗
    2: map<ButtonType, Button> Buttons (api.body = "buttons", go.tag = "json:\"buttons\""), // 广告按钮
}

// 任务&资源展示信息
struct View {
    1: optional Text Title (api.body = "title,omitempty", go.tag = "json:\"title,omitempty\""),          // 标题
    2: optional Text Subtitle (api.body = "subtitle,omitempty", go.tag = "json:\"subtitle,omitempty\""), // 副标题
    3: optional string Icon (api.body = "icon,omitempty", go.tag = "json:\"icon,omitempty\""),           // 图标
    4: optional Tag Tag (api.body = "tag,omitempty", go.tag = "json:\"tag,omitempty\""),                 // 标签
    5: optional Button Button (api.body = "button,omitempty", go.tag = "json:\"button,omitempty\""),     // 按钮
    6: optional Text Tips (api.body = "tips,omitempty", go.tag = "json:\"tips,omitempty\""),             // 提示
}

struct Tag {
    1: optional string Icon (api.body = "icon,omitempty", go.tag = "json:\"icon,omitempty\""), // 标签图标
    2: optional Text Text (api.body = "text,omitempty", go.tag = "json:\"text,omitempty\""),   // 标签文案
}

struct Toast {
    1: string Text (api.body = "text", go.tag = "json:\"text\""),                              // 弹窗文案
    2: optional string Code (api.body = "code,omitempty", go.tag = "json:\"code,omitempty\""), // 弹窗Code
}

struct Button {
    1: Text Text (api.body = "text", go.tag = "json:\"text\""),                                            // 按钮文案
    2: optional ButtonAction Action (api.body = "action,omitempty", go.tag = "json:\"action,omitempty\""), // 按钮动作,
    3: optional string Schema (api.body = "schema,omitempty", go.tag = "json:\"schema,omitempty\""),       // 按钮跳转链接
    4: optional string Style (api.body = "style,omitempty", go.tag = "json:\"style,omitempty\""),          // 按钮样式
}

// 任务奖励信息
struct Reward {
    1: i32 RewardType (api.body = "reward_type", go.tag = "json:\"reward_type\""),                                               // 奖励类型
    2: i64 RewardAmount (api.body = "reward_amount", go.tag = "json:\"reward_amount\""),                                         // 奖励数值
    3: optional i64 RewardMaxAmount (api.body = "reward_max_amount,omitempty", go.tag = "json:\"reward_max_amount,omitempty\""), // 奖励数值上限
    4: optional string RewardName (api.body = "reward_name,omitempty", go.tag = "json:\"reward_name,omitempty\""),               // 奖励名称
    5: optional string Extra (api.body = "extra,omitempty", go.tag = "json:\"extra,omitempty\""),
}

// 可变文案
struct Text {
    1: TextType Type (api.body = "type", go.tag = "json:\"type\""),

    2: optional Text Prefix (api.body = "prefix,omitempty", go.tag = "json:\"prefix,omitempty\""), // 前缀

    3: optional string PlainText (api.body = "plain_text,omitempty", go.tag = "json:\"plain_text,omitempty\""),
    4: optional CountdownText CountdownText (api.body = "countdown_text,omitempty", go.tag = "json:\"countdown_text,omitempty\""),

    255: optional Text Suffix (api.body = "suffix,omitempty", go.tag = "json:\"suffix,omitempty\""), // 后缀
}

// 倒计时文案
struct CountdownText {
    1: Countdown Countdown (api.body = "countdown", go.tag = "json:\"countdown\""),                        // 倒计时, 倒计时部分使用统一样式
    2: optional Text ZeroText (api.body = "zero_text,omitempty", go.tag = "json:\"zero_text,omitempty\""), // 倒计时归0时显示的文案
}

// 倒计时
struct Countdown {
    1: i64 Duration (api.body = "duration", go.tag = "json:\"duration\""),                           // 倒计时时间
    2: DurationUnit Unit (api.body = "unit", go.tag = "json:\"unit\""),                              // 倒计时单位    秒级/天级
    3: optional string Format (api.body = "format,omitempty", go.tag = "json:\"format,omitempty\""), // 倒计时展示格式 mm:ss/dd
    4: optional string Prefix (api.body = "prefix,omitempty", go.tag = "json:\"prefix,omitempty\""), // 前缀
    5: optional string Suffix (api.body = "suffix,omitempty", go.tag = "json:\"suffix,omitempty\""), // 后缀 X+"天"
}
