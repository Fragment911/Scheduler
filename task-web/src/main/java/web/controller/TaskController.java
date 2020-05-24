package web.controller;

import api.entity.Schedule;
import api.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;
import services.interfaces.TaskService;

import javax.validation.Valid;

@Controller
@PreAuthorize("hasAnyRole('ADMIN', 'MODER', 'USER')")
@RequestMapping(value = {"/task"})
public class TaskController {
    @Autowired
    private TaskService taskService;


    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String get(Model model, @PathVariable("id") Long id) {
        model.addAttribute("task", taskService.get(id));
        return "task/info";
    }

    @RequestMapping(value = {"/done/{id}"}, method = RequestMethod.GET)
    public String makeDone(Model model, @PathVariable("id") Long id) {
        taskService.makeDone(id);
        return "redirect:/schedule/" + taskService.get(id).getSchedule().getId();
    }

    @RequestMapping(value = {"/inprocess/{id}"}, method = RequestMethod.GET)
    public String makeInProcess(Model model, @PathVariable("id") Long id) {
        taskService.makeInProcess(id);
        return "redirect:/schedule/" + taskService.get(id).getSchedule().getId();
    }

    @RequestMapping(value = {"/create/{id}"}, method = RequestMethod.GET)
    public String empty(Model model, @PathVariable("id") Long id) {
        model.addAttribute("schedule_id", id);
        return "/task/create";
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String create(@Valid Task task) {
        taskService.create(task);
        return "redirect:/schedule/" + task.getSchedule().getId();
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") Long id) {
        model.addAttribute("task", taskService.get(id));
        return "task/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String update(@Valid Task task) {
        taskService.update(task);
        return "redirect:/schedule/" + task.getSchedule().getId();
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView delete(@PathVariable("id") Long id) {
        Schedule schedule = taskService.get(id).getSchedule();
        taskService.delete(id);
        return new RedirectView("/schedule/" + schedule.getId());
    }
}
