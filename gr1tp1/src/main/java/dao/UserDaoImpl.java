package dao;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.List;

import domains.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.RollbackException;

public class UserDaoImpl implements UserDao {

	private EntityManagerFactory emf;

	public UserDaoImpl() {
		emf = Persistence.createEntityManagerFactory("GestionLivres");
	}

	public List<User> findAll() {
		EntityManager mgr = emf.createEntityManager();
		EntityTransaction transaction = null;
		List<User> users;
		try {
			transaction = mgr.getTransaction();
			transaction.begin();
			users = mgr.createQuery("SELECT user FROM User user", User.class).getResultList();
			transaction.commit();

		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Error: il n'y aucun user!");
			e.printStackTrace();
			return null;
		} finally {
			mgr.close();
		}
		return users;
	}

	public User create(User u) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();
			manager.persist(u);
			transaction.commit();
			return u;
		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Erreur: probleme d'insertion!");
			e.printStackTrace();
			return null;
		} finally {
			manager.close();
		}
	}

	public User getUserById(int id) {
		EntityManager manager = emf.createEntityManager();

		try {
			User u = manager.find(User.class, id);
			if (u == null)
				throw new Exception("Erreur: aucun utilisateur avec cet matricule!");
			return u;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			manager.close();
		}
	}

	public User update(User newUser) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();

			User u = manager.find(User.class, newUser.getId());
			if (u != null) {
				u.setLogin(newUser.getLogin());
				u.setPNH(newUser.getPassword());
				manager.merge(u);
			}
			transaction.commit();
			return u;
		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Erreur de mis à jour");
			return null;
		} finally {
			manager.close();
		}
	}

	public User delete(int id) {
		EntityManager manager = emf.createEntityManager();

		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			User u = manager.find(User.class, id);
			if (u != null) {
				manager.remove(u);
			}
			transaction.commit();
			return u;

		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Erreur de suppression!");
			return null;
		} finally {

		}
	}

	public User login(User user) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			User u = manager.createQuery("SELECT user FROM User user WHERE user.login = :login", User.class)
					.setParameter("login", user.getLogin()).getSingleResult();

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] encodedHash = digest.digest(user.getPassword().getBytes(StandardCharsets.UTF_8));
			String hashedPassword = new String(encodedHash, StandardCharsets.UTF_8);

			if (hashedPassword.equals(u.getPassword())) {
				System.out.println("Login successful!");
				return u;
			} else {
				System.out.println("Login failed!");
				return null;
			}
		} catch (Exception e) {

			return null;
		} finally {
			manager.close();
		}

	}

	public User findByLogin(String login) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			User u = manager.createQuery("SELECT user FROM User user WHERE user.login = :login", User.class)
					.setParameter("login", login).getSingleResult();

			if (u == null)
				throw new Exception("User not found!");
			return u;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			manager.close();
		}
	}

}