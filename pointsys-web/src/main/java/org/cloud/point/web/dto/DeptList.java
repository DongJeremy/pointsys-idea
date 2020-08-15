package org.cloud.point.web.dto;

import java.util.List;

import org.cloud.point.domain.Department;

public class DeptList {
    private List<Department> departments;

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

}
