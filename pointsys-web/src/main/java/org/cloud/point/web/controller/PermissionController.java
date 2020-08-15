package org.cloud.point.web.controller;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.cloud.point.domain.Permission;
import org.cloud.point.web.util.HttpClientUtil;

@Controller
public class PermissionController extends BaseController {

    @GetMapping("/permissions/current")
    @ResponseBody
    public List<Permission> getPermission() {
        ParameterizedTypeReference<List<Permission>> responseType = new ParameterizedTypeReference<List<Permission>>() {
        };
        return HttpClientUtil.doGet(restTemplate, getTokenString(), getUrlString("/api/v1/permissions/current"),
                responseType);
    }
}
