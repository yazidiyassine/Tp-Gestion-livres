package dao;

import java.util.List;

import domains.Auteur;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.RollbackException;

public class AuteurDaoImpl implements AuteurDao {
	private EntityManagerFactory emf;

	public AuteurDaoImpl() {
		emf = Persistence.createEntityManagerFactory("GestionLivres");
	}

	public List<Auteur> findAll() {
		EntityManager mgr = emf.createEntityManager();
		EntityTransaction transaction = null;
		List<Auteur> auteurs;
		try {
			transaction = mgr.getTransaction();
			transaction.begin();
			auteurs = mgr.createQuery("SELECT aut FROM Auteur aut", Auteur.class).getResultList();
			transaction.commit();

		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Error: il n'y aucun auteur!");
			return null;
		} finally {
			mgr.close();
		}
		return auteurs;
	}

	public Auteur create(Auteur a) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();
			manager.persist(a);
			transaction.commit();
			return a;
		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Erreur: probleme d'insertion!");
			return null;
		} finally {
			manager.close();
		}
	}

	public Auteur getAuteurByMatricule(int matricule) {
		EntityManager manager = emf.createEntityManager();

		try {
			Auteur a = manager.find(Auteur.class, matricule);
			if (a == null)
				throw new Exception("Erreur: aucun auteur avec cet matricule!");
			return a;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			manager.close();
		}
	}

	public Auteur update(Auteur newAuteur) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();

			Auteur a = manager.find(Auteur.class, newAuteur.getMatricule());
			if (a != null) {
				a.setNom(newAuteur.getNom());
				a.setPrenom(newAuteur.getPrenom());
				a.setGenre(newAuteur.getGenre());
				manager.merge(a);
			}
			transaction.commit();
			return a;
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

	public Auteur delete(int matricule) {
		EntityManager manager = emf.createEntityManager();

		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			Auteur a = manager.find(Auteur.class, matricule);
			if (a != null) {
				manager.remove(a);
			}
			transaction.commit();
			return a;

		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Erreur de suppression!");
			return null;
		} finally {
			manager.close();
		}
	}
}
