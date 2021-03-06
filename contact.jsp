<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
		<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/contact.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/contact.js"></script>
	<title>Contact Page</title>
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
					<a class ="navbar-brand" href= "${pageContext.request.contextPath}/index.jsp">Bridgeport Hotel</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
				  <ul class="nav navbar-nav">
					<li class=""><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/signup.jsp">Register</a></li>
					<li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
					<a class="btn btn-md btn-primary navbar-btn " href="${pageContext.request.contextPath}/login.jsp" role="button">log in</a>               
				  </ul>
				</div>
				
			  </div>
		</nav>
	</div>
	
	<div class= "container">
		<div class = "row cover" >
		<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part3/Bridgeport/MessageServlet" method="POST" id = "contact" autocomplete= "off" accept-charset="utf-8">
		  <input type="hidden" name="action" value="add"/>
		  <h2>Contact us</h2>
		  <h3> Personal Information:</h3>
		  <div>
			<label for = "name" >Name:</label>
		  <input class = "form-control" name ="name" id= "name" type ="text" required  />
			</div>
		<div ><label>E-mail:</label>
		<input class = "form-control" name = "email" id= "email" type ="email" required />
		</div>
		<div>
		<label >Mobile Number:</label>
		<input class = "form-control" name = "phone" id ="phone" type ="text" placeholder = "(XX)XXXXX-XX-XX" />
		</div>
		<h3>How did you find us?</h3>
		<div  >
		<input name = "conheceu" type= "checkbox" value = "jornal"/><label>Newspaper</label>
		<input name = "conheceu" type= "checkbox" value = "indicacao" /> <label>From a Friend</label>
		<input name = "conheceu" type= "checkbox" value = "rede social" />
		<label>Social Network</label>
		</div>
		<div >
		<input name = "conheceu" type= "checkbox" value = "google" /> <label>Google</label>
		<input name = "conheceu" type= "checkbox" value = "revista" /> <label>Magazine</label>
		<input id= "conheceu" name = "conheceu" type= "checkbox" /><label>Other</label>
		</div>

		<h3>Message:</h3>
		<textarea class = " textarea" name = "message" id = "message" rows= "0" cols = "0" required></textarea>

		<input class = "btn btn-lg btn-primary button" id = "submit" type="submit" value ="Send Message"/>
			
		</form>
		</div>
		<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
		
	</div>
	
			
</body>
</html>
