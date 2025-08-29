package com.hugbo.clock_in;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ClockInApplication {
    public static void main(String[] args) {
    	SpringApplication.run(ClockInApplication.class, args);
    }

    @GetMapping("/hello")
    public String hello(@RequestParam(value = "name", defaultValue = "world") String name) {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        Company gamer = context.getBean("company", Company.class);
        System.out.println(gamer);
        return String.format("hello %s", name);
    }
}
