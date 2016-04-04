package io.khasang.util;

public enum Lights {

    GREEN("Зеленый", "2"),
    YELLOW("Желтый", "3"),
    RED("Красный", "4");

    private String token;
    private String seconds;

    Lights(String token, String seconds) {
        this.token = token;
        this.seconds = seconds;
    }

    public String getToken() {
        return token;
    }

    public String getSeconds() {
        return seconds;
    }
}
