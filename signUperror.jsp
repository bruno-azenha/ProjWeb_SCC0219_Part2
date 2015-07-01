<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	

	<title> 
	Signup error
	</title>
</HEAD>


<BODY>
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
	
<div class="container">
<div class="row cover">
   <h2 class="header">Signup Error</h2>
	<p class="text" >This e-mail is registered already.<br/>		
		If you forgot your password Click<a class="link" href="${pageContext.request.contextPath}/recover.jsp"> here!!! </a><br/>
		If you think this is a mistake please contact us  <a class="link" href="${pageContext.request.contextPath}/contact.jsp"> here!!! </a><br/>
		To go back click <a class= "link" href="${pageContext.request.contextPath}/signup.jsp"> here!!! </a><br/></p>
  
	</div>
	<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>
</BODY>
</HTML>