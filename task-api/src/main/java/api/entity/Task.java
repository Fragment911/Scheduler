package api.entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@OnDelete(action = OnDeleteAction.CASCADE)
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String text;
    private String status;
    @ManyToOne(targetEntity = Schedule.class, cascade = CascadeType.ALL)
    private Schedule schedule;

    public Task() {
    }

    public Task(long id, String name, String text, String status, Schedule schedule) {
        this.id = id;
        this.name = name;
        this.text = text;
        this.status = status;
        this.schedule = schedule;
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
