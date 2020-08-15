package org.cloud.point.api.service;

import java.util.List;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.Mail;
import org.cloud.point.domain.MailTo;

public interface MailService extends BaseService<Mail> {

    void save(Mail mail, List<String> toUser);

    List<MailTo> getToUsers(Long id);

    //List<MailTo> list(Map<String, Object> params, Integer offset, Integer limit);

}
