namespace go apix

include "../entity/page.thrift"
include "../entity/common.thrift"

struct TaskPageRequest {
    1: optional string Scene (api.body = "scene"),
}

struct TaskPageResponse {
    1: page.TaskPageData Data (api.body = "data", go.tag = "json:\"data\""),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct AdsDoActionRequest {
    1: required common.CommonArgs CommonArgs (api.body = "common_args"),
    2: required i64 ecpm (api.body = "ecpm"),
}

struct AdsDoActionResponse {
    1: BaseDoActionData Data (api.body = "data", go.tag = "json:\"data\""),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct BoxDoActionRequest {
    1: required common.CommonArgs CommonArgs (api.body = "common_args"),
}

struct BoxDoActionResponse {
    1: BaseDoActionData Data (api.body = "data", go.tag = "json:\"data\""),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct BaseDoActionData {
    1: required list<page.Reward> Rewards (api.body = "rewards"), // 本次发奖任务实例中的奖励信息
    2: required bool HasNext (api.body = "has_next"),             // 是否有广告任务
    3: optional page.Task NextTask (api.body = "next_task"),      // 后续广告配置
}