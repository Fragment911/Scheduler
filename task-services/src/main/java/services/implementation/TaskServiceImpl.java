package services.implementation;

import api.entity.Account;
import api.entity.Status;
import api.entity.Task;
import dao.interfaces.TaskDAO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import services.interfaces.TaskService;

import java.util.List;

@Service
public class TaskServiceImpl extends BaseServiceImpl<Task, TaskDAO> implements TaskService {
    @Override
    public List<Task> getAll() {
        return tDAO.getAll();
    }

    @Override
    public void create(Task task) {
        task.setStatus(Status.IN_PROCESS.name());
        tDAO.create(task);
    }

    public void update(long id, String name, String text) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Task task = get(id);
        if (currentAccount.getId() == task.getSchedule().getAccount().getId()) {
            task.setName(name);
            task.setText(text);
        }
        tDAO.update(task);
    }

    @Override
    public void delete(Long id) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Task task = get(id);
        if (currentAccount.getId() == task.getSchedule().getAccount().getId()) {
            tDAO.delete(id);
        }
    }

    public void makeDone(long id) {
        Task task = get(id);
        task.setStatus(Status.DONE.name());
        update(task);
    }

    public void makeInProcess(long id) {
        Task task = get(id);
        task.setStatus(Status.IN_PROCESS.name());
        update(task);
    }
}
