package com.upe.edu.tukuntechdiscoveryserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer

public class TukuntechDiscoveryServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(TukuntechDiscoveryServerApplication.class, args);
    }

}
