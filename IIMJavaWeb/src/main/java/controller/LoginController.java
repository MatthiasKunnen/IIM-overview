package controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String printWelcome(Model model, Principal principal) {
        model.addAttribute("username", principal.getName());
        return "hello";
    }

    @RequestMapping(value = "/login")
    public String login(
            @RequestParam(value = "error", required = false) String error, 
            @RequestParam(value = "logout", required = false) String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", "De ingevoerde gebruikersnaam en wachtwoord kloppen niet!");
        }
        if (logout != null) {
            model.addAttribute("msg", "Succesvol uitgelogd!");
        }
        return "login";
    }
}
