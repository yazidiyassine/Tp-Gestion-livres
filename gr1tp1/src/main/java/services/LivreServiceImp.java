package services;

import java.util.Date;
import java.util.List;

import dao.LivreDao;
import dao.LivreDaoImpl;
import domains.Livre;

public class LivreServiceImp implements LivreService {

	private LivreDao dao = new LivreDaoImpl();

	@Override
	public void createLivre(Livre l) {
		Livre ajoutLivre = dao.create(l);
		if (ajoutLivre != null)
			System.out.println("Le livre : " + ajoutLivre.getISBN() + " est ajouté!");
	}

	@Override
	public List<Livre> getAllLivre() {
		return dao.findAll();
	}

	@Override
	public Livre getLivre(int isbn) {
		return dao.getLivreByIsbn(isbn);
	}

	@Override
	public void updateLivre(Livre livre) {
		Livre l = dao.update(livre);
		if (l != null)
			System.out.println("Le livre " + l.getISBN() + " est mis à jour!");

	}

	@Override
	public void deleteLivre(int isbn) {
		Livre l = dao.delete(isbn);
		if (l != null)
			System.out.println("Le livre " + l.getISBN() + " est supprimé!");
	}

	@Override
	public Livre findLivreByTitre(String titre) {
		return dao.findLivreByTitre(titre);
	}

	@Override
	public Livre findLivreByDateEdition(Date date_edition) {
		return dao.findLivreByDateEdition(date_edition);
	}
}