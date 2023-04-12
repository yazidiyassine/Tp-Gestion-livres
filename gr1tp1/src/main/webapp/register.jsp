<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "Roboto", sans-serif;
	background-color: #f7f7f7;
}

h2 {
	text-align: center;
	margin-top: 50px;
	font-weight: 500;
	font-size: 2rem;
	color: #333;
	text-transform: uppercase;
	letter-spacing: 2px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 50px auto;
	max-width: 500px;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

label {
	display: block;
	margin-bottom: 10px;
	font-size: 1rem;
	color: #333;
	text-transform: uppercase;
	letter-spacing: 1px;
}

input[type="email"], input[type="password"], input[type="submit"] {
	width: 100%;
	max-width: 400px;
	padding: 10px;
	font-size: 1rem;
	border-radius: 3px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	margin-bottom: 20px;
}

input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 5px;
	font-size: 1rem;
	text-transform: uppercase;
	letter-spacing: 1px;
	max-width: 400px;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<h2>Créer un nouveau compte !</h2>
	<form action="<%=request.getContextPath()%>/RegisterServ" method="post">
		<label for="login">Login :</label> <input type="email" name="login"
			id="login" required /> <label for="password">Password :</label> <input
			type="password" name="password" id="password" required /> <input
			type="submit" value="Register" />
	</form>
</body>
</html>