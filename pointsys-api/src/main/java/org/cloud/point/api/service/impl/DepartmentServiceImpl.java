package org.cloud.point.api.service.impl;

import org.cloud.point.api.service.DepartmentService;
import org.springframework.stereotype.Service;

import org.cloud.point.base.BaseServiceImpl;
import org.cloud.point.domain.Department;
import org.cloud.point.mapper.DepartmentMapper;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<DepartmentMapper, Department> implements DepartmentService {

}
