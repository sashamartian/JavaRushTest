package userManagerApp.dao;

import userManagerApp.model.User;
import java.util.List;

public interface userDAO {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    User getUserById(int id);
    List<User> getAllUsers();
}
