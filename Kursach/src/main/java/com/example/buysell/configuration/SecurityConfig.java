package com.example.buysell.configuration;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
    @Bean
    protected SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/placement", "/placement/**",
                                "/desk/main", "/product/main", "/product/**", "/registration", "/login")
                        .permitAll()
                        .requestMatchers("/desk/**", "/admin/user/edit/**", "/admin", "/admin/user/edit",
                                "/admin/user/ban/**", "/desk/create", "/desk/delete/**", "/placement/create",
                                "/placement/delete/**", "/product/create", "/product/delete/**")
                        .hasAnyAuthority("ROLE_ADMIN","ROLE_USER")
                        .anyRequest().authenticated()
                )
                .formLogin((form) -> form
                        .loginPage("/login")
                        .successHandler((request, response, authentication) -> {
                            response.sendRedirect("/placement");})
                        .permitAll()
                )
                .logout((logout) -> logout.permitAll());
        return http.build();
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(8);
    }
}
