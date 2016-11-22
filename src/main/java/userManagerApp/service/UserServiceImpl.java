package userManagerApp.service;

import org.springframework.transaction.annotation.Transactional;
import userManagerApp.dao.UserDAO;
import userManagerApp.model.User;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDAO userDao;

    public void setUserDao(UserDAO userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Transactional
    public void deleteUser(int id) {
        this.userDao.deleteUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Transactional
    public List<User> getAllUsers() {
        return this.userDao.getAllUsers();
    }
}
