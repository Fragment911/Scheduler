package dao.implementations;

import api.entity.Schedule;
import dao.interfaces.ScheduleDAO;
import dao.repository.ScheduleRepository;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAOImpl extends BaseDAOImpl<Schedule, ScheduleRepository> implements ScheduleDAO {
}
