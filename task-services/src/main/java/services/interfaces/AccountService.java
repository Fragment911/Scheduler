package services.interfaces;

import api.entity.Account;

import java.util.Optional;

public interface AccountService extends BaseService<Account> {
    Optional<Account> findByLogin(String username);
    void update(Long id, String login, String password);
    void makeModer(Long id);
    void makeUser(Long id);
}
