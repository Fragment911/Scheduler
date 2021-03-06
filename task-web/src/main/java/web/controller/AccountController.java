package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;
import services.interfaces.AccountService;

@Controller
@PreAuthorize("hasAnyRole('ADMIN')")
@RequestMapping(value = {"/account"})
public class AccountController {
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String getAll(Model model) {
        model.addAttribute("accountList", accountService.getAll());
        return "account/list";
    }

    @RequestMapping(value = {"/moder/{id}"}, method = RequestMethod.GET)
    public String makeModer(@PathVariable("id") Long id) {
        accountService.makeModer(id);
        return "redirect:/account";
    }

    @RequestMapping(value = {"/user/{id}"}, method = RequestMethod.GET)
    public String makeUser(@PathVariable("id") Long id) {
        accountService.makeUser(id);
        return "redirect:/account";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView delete(@PathVariable("id") Long id) {
        accountService.delete(id);
        return new RedirectView("/account");
    }
}
