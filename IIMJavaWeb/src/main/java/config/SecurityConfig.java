package config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select name, password, true from administrator where name=?")
                .authoritiesByUsernameQuery("select name,'default' from administrator where name=?");
//                .inMemoryAuthentication()
//                .withUser("Pol").password("123").roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().
                defaultSuccessUrl("/welcome").
                loginPage("/login");

        http.authorizeRequests()
                .antMatchers("/welcome*","/lists*").hasAuthority("default")
                .and()
                .csrf()
                .and()
                .exceptionHandling().accessDeniedPage("/403");
    }
}
