package org.cloud.point.security.service;

import org.cloud.point.domain.Permission;

public interface PermissionService {

    void save(Permission permission);

    void update(Permission permission);

    void delete(Long id);
}
