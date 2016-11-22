package userManagerApp.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import userManagerApp.model.User;
import java.util.List;

public class userDaoImpl implements userDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void deleteUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        if(user != null) {
            session.delete(user);
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.openSession();

        return (User) session.get(User.class, id);
    }

    @Override
    public List<User> getAllUsers() {
        Session session = this.sessionFactory.getCurrentSession();

        return (List<User>) session.createQuery("from User").list();
    }
}
