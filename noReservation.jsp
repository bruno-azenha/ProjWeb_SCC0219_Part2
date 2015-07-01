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
	No Reservations Page
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
				<c:choose>
					<c:when test="${user.isSuper==false}">
						<div id="navbar" class="collapse navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="${pageContext.request.contextPath}/user.jsp">Make a Reservation</a></li>
								<li><a href="${pageContext.request.contextPath}/viewr.jsp">View Reservations</a></li>
								<a class="btn navbar-btn btn-primary " href="${pageContext.request.contextPath}/logout.jsp" role="button">log out</a>
							</ul>
						</div>
					</c:when>
					<c:when test= "${user.isSuper == true}">
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="${pageContext.request.contextPath}/admin.jsp">Manage Users</a></li>
							<li><a href="${pageContext.request.contextPath}/mreservation.jsp">Manage Reservations</a></li>
							<li><a href="${pageContext.request.contextPath}/mmessage.jsp">Manage Messages</a></li>
							<a class="btn navbar-btn btn-primary " href="${pageContext.request.contextPath}/logout.jsp" role="button">log out</a>
						</ul>
					</div>
					</c:when>
					<c:otherwise>
						<c:redirect url = "login.jsp"/>
					</c:otherwise>
				</c:choose>

			</div>
		</nav>
	</div>
	
	<div class="container">
	<div class="row cover">
	<h2 class = "header">No reservation was found.</h2>
	<p class= "text" >You have no reservation between those dates<br/>
		<c:choose>
			<c:when test="${user.isSuper == true}">
				to go back click <a class = "link" href="${pageContext.request.contextPath}/admin.jsp"> here!!! </a></p>
			</c:when>
			<c:otherwise>
				to go back click <a class = "link" href="${pageContext.request.contextPath}/viewr.jsp"> here!!! </a></p>
			</c:otherwise>
		</c:choose>
	</div>
	<footer>
		   <p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>
</BODY>
</HTML>
