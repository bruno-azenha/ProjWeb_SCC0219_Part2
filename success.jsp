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
	Success
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
	
	<div class="container">
	<div class="row cover">
	<h2 class = "header">Success</h2>
	<c:choose>
		<c:when test="${origin == 'message'}">
			<p class= "text">Your message was successfully sent! Please wait for our answer.<br>
	   		Click <a class="link" href="${pageContext.request.contextPath}/index.jsp"> here!!! </a> to go back</p>
	   	</c:when>
	   	<c:when test="${origin == 'signUp'}">
			<p class= "text">Your registration was succesfull!<br>
	   		Click <a  class="link" href="${pageContext.request.contextPath}/login.jsp"> here!!! </a> to go to the login page.</p>
	   	</c:when>
   	</c:choose>
   
	</div>
	<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>

</BODY>
</HTML>