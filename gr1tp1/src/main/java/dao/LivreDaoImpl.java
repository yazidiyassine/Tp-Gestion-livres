package dao;

import java.util.Date;
import java.util.List;

import domains.Livre;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.RollbackException;

public class LivreDaoImpl implements LivreDao {
	private EntityManagerFactory emf;

	public LivreDaoImpl() {
		emf = Persistence.createEntityManagerFactory("GestionLivres");
	}

	public List<Livre> findAll() {

		EntityManager mgr = emf.createEntityManager();
		EntityTransaction transaction = null;
		List<Livre> livres;
		try {
			transaction = mgr.getTransaction();
			transaction.begin();
			livres = mgr.createQuery("SELECT liv FROM Livre liv", Livre.class).getResultList();
			transaction.commit();

		} catch (RollbackException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("Error: il n'y aucun livre!");
			return null;
		} finally {
			mgr.close();
		}
		return livres;
	}

	public Livre create(Livre l) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();
			manager.persist(l);
			transaction.commit();
			return l;
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

	public Livre getLivreByIsbn(int isbn) {
		EntityManager manager = emf.createEntityManager();

		try {
			Livre l = manager.find(Livre.class, isbn);
			if (l == null)
				throw new Exception("Erreur: aucun livre avec cet isbn!");
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			manager.close();
		}
	}

	public Livre update(Livre newLivre) {
		EntityManager manager = emf.createEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = manager.getTransaction();
			transaction.begin();

			Livre l = manager.find(Livre.class, newLivre.getISBN());
			if (l != null) {
				l.setTitre(newLivre.getTitre());
				l.setDate_edition(newLivre.getDate_edition());
				l.setDescription(newLivre.getDescription());
				l.setEditeur(newLivre.getEditeur());
				l.setAuteur(newLivre.getAuteur());
				manager.merge(l);
			}
			transaction.commit();
			return l;
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

	public Livre delete(int isbn) {
		EntityManager manager = emf.createEntityManager();

		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			Livre l = manager.find(Livre.class, isbn);
			if (l != null) {
				manager.remove(l);
			}
			transaction.commit();
			return l;

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

	public Livre findLivreByTitre(String titre) {
		EntityManager manager = emf.createEntityManager();

		try {
			Livre l = manager.createQuery("SELECT liv FROM Livre liv WHERE liv.titre = :titre", Livre.class)
					.setParameter("titre", titre).getSingleResult();

			if (l == null)
				throw new Exception("Erreur: aucun livre avec cet isbn!");
			return l;
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}

	public Livre findLivreByDateEdition(Date date_edition) {
		EntityManager manager = emf.createEntityManager();

		try {
			Livre l = manager
					.createQuery("SELECT liv FROM Livre liv WHERE liv.date_edition = :date_edition", Livre.class)
					.setParameter("date_edition", date_edition).getSingleResult();

			if (l == null)
				throw new Exception("Erreur: aucun livre avec cet isbn!");
			return l;
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
}