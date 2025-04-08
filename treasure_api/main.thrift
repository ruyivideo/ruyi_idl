namespace go apix

include "page.thrift"
include "user.thrift"

service user {

    // 获取短信验证码授权Token
    user.SmsTokenResponse GetSmsToken(1: user.SmsTokenRequest req) (api.get = "/user/sms/token"),

    // 完成短信验证码校验 & 登陆
    user.LoginResponse Login(1: user.LoginRequest req) (api.post = "/user/login"),

}

service treasure {

    /** ------- 任务页 ------- */

    page.TaskPageResponse TaskPage(1: page.TaskPageRequest req) (api.get = "/treasure/task/page"),

    /** ------- 任务完成 ------- */

    // 广告任务do_action方法
    page.AdsDoActionResponse AdsDoAction(1: page.AdsDoActionRequest req) (api.post = "/treasure/task/ads/do_action"),

    // 宝箱任务do_action方法
    page.BoxDoActionResponse RedPacketRainDoAction(1: page.BoxDoActionRequest req) (api.post = "/treasure/task/box/do_action"),

}
