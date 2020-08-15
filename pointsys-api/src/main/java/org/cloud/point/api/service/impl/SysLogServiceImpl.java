package org.cloud.point.api.service.impl;

import javax.annotation.Resource;

import org.cloud.point.api.service.SysLogService;
import org.springframework.stereotype.Service;

import org.cloud.point.base.BaseServiceImpl;
import org.cloud.point.domain.SysLog;
import org.cloud.point.mapper.SysLogMapper;

@Service("sysLogService")
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    @Resource
    private SysLogMapper sysLogMapper;

    @Override
    public void clearLogs() {
        sysLogMapper.clearLogs();
    }

}
