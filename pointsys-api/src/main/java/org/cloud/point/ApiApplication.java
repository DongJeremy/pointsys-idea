package org.cloud.point;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApiApplication {

    private final static Logger logger = LoggerFactory.getLogger("o.c.s.Main");

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(ApiApplication.class);
        application.run(args);
        logger.info("============= SpringBoot Start Success =============");
    }
}
