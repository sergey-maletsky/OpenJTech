package io.khasang.controller;

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

    @RequestMapping(value = "/lights", method = RequestMethod.GET)
    public String getLight(Model model,
                           @RequestParam(value = "minutes", required = true, defaultValue = "") String minutes) {
        String light = "";
        if (minutes.equals("2")) {
            light = Lights.GREEN.getToken();
        }
        else if (minutes.equals("3")) {
            light = Lights.YELLOW.getToken();
        }
        else if (minutes.equals("4")) {
            light = Lights.RED.getToken();
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

