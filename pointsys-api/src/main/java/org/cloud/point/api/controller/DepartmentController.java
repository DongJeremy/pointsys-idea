package org.cloud.point.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.cloud.point.annotation.OperationLog;
import org.cloud.point.api.service.DepartmentService;
import org.cloud.point.beans.PaginationRequest;
import org.cloud.point.beans.PaginationResponse;
import org.cloud.point.beans.ResultBean;
import org.cloud.point.domain.Department;
import org.cloud.point.pagination.PaginationHandler;

@Tag(name = "部门")
@RestController
@RequestMapping("/api/v1/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService service;

    @Operation(summary = "部门列表")
    @GetMapping
    public PaginationResponse listDepartment(PaginationRequest request) {
        int offset = request.getStart() / request.getLength() + 1;
        PaginationResponse pageResponse = new PaginationHandler(
                req -> service.list(req.getParams(), offset, req.getLength()).getTotal(),
                req -> service.list(req.getParams(), offset, req.getLength()).getList()).handle(request);
        return pageResponse;
    }

    @OperationLog("添加部门")
    @Operation(summary = "添加部门")
    @PostMapping
    public ResultBean<?> addDepartment(@RequestBody Department department) {
        service.save(department);
        return ResultBean.successResult();
    }

    @OperationLog("删除部门")
    @Operation(summary = "删除部门")
    @DeleteMapping("/{id}")
    public ResultBean<?> deleteDepartment(@PathVariable Long id) {
        long deleteNo = service.delete(id);
        return deleteNo > 0 ? ResultBean.successResult() : ResultBean.errorResult();
    }

    @Operation(summary = "查找部门")
    @GetMapping("/{id}")
    public ResultBean<?> getDepartment(@PathVariable Long id) {
        return ResultBean.successResult(service.getById(id));
    }

    @OperationLog("更新部门")
    @Operation(summary = "更新部门")
    @PutMapping("/{id}")
    public ResultBean<?> updateDepartment(@PathVariable Long id, @RequestBody Department department) {
        department.setId(id);
        service.save(department);
        return ResultBean.successResult();
    }

    @OperationLog("删除部门")
    @Operation(summary = "删除部门")
    @PostMapping("/batch/{id}")
    public ResultBean<?> removeDepartment(@PathVariable("id") String[] ids) {
        for (String id : ids) {
            service.delete(Long.parseLong(id));
        }
        return ResultBean.successResult();
    }

    @Operation(summary = "部门列表")
    @GetMapping("/list")
    public ResultBean<?> getDepartmentList() {
        return ResultBean.successResult(service.list());
    }

}
