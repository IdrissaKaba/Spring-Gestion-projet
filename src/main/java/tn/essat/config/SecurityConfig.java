package tn.essat.config;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tn.essat.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	/*
		//NEW ADDED 2
		@Autowired
		@Qualifier("dS")
		DataSource ds;
		*/
		//New ADDED 3
		@Autowired
		UserService userserv;
	
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception
		{
		
			PasswordEncoder crypt = cryptageMP();
			// New ADDED 3
			auth.userDetailsService(userserv).passwordEncoder(crypt);
			
			/*
			auth.inMemoryAuthentication()
			.withUser("ali")
			.password(crypt.encode("essat"))
			.roles("USER");
			auth.inMemoryAuthentication().withUser("Sofiene")
			.password(crypt.encode("essat"))
			.roles("USER","ADMIN");
			*/
			
			/*//New ADDED 2
			auth.jdbcAuthentication().dataSource(ds)
			.usersByUsernameQuery("select username as principal, password as credentials, active from user where username=?")
			.authoritiesByUsernameQuery("select username as principal, role as role from user_roles where username=?")
			.passwordEncoder(crypt)
			.rolePrefix("ROLE_");
			*/
		}
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.formLogin();
			
			http.authorizeRequests().antMatchers("/ADD**/**","/DEL**/**")
			.hasRole("ADMIN");
			http.authorizeRequests().anyRequest().authenticated();
			http.exceptionHandling().accessDeniedPage("/Page403");
			http.csrf();
		}
			  
		@Bean
		public PasswordEncoder cryptageMP() {
			return new BCryptPasswordEncoder();
		}
}
