namespace go apix

include "../entity/page.thrift"
include "../entity/common.thrift"

struct SmsTokenRequest {
}

struct SmsTokenResponse {
    1: string BizToken (api.body = "biz_token"),                        // sms 业务 Token
    2: string StsAccessKeySecret (api.body = "sts_access_key_secret"),  // 访问密钥
    3: string StsAccessKeyId (api.body = "sts_access_key_id"),          // 访问密钥 ID
    4: string StsToken (api.body = "sts_token"),                        // 安全令牌
    5: i64 ExpireTime (api.body = "expire_time"),                       // 过期时间

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct LoginRequest {
    1: string SmsCode (api.body = "sms_code"),          // 验证码
    2: string PhoneNumber (api.body = "phone_number"),  // 手机号
    3: string SmsToken (api.body = "sms_token"),        // 短信 Token。 当您成功调用短信验证码 SDK 中发送验证码接口，终端用户会收到短信验证码，SDK 侧会返回用于短信验证码校验的 SmsToken。其中 Android 客户端调用 sendVerifyCode 接口发送验证码，iOS 客户端调用 sendVerifyCodeWithTimeout 接口发送验证码

}

struct LoginResponse {
    1: string Token (api.body = "token"),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

