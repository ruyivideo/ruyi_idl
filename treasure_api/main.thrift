namespace go apix

include "page.thrift"
include "passport.thrift"

service user {

    // 发送验证码
    passport.SendSmsVerifyCodeResponse SendSmsVerifyCode(1: passport.SendSmsVerifyCodeRequest req) (api.get = "/passport/sms/verify_code"),

    // 完成短信验证码校验 & 登陆
    passport.LoginResponse Login(1: passport.LoginRequest req) (api.post = "/passport/login"),

    // 用户信息
    passport.UserInfoResponse UserInfo(1: passport.UserInfoRequest req) (api.post = "/passport/user/info"),

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
