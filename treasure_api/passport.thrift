namespace go apix

include "../entity/page.thrift"
include "../entity/common.thrift"

struct SendSmsVerifyCodeRequest {
    1: string PhoneNumber (api.body = "phone_number"),
}

struct SendSmsVerifyCodeResponse {

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct LoginRequest {
    1: string SmsCode (api.body = "sms_code"),          // 验证码
    2: string PhoneNumber (api.body = "phone_number"),  // 手机号
}

struct LoginResponse {
    1: string Token (api.body = "token"),
    2: i64 Uid (api.body = "uid"),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct UserInfoRequest {
}

struct UserInfoResponse {
    1: string Token (api.body = "token"),
    2: i64 Uid (api.body = "uid"),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

struct TouristLoginRequest {
}

struct TouristLoginResponse {
    1: string Token (api.body = "token"),
    2: i64 Uid (api.body = "uid"),

    254: i32 StatusCode (api.body = "status_code"),
    255: common.StatusInfo StatusInfo (api.body = "status_info"),
}

