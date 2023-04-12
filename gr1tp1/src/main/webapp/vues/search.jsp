<%@page import="domains.Livre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultat</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

h3 {
	text-align: center;
	margin-top: 50px;
	color: #0099cc;
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
	padding: 10px;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

p {
	text-align: center;
	margin-top: 50px;
	color: #cc0000;
	font-weight: bold;
}
</style>
</head>
<body>
	<%
	Livre l = (Livre) request.getAttribute("l");
	if (l != null) {
	%>
	<h3>Le livre recherché :</h3>
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
			<tr>
				<td><%=l.getISBN()%></td>
				<td><%=l.getTitre()%></td>
				<td><%=l.getDescription()%></td>
				<td><%=l.getDate_edition()%></td>
				<td><%=l.getEditeur()%></td>
				<td><%=l.getAuteur().getNom()%>&nbsp;<%=l.getAuteur().getPrenom()%></td>
			</tr>
		</tbody>
	</table>
	<%
	} else {
	%><p>Le livre n'existe pas!</p>
	<%
	}
	%>
</body>
</html>
