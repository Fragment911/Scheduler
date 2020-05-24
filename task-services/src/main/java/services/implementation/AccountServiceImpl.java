package services.implementation;

import api.entity.Account;
import api.entity.Role;
import dao.interfaces.AccountDAO;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import services.interfaces.AccountService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl extends BaseServiceImpl<Account, AccountDAO> implements AccountService {
    @Override
    public List<Account> getAll() {
        List<Account> accountList = new ArrayList<>();
        for (Account account : tDAO.getAll()) {
            if (!"ROLE_ADMIN".equals(account.getRole())) {
                accountList.add(account);
            }
        }
        return accountList;
    }

    public void update(Long id, String login, String password) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        currentAccount.setLogin(login);
        ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder();
        currentAccount.setPassword(shaPasswordEncoder.encodePassword(password, ""));
        tDAO.update(currentAccount);
        int i = 6;
    }

    @Override
    public void delete(Long id) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (id != currentAccount.getId()) {
            tDAO.delete(id);
        }
    }

    @Override
    public void makeModer(Long id) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account account = get(id);
        if (currentAccount.getId() != account.getId()) {
            account.setRole("ROLE_" + Role.MODER.name());
            update(account);
        }
    }

    @Override
    public void makeUser(Long id) {
        Account currentAccount = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account account = get(id);
        if (currentAccount.getId() != account.getId()) {
            account.setRole("ROLE_" + Role.USER.name());
            update(account);
        }
    }

    public Optional<Account> findByLogin(String username) {
        return tDAO.findByLogin(username);
    }
}
