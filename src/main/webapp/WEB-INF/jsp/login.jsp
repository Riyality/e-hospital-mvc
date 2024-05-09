<!DOCTYPE html>
<html>

<head>
<title>Login</title>
<style>
header .header {
	background-color: #fff;
	height: 45px;
}

header a img {
	width: 134px;
	margin-top: 4px;
}

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.login-page .form .login {
	margin-top: -31px;
	margin-bottom: 26px;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	border-radius: 5px;
	margin: 0 auto 100px;
	padding: 58px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	outline: 0;
	background-color: orange;
	background-image: linear-gradient(45deg, orange, orange);
	width: 60%;
	border: 0;
	padding: 8px;
	border-radius: 5px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: orange;
	text-decoration: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

body {
	background-image: url('images/health.jpeg');
	background-size: cover; /* Adjust as needed */
}
.Spti-btn {
	background: linear-gradient(90deg, #a9ffc6 0%, #8ecfff 100%) !important;
	color:#333;
	border: none;
}
</style>
</head>

<body>
<body>
	<div class="login-page">
		<div class="form">
			<div class="login">
				<div class="login-header">
					<h3>LOGIN</h3>
					<p></p>
				</div>
			</div>
			<form class="login-form" action="login-user" method="post">
				<input type="text" name="username" placeholder="username" /> <input
					type="password" name="password" placeholder="password" />
				<button type="submit" class="Spti-btn">login</button>
				<p class="message">
					Not registered? <a href="#">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
</body>

</html>