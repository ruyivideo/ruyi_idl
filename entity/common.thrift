namespace go rpcx.common
namespace py rpcx.common

struct BaseResponse {
    1: i32 StatusCode (api.body = "status_code"),
    2: StatusInfo StatusInfo (api.body = "status_info"),
}

struct CommonArgs {
    1: string Token (api.body = "token"),
    2: string UniqueID (api.body = "unique_id"),
}

/** 状态信息 */
struct StatusInfo {

    /** LogID */
    1: string LogID (api.body = "log_id, omitempty"),

    /** 时间戳 */
    2: i64 Now (api.body = "now, omitempty"),

    /** 状态信息 */
    3: string StatusMsg (api.body = "status_msg, omitempty"),

}

struct Token {
    1: required i64 UserId (api.body = "user_id", go.tag = "json:\"user_id\""),
    2: required string TaskId (api.body = "task_id", go.tag = "json:\"task_id\""),
    3: required string InstanceId (api.body = "instance_id", go.tag = "json:\"instance_id\""),
    4: required i64 Ts (api.body = "ts", go.tag = "json:\"ts\""),
}


struct Header {
    1: string DevicePlatform (api.body = "device_platform"),
    2: string PackageName (api.body = "package_name, omitempty"),   // 安卓必传
    3: string SignName (api.body = "sign_name, omitempty"), // 安卓必传
    4: string BundleId (api.body = "bundle_id, omitempty"), // ios必传
    5: string DeviceId (api.body = "device_id"),
    6: string Token (api.body = "token, omitempty"),
}