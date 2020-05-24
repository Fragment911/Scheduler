package dao.implementations;

import api.entity.Account;
import dao.interfaces.AccountDAO;
import dao.repository.AccountRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class AccountDAOImpl extends BaseDAOImpl<Account, AccountRepository> implements AccountDAO {
    public Optional<Account> findByLogin(String username) {
        return tRepository.findByLogin(username);
    }
}
