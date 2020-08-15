package org.cloud.point.api.service;

import java.util.List;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.SysUser;
import org.cloud.point.dto.UserDto;
import org.cloud.point.dto.UserOnline;

public interface UserService extends BaseService<SysUser> {

    SysUser saveUser(UserDto userDto);

    SysUser updateUser(UserDto userDto);

    SysUser getUser(String username);

    void changePassword(String username, String oldPassword, String newPassword);

    SysUser findUserInfoByUsername(String username);

    List<UserOnline> getOnlineUsers();

    List<UserOnline> getOnlineUsers(int page, int limit);

    long getOnlineUserCount();

    void forceLogout(String sessionId);

    void updateUserInfoByPrimaryKey(SysUser user);

    boolean updatePasswordByUserId(Long id, String original, String password);

    boolean enableUserByID(Long id);

    boolean disableUserByID(Long id);

    SysUser findUserInfo();

}
