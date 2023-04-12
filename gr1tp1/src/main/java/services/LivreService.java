package services;

import java.util.Date;
import java.util.List;
import domains.Livre;

public interface LivreService {

	void createLivre(Livre l);

	List<Livre> getAllLivre();

	Livre getLivre(int isbn);

	void updateLivre(Livre livre);

	void deleteLivre(int isbn);
	
	Livre findLivreByTitre(String titre);
	
	Livre findLivreByDateEdition(Date date_edition);
}