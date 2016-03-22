package io.khasang.service;

public class Message {
    private String infoMessage;

    public Message(String name) {
        infoMessage = name;
    }

    public String getInfoMessage() {
        return infoMessage;
    }

    public void setInfoMessage(String infoMessage) {
        this.infoMessage = infoMessage;
    }
}
