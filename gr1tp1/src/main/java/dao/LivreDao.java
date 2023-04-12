package dao;

import java.util.Date;
import java.util.List;

import domains.Livre;


public interface LivreDao {

	public List<Livre> findAll();

	public Livre create(Livre l);

	Livre getLivreByIsbn(int isbn);

	Livre update(Livre newLivre);

	Livre delete(int isbn);
	
	Livre findLivreByTitre(String titre);
	
	Livre findLivreByDateEdition(Date date_edition);
	

}