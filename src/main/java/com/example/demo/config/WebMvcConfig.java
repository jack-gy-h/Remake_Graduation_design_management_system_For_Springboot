package com.example.demo.config;

import com.example.demo.Interceptor.AdminResourceInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        AdminResourceInterceptor AdminResourceInterceptor = new AdminResourceInterceptor();
        registry.addInterceptor(AdminResourceInterceptor)
                .addPathPatterns("/**")
//                .excludePathPatterns("/" )
                .excludePathPatterns("/index")
                .excludePathPatterns("/login")
//                .excludePathPatterns("/test")
                .excludePathPatterns("/static/**");
}

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

//        HandlerInterceptor AdminResourceInterceptor = null;
//        定义映射样式
        registry.addResourceHandler("/static/**")
//       定义资源的实际位置
                .addResourceLocations("/static/");
    }

}
