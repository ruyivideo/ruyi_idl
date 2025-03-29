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
