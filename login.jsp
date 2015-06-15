<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/validation.js"></script>
	<script src="js/login.js"></script>
	

	<title>Login Page</title>
</head>
<body>
	<div class= "navbar-wrapper">
		<nav class="navbar navbar-default">
			<div class ="container">
				<div class = "navbar-header ">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
						 <span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class ="navbar-brand" href= "${pageContext.request.contextPath}">Bridgeport Hotel</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class=""><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/signup.jsp">Register</a></li>
						<li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>	                
						<a class="btn btn-md btn-primary navbar-btn " href="${pageContext.request.contextPath}/login.jsp" role="button">log in</a>
					</ul>
				</div>
				<div></div>
				</div>
		</nav>
	</div>

	<div class="container cover">

		<form action = "/ProjWeb_SCC0219_Part2/Bridgeport/UserServlet" method="get" class="form-signin" accept-charset="utf-8">
		<h2 class="form-signin-heading">Please sign in or register</h2>
		<label for="inputEmail" class="sr-only">Email address</label>
		<input name = "email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
		<label for="inputPassword" class="sr-only">Password</label>
		<input name = "password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
		<input name = "action" type = "hidden" value = "login"/>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		<span>Not a Client yet?</span>
			<a class = "btn btn-lg btn-info btn-block" href="${pageContext.request.contextPath}/signup.jsp">Register now</a>
		</form>

		
		<footer>
		<p>&copy; 2015 designed by Clayton de Oliveira, All rights reserved
		</footer>
		
	</div> <!-- /container -->


</body>
</html>