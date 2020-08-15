package org.cloud.point.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.cloud.point.beans.ResultBean;
import org.cloud.point.web.info.Server;
import org.cloud.point.web.util.HttpClientUtil;

@Controller
public class SysInfoController extends BaseController {

    @GetMapping("/sysInfo/current")
    public String getSysInfo(Model model) {
        ResultBean<Server> server = HttpClientUtil.doGetResultBean(restTemplate, getTokenString(),
                getUrlString("/api/v1/sysInfo"), Server.class);
        model.addAttribute("server", server.getData());
        return "pages/system/sysinfo-list::serverInfo";
    }

}
