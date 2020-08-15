package org.cloud.point.api.service;

import java.util.List;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.Employee;

public interface EmployeeService extends BaseService<Employee> {

    Long batchSaveEmployee(List<Employee> list);
}
