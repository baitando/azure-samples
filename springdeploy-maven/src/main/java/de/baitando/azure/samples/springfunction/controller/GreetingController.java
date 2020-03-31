package de.baitando.azure.samples.springfunction.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    @GetMapping(path = "/greetings")
    public String getGreeting(@RequestParam("name") String name) {
        return String.format("Hello %s", name);
    }
}
