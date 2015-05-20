package com.mamababy;

import com.mamababy.admin.Interceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by hoy on 2015. 5. 19..
 * Inteceptor
 * "/admin/** 에대한 url 에적용
 * "/amdin 과  /admin/login 제외
 *
 */
@Configuration
public class webConfig extends WebMvcConfigurerAdapter {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new Interceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin").excludePathPatterns("/admin/login");
    }
}