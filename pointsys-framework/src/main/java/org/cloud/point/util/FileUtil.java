package org.cloud.point.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.tika.mime.MimeType;
import org.apache.tika.mime.MimeTypeException;
import org.apache.tika.mime.MimeTypes;

public class FileUtil {

    public static void saveInputStreamToFile(InputStream is, HttpServletResponse response, String filename)
            throws Exception {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            response.reset();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-disposition",
                    "attachment;filename=" + URLEncoder.encode(filename, "utf-8") + ".xls");
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
    }

    public static String getMediaTypeExtension(String contentType) {
        final MimeTypes allTypes = MimeTypes.getDefaultMimeTypes();
        try {
            MimeType file = allTypes.forName(contentType);
            String ext = file.getExtension();
            return ext;
        } catch (MimeTypeException e) {
            e.printStackTrace();
        }
        return "unknown";
    }
}
