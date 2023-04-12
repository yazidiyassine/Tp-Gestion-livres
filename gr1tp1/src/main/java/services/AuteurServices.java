package services;

import java.util.List;

import domains.Auteur;

public interface AuteurServices {

	void createAuteur(Auteur a);

	List<Auteur> getAllAuteurs();

	Auteur getAuteurByMatricule(int matricule);

	void updateAuteur(Auteur auteur);

	void deleteAuteur(int matricule);
}