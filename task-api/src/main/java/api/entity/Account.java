package api.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String login;
    private String password;
    private String role;
    @OneToMany(targetEntity = Schedule.class, mappedBy = "account", orphanRemoval = true)
    private List<Schedule> scheduleList;

    public Account() {
    }

    public Account(Account account) {
        this.id = account.getId();
        this.login = account.getLogin();
        this.password = account.getPassword();
        this.role = account.getRole();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }
}
