package services.interfaces;

import api.entity.Account;
import api.entity.Schedule;

import java.util.List;

public interface ScheduleService extends BaseService<Schedule> {
    void update(long id, String name);
}
