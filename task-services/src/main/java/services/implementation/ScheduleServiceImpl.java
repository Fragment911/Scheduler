package services.implementation;

import api.entity.Account;
import api.entity.Schedule;
import dao.interfaces.ScheduleDAO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import services.interfaces.ScheduleService;

@Service
public class ScheduleServiceImpl extends BaseServiceImpl<Schedule, ScheduleDAO> implements ScheduleService {
    @Override
    public void create(Schedule schedule) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        schedule.setAccount(currentAccount);
        tDAO.create(schedule);
    }

    @Override
    public void update(long id, String name) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Schedule schedule = get(id);
        if (currentAccount.getId() == schedule.getAccount().getId()) {
            schedule.setName(name);
        }
        tDAO.update(schedule);
    }

    @Override
    public void delete(Long id) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Schedule schedule = get(id);
        if (currentAccount.getId() == schedule.getAccount().getId()) {
            tDAO.delete(id);
        }
    }
}
