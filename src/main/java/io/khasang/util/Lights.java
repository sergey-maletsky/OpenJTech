package io.khasang.util;

/**
 * Created by sergey on 22.03.16.
 */
public enum Lights {
    GREEN("Зеленый"),
    YELLOW("Желтый"),
    RED("Красный");

    private String token;

    Lights(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }
}
