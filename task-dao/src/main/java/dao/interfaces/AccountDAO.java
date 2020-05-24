package dao.interfaces;

import api.entity.Account;

import java.util.Optional;

public interface AccountDAO extends BaseDAO<Account> {
    Optional<Account> findByLogin(String username);
}
