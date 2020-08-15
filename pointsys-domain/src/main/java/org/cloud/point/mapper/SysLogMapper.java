package org.cloud.point.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.cloud.point.domain.SysLog;

@Mapper
public interface SysLogMapper extends BaseMapper<SysLog> {

    void clearLogs();

}
