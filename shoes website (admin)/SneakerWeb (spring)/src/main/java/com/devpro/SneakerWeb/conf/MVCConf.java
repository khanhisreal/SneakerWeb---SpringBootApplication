package com.devpro.SneakerWeb.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//1. Báo cho spring mvc biết đây là cấu hình
//2. Tạo instance của cấu hình này <=> MVCConf mvc = new MVCConf()
//mvc sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
@Configuration
public class MVCConf implements WebMvcConfigurer {
	
	/**
	 * cấu hình resources cho spring mvc
	 * classpath: tương đương với thư mục src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		
		//ERROR: http://localhost:8080/css/styles.css 404
		//bất cứ request nào có dạng: http://localhost:8080/css/thumuccon/dcf.css sẽ vào folder src/main/resources/css
		//classpath: = /src/main/resources
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		//ERROR: http://localhost:8080/js/scripts.js 404
		//bất cứ request nào có dạng: http://localhost:8080/js/thumuccon/dcf.js sẽ vào folder src/main/resources/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");		
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		
		//đăng kí thêm folder upload
        registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "D:/upload/");		
	}
	

	// @Bean báo spring biết cần tạo instance
	// ViewResolver vr = mvc.viewResolver();
	// vr sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
	// spring mvc sẽ sử dụng vr để biết folder chứa view
	@Bean
	public ViewResolver viewResolver() {

		// Class InternalResourceViewResolver implements ViewResolver
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// Đường dẫn thư mực gốc chứa Views.
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của View
		bean.setSuffix(".jsp");

		return bean;
	}
}