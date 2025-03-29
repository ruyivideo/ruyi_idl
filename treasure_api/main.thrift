namespace go apix

include "entity/page.thrift"

service treasure {

    // 任务页
    page.TaskPageResponse TaskPage(1: page.TaskPageRequest req) (api.get = "/treasure/task/page"),

}
