package io.khasang.controller;

import io.khasang.controller.exception.LightNumberException;
import io.khasang.controller.exception.NotFoundException;
import io.khasang.service.Message;
import io.khasang.util.Lights;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AppController {

    @Autowired
    Message message;

    @RequestMapping(value = {"/index.html", "/"})
    public String deleteCurrentOrder(Model model) {
        model.addAttribute("index", message.getInfoMessage());
        return "index";
    }

    @RequestMapping(value = "/lights", method = RequestMethod.POST)
    public String getLight(Model model,
                           @RequestParam(value = "seconds", required = true, defaultValue = "") String seconds) {
        String light;
        try {
            if (seconds.equals(Lights.GREEN.getSeconds())) {
                light = Lights.GREEN.getToken();
            } else if (seconds.equals(Lights.YELLOW.getSeconds())) {
                light = Lights.YELLOW.getToken();
            } else if (seconds.equals(Lights.RED.getSeconds())) {
                light = Lights.RED.getToken();
            } else {
                throw new LightNumberException();
            }
        }
        catch (LightNumberException nfe) {
            return "errorNumber";
        }
        model.addAttribute("light", light);
        return "index";
    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String onNotFound() {
        return "error404";
    }
}

