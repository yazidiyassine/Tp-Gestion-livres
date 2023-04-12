<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
	background-color: #fff;
	font-family: Arial, sans-serif;
}

.container {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.form {
	background-color: #f2f2f2;
	border-radius: 10px;
	padding: 40px;
	max-width: 500px;
	width: 100%;
	box-sizing: border-box;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.form__title {
	font-size: 30px;
	margin-bottom: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.form__icon {
	margin-right: 10px;
	height: 30px;
	width: 30px;
	fill: #333;
}

.form__field {
	margin-bottom: 20px;
}

.form__label {
	display: block;
	margin-bottom: 10px;
}

.form__input {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #fff;
	box-sizing: border-box;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
}

.form__submit {
	background-color: #333;
	color: #fff;
	border: none;
	cursor: pointer;
	font-size: 16px;
	padding: 10px 20px;
	border-radius: 5px;
	margin-top: 20px;
}

.form__submit:hover {
	background-color: #111;
}

.form__error {
	color: #f00;
	margin-top: 10px;
}

.form__input-register {
	display: block;
	margin-top: 20px;
	color: #333;
	text-decoration: none;
	font-size: 16px;
	text-align: center;
}

.form__success {
	color: #008000;
	margin-top: 10px;
}

.success {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f2fff2;
	border-radius: 10px;
	padding: 10px;
	margin: 10px 0;
}

.success__icon {
	fill: #00b300;
	width: 50px;
	height: 50px;
	margin-right: 10px;
}

.success__message {
	font-size: 18px;
	font-weight: bold;
	color: #006600;
}

.form__input-register {
	display: block;
	margin-top: 20px;
	color: #333;
	text-decoration: none;
	font-size: 16px;
	text-align: center;
	border: 1px solid #333;
	padding: 10px 20px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && !msg.isEmpty()) {
	%>
	<div class="success">
		<svg class="success__icon" xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 512 512">
			<path
				d="M455.02 99.474c-21.829-21.829-57.21-21.826-79.036.004L201.182 292.194l-76.157-76.162c-21.826-21.83-57.207-21.833-79.036-.004-21.83 21.826-21.833 57.207-.004 79.036l99.635 99.634c10.903 10.903 25.256 16.947 39.518 16.947s28.615-6.044 39.518-16.947l236.895-236.895c21.826-21.826 21.826-57.21" />
		</svg>
		<p class="success__message"><%=msg%></p>
	</div>
	<%
	}
	%>

	<div class="container">
		<form class="form" action="<%=request.getContextPath()%>/LoginServ"
			method="post">
			<h2 class="form__title">
				<svg class="form__icon" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24">
					<path
						d="M21 1H3c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h18c1.1 0 2-.9 2-2V3c0-1.1-.9-2-2-2zM9 18H5v-2h4v2zm6 0h-4v-2h4v2zm6 0h-4v-2h4v2zm0-4h-4v-2h4v2zm0-4h-4v-2h4v2zm0-4h-4V6h4v2zm-6 8h-4v-2h4v2zm0-4h-4v-2h4v2zm0-4h-4V6h4v2zm6 8h-4v-2h4v2z" /></svg>
				Login
			</h2>
			<div class="form__field">
				<label class="form__label" for="login">Login :</label> <input
					class="form__input" type="email" name="login" id="login" required />
			</div>
			<div class="form__field">
				<label class="form__label" for="password">Password :</label> <input
					class="form__input" type="password" name="password" id="password"
					required />
			</div>
			<input class="form__submit" type="submit" value="Login" />
		</form>
		<a class="form__input-register" href="register.jsp">Register</a>
	</div>
</body>
</html>