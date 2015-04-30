package com.mamababy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hoy on 15. 4. 24..
 */

@Configuration
@ComponentScan
@EnableAutoConfiguration
@Controller
public class Application extends SpringBootServletInitializer {
    @Override
        protected SpringApplicationBuilder configure(SpringApplicationBuilder application){

        return application.sources(Application.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @RequestMapping("/")
    public String getMain(){

        return "main";
    }
}
