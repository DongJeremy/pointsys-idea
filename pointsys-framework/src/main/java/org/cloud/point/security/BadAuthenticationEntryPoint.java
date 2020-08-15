package org.cloud.point.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import org.cloud.point.beans.ResponseBean;
import org.cloud.point.constant.Constants;
import org.cloud.point.util.ResponseUtil;

@Component
public class BadAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException, ServletException {
        ResponseBean info = new ResponseBean(HttpStatus.UNAUTHORIZED.value(), Constants.UNAUTHORIZED_MESSAGE);
        ResponseUtil.responseJson(response, HttpStatus.UNAUTHORIZED.value(), info);
    }

}
