<%@page import="domains.Livre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des livres disponibles</title>
<style>
body {
	font-family: Helvetica, Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
	background-color: #fff;
	margin: 0;
	padding: 0;
}

h2 {
	font-size: 24px;
	font-weight: bold;
	text-align: center;
	margin: 30px 0;
}

table {
	width: 100%;
	max-width: 1200px;
	margin: 40px auto;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px 20px;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
	text-align: left;
}

a {
	color: #0099cc;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.button-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 10vh;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 18px;
	background-color: #008CBA;
	color: #fff;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s ease;
	margin: 10px;
}

.button:hover {
	background-color: #005f79;
	cursor: pointer;
}

form {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	margin: 20px auto;
}

label {
	font-size: 18px;
	margin-right: 10px;
}

input[type="text"], select {
	padding: 5px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

input[type="submit"] {
	padding: 5px 20px;
	font-size: 16px;
	background-color: #008CBA;
	color: #fff;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #005f79;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/recherche">
		<label id="search">Recherche par:</label> <input type="text"
			name="valRecherche"> <select name="search">
			<option value="titre">Titre</option>
			<option value="date_edition">Date d'édition</option>
		</select> <input type="submit" value="Recherche" id="Recherche" />
	</form>
	<%
	List<Livre> listLivres = (List<Livre>) request.getAttribute("listLivres");
	%>
	<h2>Listes des livres disponibles</h2>
	<table>
		<thead>
			<tr>
				<th>ISBN</th>
				<th>Titre</th>
				<th>Description</th>
				<th>Date d'édition</th>
				<th>Editeur</th>
				<th>Auteur</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Livre l : listLivres) {
			%><tr>
				<td><%=l.getISBN()%></td>
				<td><%=l.getTitre()%></td>
				<td><%=l.getDescription()%></td>
				<td><%=l.getDate_edition()%></td>
				<td><%=l.getEditeur()%></td>
				<td><%=l.getAuteur().getNom()%>&nbsp;<%=l.getAuteur().getPrenom()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div class="button-container">
		<a href="logout" class="button">Log Out</a>
	</div>
</body>
</html>