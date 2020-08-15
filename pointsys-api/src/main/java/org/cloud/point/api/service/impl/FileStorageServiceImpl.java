package org.cloud.point.api.service.impl;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.cloud.point.api.service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import org.cloud.point.base.BaseServiceImpl;
import org.cloud.point.config.FileStorageProperties;
import org.cloud.point.domain.FileStorage;
import org.cloud.point.exception.FileStorageException;
import org.cloud.point.exception.MyFileNotFoundException;
import org.cloud.point.mapper.FileStorageMapper;

@Service
public class FileStorageServiceImpl extends BaseServiceImpl<FileStorageMapper, FileStorage> implements FileStorageService {

    private final Path fileStorageLocation;
    
    @Autowired
    private FileStorageMapper fileStorageMapper;

    @Autowired
    public FileStorageServiceImpl(FileStorageProperties fileStorageProperties) {
        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir()).toAbsolutePath().normalize();

        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.",
                    ex);
        }
    }

    @Override
    public String storeFile(MultipartFile file, String targetFilename) {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if (fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = this.fileStorageLocation.resolve(targetFilename);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return fileName;
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    @Override
    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if (resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
    }

    @Override
    public void deleteByUuid(String uuidString) {
        try {
            Path filePath = this.fileStorageLocation.resolve(uuidString).normalize();
            Path destinationPath = this.fileStorageLocation.resolve(uuidString + ".removed").normalize();
            Files.move(filePath, destinationPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ex) {
            throw new FileStorageException("File not found " + uuidString, ex);
        }
        fileStorageMapper.deleteByUuid(uuidString);
    }
}
