package com.example.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EntityScan(basePackages = {
		"com.example.model"
})
@EnableJpaRepositories(basePackages = {
		"com.example.repository"
})

@SpringBootApplication(scanBasePackages ={
		"com.example.data",
		"com.example.controller",
		"com.example.client",
})
public class AgencyApplication {

	public static void main(String[] args) {
		SpringApplication.run(AgencyApplication.class, args);
	}

}
