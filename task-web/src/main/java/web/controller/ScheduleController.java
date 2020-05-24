package web.controller;

import api.entity.Account;
import api.entity.Schedule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;
import services.interfaces.AccountService;
import services.interfaces.ScheduleService;
import services.interfaces.TaskService;

import javax.validation.Valid;

@Controller
@PreAuthorize("hasAnyRole('ADMIN', 'MODER', 'USER')")
@RequestMapping(value = {"/schedule"})
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String getAll(Model model) {
        Account currentAccount = (Account)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if ("ROLE_ADMIN".equals(currentAccount.getRole()) || "ROLE_MODER".equals(currentAccount.getRole())) {
            model.addAttribute("scheduleList", accountService.get(currentAccount.getId()).getScheduleList());
            model.addAttribute("scheduleListAll", scheduleService.getAll());
        } else {
            model.addAttribute("scheduleList", accountService.get(currentAccount.getId()).getScheduleList());
        }
        return "schedule/list";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String get(Model model, @PathVariable("id") Long id) {
        Schedule schedule = scheduleService.get(id);
        model.addAttribute("schedule", schedule);
        model.addAttribute("taskList", schedule.getTaskList());
        return "schedule/info";
    }

    @RequestMapping(value = {"/other/{id}"}, method = RequestMethod.GET)
    public String getOther(Model model, @PathVariable("id") Long id) {
        Schedule schedule = scheduleService.get(id);
        model.addAttribute("schedule", schedule);
        model.addAttribute("taskList", schedule.getTaskList());
        return "schedule/info_other";
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.GET)
    public String empty() {
        return "/schedule/create";
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String create(@Valid Schedule schedule) {
        scheduleService.create(schedule);
        return "redirect:";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") Long id) {
        model.addAttribute("schedule", scheduleService.get(id));
        return "schedule/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String update(@Valid Schedule schedule) {
        scheduleService.update(schedule.getId(), schedule.getName());
        return "redirect:";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView delete(@PathVariable("id") Long id) {
        scheduleService.delete(id);
        return new RedirectView("/schedule");
    }
}
