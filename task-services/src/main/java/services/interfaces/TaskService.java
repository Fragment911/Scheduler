package services.interfaces;

import api.entity.Account;
import api.entity.Schedule;
import api.entity.Task;

import java.util.List;

public interface TaskService extends BaseService<Task> {
    void update(long id, String name, String text);
    void makeDone(long id);
    void makeInProcess(long id);
}
