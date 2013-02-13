package com.nerderg.ajaxanywhere.web.controller;

import com.nerderg.ajaxanywhere.web.util.Routing;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
@Controller
public class HomeController {

    @RequestMapping("/home")
    public String home() {
        return Routing.Page.HOME;
    }
}
