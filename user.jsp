<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
		<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/reservation.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/reservation.js"></script>
	<title>Reservation Page</title>
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
						<li><a href="${pageContext.request.contextPath}/user.jsp">Make a Reservation</a></li>
						<li><a href="${pageContext.request.contextPath}/viewr.jsp">View Reservations</a></li>
						<a class="btn navbar-btn btn-primary " href="${pageContext.request.contextPath}/logout.jsp" role="button">log out</a>
					</ul>
				</div>
				
			</div>
		</nav>
	</div>
	<c:if test="${user==null}">
    <c:redirect url = "login.jsp"/>
</c:if>
	<div class = "container">
		<div class="row cover">
			<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part2/Bridgeport/ReservationServlet" method="POST" id = "reservation">
				<input type="hidden" name="action" value="add"/>
				<input type ="hidden" name= "origin" value="reservation"/>
				<h2>Make your reservation</h2>
				<div class = "field">
					<label>Check in Date</label>
					<input class= "form-control" name = "iDate" id= "iDate" readonly='true' required  />
				</div>
				<div class = "field">
					<label>check out Date</label>
					<input class= "form-control" name = "oDate" id= "oDate" readonly='true' required />
				</div>
				<div>
					<label>Number of Adults</label>
					<input class= "form-control" name = "adult" id= "adult" type ="number" value = "1" min="1" max="4" required />
				</div>
				<div >
					<label>Children under three years</label>
					<input class= "form-control" name = "baby" id= "baby" type ="number" value = "0" min ="0" max ="3" required />
				</div>
				<div>
					<label>Children between 3 and 12 years</label>
					<input class= "form-control" name = "child" id= "child" type ="number" value = "0" min ="0" max ="4" required  />
				</div>
				<input class= "btn btn-md btn-success btn-block form-control " type="submit" id="reserve" value ="Confirm Reservation"/>
				
			</form>
		</div>
		<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>

</body>
</html>