package api.entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.List;

@Entity
@OnDelete(action = OnDeleteAction.CASCADE)
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    @ManyToOne(targetEntity = Account.class, cascade = CascadeType.ALL)
    private Account account;
    @OneToMany(targetEntity = Task.class, mappedBy = "schedule", orphanRemoval = true)
    private List<Task> taskList;

    public Schedule() {
    }

    public Schedule(long id, String name, Account account) {
        this.id = id;
        this.name = name;
        this.account = account;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<Task> getTaskList() {
        return taskList;
    }
}
