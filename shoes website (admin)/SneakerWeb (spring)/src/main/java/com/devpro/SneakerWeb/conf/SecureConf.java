package com.devpro.SneakerWeb.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.devpro.SneakerWeb.services.impl.UserDetailsServiceImpl;

//1. Báo cho spring mvc biết đây là cấu hình
//2. Tạo instance của cấu hình này <=> MVCConf mvc = new MVCConf()
//mvc sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
@Configuration
public class SecureConf extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // bắt đầu cấu hình: tất cả các requests từ
				// trình duyệt đều được bắt trong hàm này

				// cho phép các request static resources không bị ràng buộc(permitAll)
				.antMatchers("/css/**", "/js/**", "/upload/**", "/img/**", "/login", "/logout").permitAll()

				// các request kiểu: "/admin/" phải xác thực rồi(đã login) mới được vào
				// (authenticated)
				.antMatchers("/admin/**").hasAnyAuthority("admin")

				.and()

				// nếu chưa xác thực thì hiển thị trang login
				// /login: một request trong LoginController
				.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		        .successHandler(authenticationSuccessHandler())
				.defaultSuccessUrl("/homepage", true) // login thành công thì luôn trở về trang người dùng
				.failureUrl("/login?login_error=true")

				.and()

				// cấu hình cho phần logout
				.logout().logoutUrl("/logout").logoutSuccessUrl("/admin/home").invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
                .and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}
	
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		return new UrlAuthenticationSuccessHandler();
	}

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}

	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("admin"));
		System.out.println(new BCryptPasswordEncoder(4).encode("guest"));
	}

}
