package de.baitando.azure.samples.springfunction.model;

public class Greeting {

    public Greeting() {
    }

    public Greeting(String message) {
        this.message = message;
    }

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
