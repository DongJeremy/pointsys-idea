package org.cloud.point.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cloud.point.constant.Constants;
import org.cloud.point.security.filter.TokenFilter;
import org.cloud.point.security.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import org.cloud.point.beans.ResponseBean;
import org.cloud.point.util.ResponseUtil;

@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

    @Autowired
    private TokenService tokenService;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        ResponseBean info = new ResponseBean(HttpStatus.OK.value(), Constants.LOGOUTSUCCESS_MESSAGE);

        String token = TokenFilter.getToken(request);
        tokenService.deleteToken(token);

        ResponseUtil.responseJson(response, HttpStatus.OK.value(), info);

    }

}
