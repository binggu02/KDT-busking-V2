package com.team3.busking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
public class BuskingApplication {

	public static void main(String[] args) {
		SpringApplication.run(BuskingApplication.class, args);
	}

}
