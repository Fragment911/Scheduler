package web.controller;

import api.entity.Account;
import api.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.interfaces.AccountService;
import web.security.WebSecurityConfig;

import javax.validation.Valid;

@Controller
public class MainController {
    @Autowired
    private WebSecurityConfig webSecurityConfig;
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index() {
        return "redirect:/schedule";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String signUp() {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@Valid Account account) {
        account.setPassword(webSecurityConfig.getShaPasswordEncoder().encodePassword(account.getPassword(), null));
        account.setRole("ROLE_" + Role.USER.name());
        accountService.create(account);
        return "redirect:";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied() {
        return "403";
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String notFound() {
        return "404";
    }
}