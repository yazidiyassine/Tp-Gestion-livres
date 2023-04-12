package services;

import java.util.List;

import dao.UserDao;
import dao.UserDaoImpl;
import domains.User;

public class UserServiceImpl implements UserService {
	private UserDao dao = new UserDaoImpl();

	public void createUser(User u) {
		User ajoutUser = dao.create(u);
		if (ajoutUser != null)
			System.out.println("User : " + ajoutUser.getId() + " est ajouté!");
	}

	public List<User> getAllUser() {
		return dao.findAll();
	}

	public User getUserById(int id) {
		return dao.getUserById(id);
	}

	public void updateUser(User user) {
		User u = dao.update(user);
		if (u != null)
			System.out.println("L'user " + u.getId() + " est mis à jour!");
	}

	public void deleteUser(int id) {
		User u = dao.delete(id);
		if (u != null)
			System.out.println("L'user " + u.getId() + " est supprimé!");
	}

	public void login(User user) {
		User u = dao.login(user);
		if (u != null) {
			System.out.println("Authentication successful!");
		}
	}

	public User findUserByLogin(String login) {
		User u = dao.findByLogin(login);
		if (u == null)
			System.out.println("Error finding the user with specified login!");
		return u;
	}

}