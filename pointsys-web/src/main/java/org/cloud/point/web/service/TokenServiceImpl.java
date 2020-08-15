package org.cloud.point.web.service;

import java.util.Set;

import org.springframework.stereotype.Service;

import org.cloud.point.domain.Token;
import org.cloud.point.dto.LoginUser;
import org.cloud.point.security.service.TokenService;

@Service
public class TokenServiceImpl implements TokenService {

    @Override
    public Token saveToken(LoginUser loginUser) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean deleteToken(String token) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public LoginUser getLoginUser(String token) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void refresh(LoginUser loginUser) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public Set<String> getAllTokenList(String pattern) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean deleteUUIDToken(String sessionId) {
        // TODO Auto-generated method stub
        return false;
    }

}
