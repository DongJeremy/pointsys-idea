package org.cloud.point.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.cloud.point.domain.Employee;

@Mapper
public interface EmployeeMapper extends BaseMapper<Employee> {

}
