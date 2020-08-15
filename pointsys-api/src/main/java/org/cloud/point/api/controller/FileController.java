package org.cloud.point.api.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.cloud.point.annotation.OperationLog;
import org.cloud.point.api.service.FileStorageService;
import org.cloud.point.beans.PaginationRequest;
import org.cloud.point.beans.PaginationResponse;
import org.cloud.point.beans.ResultBean;
import org.cloud.point.domain.FileStorage;
import org.cloud.point.pagination.PaginationHandler;
import org.cloud.point.util.FileSizeUtil;
import org.cloud.point.util.FileUtil;

@Tag(name = "文件处理")
@RestController
@RequestMapping("/api/v1/files")
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private FileStorageService fileStorageService;

    @Operation(summary = "上传文件")
    @PostMapping("/uploadFile")
    public ResultBean<?> uploadFile(@RequestParam("file") MultipartFile file) {
        String fileUuid = UUID.randomUUID().toString();
        String fileName = fileStorageService.storeFile(file, fileUuid);

        // update database
        String fileSize = FileSizeUtil.formatFileSize(file.getSize());
        String extString = FileUtil.getMediaTypeExtension(file.getContentType());
        String fileExt = extString.substring(1).toUpperCase();
        FileStorage targetFileStorage = new FileStorage(fileName, fileUuid, fileSize, fileExt);
        long effectRow = fileStorageService.save(targetFileStorage);
        if (effectRow == 0) {
            return ResultBean.errorResult("update employee fail.");
        }

        return ResultBean.successResult(targetFileStorage);
    }

    @Operation(summary = "上传多个文件")
    @PostMapping("/uploadMultipleFiles")
    public ResultBean<?> uploadMultipleFiles(@RequestParam("files") MultipartFile[] files) {
        return ResultBean.successResult(
                Arrays.asList(files).stream().map(file -> uploadFile(file).getData()).collect(Collectors.toList()));
    }

    @Operation(summary = "下载文件")
    @GetMapping("/downloadFile/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) {
        // Load file as Resource
        Resource resource = fileStorageService.loadFileAsResource(fileName);

        // Try to determine file's content type
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException ex) {
            logger.info("Could not determine file type.");
        }

        // Fallback to the default content type if type could not be determined
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @OperationLog("获取文件列表")
    @Operation(summary = "获取文件列表")
    @GetMapping
    public PaginationResponse listFiles(PaginationRequest request) {
        int offset = request.getStart() / request.getLength() + 1;
        PaginationResponse pageResponse = new PaginationHandler(
                req -> fileStorageService.list(req.getParams(), offset, req.getLength()).getTotal(),
                req -> fileStorageService.list(req.getParams(), offset, req.getLength()).getList()).handle(request);
        return pageResponse;
    }

    @Operation(summary = "删除文件")
    @DeleteMapping("/{id}")
    public ResultBean<?> deleteEmployee(@PathVariable String id) {
        fileStorageService.deleteByUuid(id);
        logger.info("delete employee successful.");
        return ResultBean.successResult();
    }

    @Operation(summary = "批量删除文件")
    @PostMapping("/batch/delete")
    public ResultBean<?> removeEmp(@RequestBody List<String> ids) {
        for (String id : ids) {
            fileStorageService.deleteByUuid(id);
        }
        return ResultBean.successResult();
    }
}
