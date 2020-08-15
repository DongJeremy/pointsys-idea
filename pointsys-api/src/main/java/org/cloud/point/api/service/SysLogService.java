package org.cloud.point.api.service;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.SysLog;

public interface SysLogService extends BaseService<SysLog> {
    public void clearLogs();
}
