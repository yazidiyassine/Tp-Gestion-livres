package controller_frontal;


import domains.Role;
import domains.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class DefaultUserInitializer implements ServletContextListener {

	private EntityManagerFactory emf;

	public void contextInitialized(ServletContextEvent sce) {
		emf = Persistence.createEntityManagerFactory("GestionLivres");
		EntityManager em = emf.createEntityManager();
		// Check if the default user exists in the database
		if (em.find(User.class, 1) == null) {
			// Create a new User object with the default values
			User defaultUser = new User();
			defaultUser.setLogin("admin@gmail.com");
			defaultUser.setRole(Role.ADMIN);

			defaultUser.setPNH("�iv�A��\b�M�߱g��s�K��o*�H�");;
			// Persist the default user to the database
			em.getTransaction().begin();
			em.persist(defaultUser);
			em.getTransaction().commit();
		}

		em.close();
	}

	public void contextDestroyed(ServletContextEvent sce) {
		if (emf != null) {
			emf.close();
		}
	}
}