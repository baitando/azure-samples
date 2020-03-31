package de.baitando.azure.samples.springfunction.model;

public class User {

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
