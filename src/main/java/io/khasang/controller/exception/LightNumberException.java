package io.khasang.controller.exception;

public class LightNumberException extends RuntimeException {
    public LightNumberException() {
    }

    public LightNumberException(Throwable cause) {
        super(cause);
    }

    public LightNumberException(String message) {
        super(message);
    }

    public LightNumberException(String message, Throwable cause) {
        super(message, cause);
    }
}
