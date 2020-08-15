package org.cloud.point.api.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.FileStorage;

public interface FileStorageService extends BaseService<FileStorage> {

    Resource loadFileAsResource(String fileName);

    String storeFile(MultipartFile file, String targetFilename);

    void deleteByUuid(String uuidString);

}
