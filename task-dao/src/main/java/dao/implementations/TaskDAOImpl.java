package dao.implementations;

import api.entity.Task;
import dao.interfaces.TaskDAO;
import dao.repository.TaskRepository;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDAOImpl extends BaseDAOImpl<Task, TaskRepository> implements TaskDAO {
}
