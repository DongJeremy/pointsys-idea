package org.cloud.point.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.cloud.point.api.service.UserService;
import org.cloud.point.beans.PaginationRequest;
import org.cloud.point.beans.PaginationResponse;
import org.cloud.point.beans.ResultBean;
import org.cloud.point.domain.SysUser;
import org.cloud.point.dto.PasswordBean;
import org.cloud.point.pagination.PaginationHandler;
import org.cloud.point.security.service.TokenService;
import org.cloud.point.util.UserUtil;

@Tag(name = "用户")
@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Operation(summary = "根据用户id获取用户")
    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('sys:user:query')")
    public SysUser user(@PathVariable Long id) {
        return userService.getById(id);
    }

    @Operation(summary = "当前登录用户")
    @GetMapping("/current")
    public SysUser currentUser(String token) {
        if (token != null) {
            return tokenService.getLoginUser(token);
        }
        return UserUtil.getLoginUser();
    }

    @OperationLog("获取在线用户列表")
    @Operation(summary = "获取在线用户列表")
    @GetMapping("/onlinelist")
    public PaginationResponse listUsers(PaginationRequest request) {
        int offset = request.getStart() / request.getLength() + 1;
        PaginationResponse pageResponse = new PaginationHandler(req -> userService.getOnlineUserCount(),
                req -> userService.getOnlineUsers(offset, req.getLength())).handle(request);
        return pageResponse;
    }

    @Operation(summary = "剔除在线用户")
    @PostMapping("/kickout/{sessionId}")
    public ResultBean<?> forceLogout(@PathVariable("sessionId") String sessionId) {
        userService.forceLogout(sessionId);
        return ResultBean.successResult();
    }

    @Operation(summary = "获取用户列表")
    @OperationLog("获取用户列表")
    @GetMapping("/list")
    public PaginationResponse listUser(PaginationRequest request) {
        int offset = request.getStart() / request.getLength() + 1;
        PaginationResponse pageResponse = new PaginationHandler(
                req -> userService.list(req.getParams(), offset, req.getLength()).getTotal(),
                req -> userService.list(req.getParams(), offset, req.getLength()).getList()).handle(request);
        return pageResponse;
    }

    @Operation(summary = "添加用户")
    @OperationLog("添加用户")
    @PostMapping
    public ResultBean<Long> addUser(@RequestBody SysUser user) {
        return ResultBean.successResult(userService.save(user));
    }

    @Operation(summary = "编辑用户")
    @OperationLog("编辑用户")
    @PutMapping
    public ResultBean<?> updateUser(@RequestBody SysUser user) {
        userService.save(user);
        return ResultBean.successResult();
    }

    @PostMapping("/userInfo")
    public ResultBean<?> userInfo(@RequestBody SysUser user) {
        // 保存数据
        userService.updateUserInfoByPrimaryKey(user);
        return ResultBean.successResult();
    }

    @Operation(summary = "刪除用户")
    @OperationLog("刪除用户")
    @DeleteMapping("/{id}")
    public ResultBean<?> deleteUser(@PathVariable Long id) {
        userService.delete(id);
        return ResultBean.successResult();
    }

    @OperationLog("删除账号")
    @PostMapping("/{id}/disable")
    public ResultBean<Boolean> disable(@PathVariable("id") Long id) {
        return ResultBean.successResult(userService.disableUserByID(id));
    }

    @OperationLog("激活账号")
    @PostMapping("/{id}/enable")
    public ResultBean<Boolean> enable(@PathVariable("id") Long id) {
        return ResultBean.successResult(userService.enableUserByID(id));
    }

    @OperationLog("重置密码")
    @PostMapping("/{id}/reset")
    public ResultBean<?> resetPassword(@PathVariable("id") Long id, @RequestBody PasswordBean passwordBean) {
        System.out.println(passwordBean);
        boolean resetPass = userService.updatePasswordByUserId(id, passwordBean.getOriginal(),
                passwordBean.getPassword());
        if (!resetPass) {
            return ResultBean.errorResult("原密码错误，重置密码失败");
        }
        return ResultBean.successResult();
    }
}
