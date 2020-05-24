package dao.implementations;

import dao.interfaces.BaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;

import java.util.ArrayList;
import java.util.List;

abstract class BaseDAOImpl<T, TRepository extends CrudRepository<T, Long>> implements BaseDAO<T> {
    @Autowired
    TRepository tRepository;

    public List<T> getAll() {
        List<T> tList = new ArrayList<>();
        tRepository.findAll().forEach(tList::add);
        return tList;
    }

    public T get(Long id) {
        return tRepository.findOne(id);
    }

    public void create(T t) {
        tRepository.save(t);
    }

    public void update(T t) {
        tRepository.save(t);
    }

    public void delete(Long id) {
        tRepository.delete(id);
    }
}
