package services.implementation;

import dao.interfaces.BaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

class BaseServiceImpl<T, TDAO extends BaseDAO<T>> {
    @Autowired
    TDAO tDAO;

    @Transactional
    public List<T> getAll() {
        return tDAO.getAll();
    }

    @Transactional
    public T get(Long id) {
        return tDAO.get(id);
    }

    @Transactional
    public void create(T t) {
        tDAO.create(t);
    }

    @Transactional
    public void update(T t) {
        tDAO.update(t);
    }

    @Transactional
    public void delete(Long id) {
        tDAO.delete(id);
    }
}
