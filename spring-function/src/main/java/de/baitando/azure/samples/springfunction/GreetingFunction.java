package de.baitando.azure.samples.springfunction;

import java.util.function.Function;

public class GreetingFunction implements Function<String, String> {

    @Override
    public String apply(String name) {
        return "Welcome, " + name;
    }
}
