<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<title> 
	Password Recovery Page
	</title>
	
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

	<div class = "container">
		<div class="row cover">
			<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part2/Bridgeport/RecoveryServlet" method="GET" id = "recovery" accept-charset="utf-8">
				
				
				<h2 class="header">Password Recovery</h2>
				<p class="text">please enter your registered email account<br>
				a new password will be sent to it
				</p>
				<div>
					<input  type = "text" class= "form-control" name = "email" id= "email" required  />
				</div>
				<input class= "btn btn-md btn-warning btn-block form-control " type="submit" id="serch" value ="send request"/>
				
			</form>
		
		</div>
		<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>
	
</body>
</html>