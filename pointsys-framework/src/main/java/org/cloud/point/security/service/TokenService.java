package org.cloud.point.security.service;

import java.util.Set;

import org.cloud.point.domain.Token;
import org.cloud.point.dto.LoginUser;

public interface TokenService {

    Token saveToken(LoginUser loginUser);

    boolean deleteToken(String token);

    LoginUser getLoginUser(String token);

    void refresh(LoginUser loginUser);

    Set<String> getAllTokenList(String pattern);

    boolean deleteUUIDToken(String sessionId);

}
