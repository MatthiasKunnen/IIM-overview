package controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WelcomeController {

    @RequestMapping(value = "/admin", 
            method = RequestMethod.GET)
    public String welcomeAdmin(Model model, Principal principal) {

        model.addAttribute("message", "Spring Security: " + principal.getName());
        return "hello";

    }

    @RequestMapping(value = "/next", 
                      method = RequestMethod.POST)
    public String welcomeAdminAgain(
                                Model model, Principal principal) {

        model.addAttribute("user", principal.getName());
        return "helloNext";

    }

        @RequestMapping(value = "/login")
    public String login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", "Invalid username and password!");
        }
        if (logout != null) {
            model.addAttribute("msg", "You've been logged out successfully.");
        }
        return "login";
    }

}
