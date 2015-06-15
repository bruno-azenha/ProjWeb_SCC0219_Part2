<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/reservation.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/ajax-scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test.css">
	<title>Display Reservations</title>
</head>
<body fontcolor = "white">
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
						<li><a href="${pageContext.request.contextPath}/cancelr.jsp">Cancel Reservations</a></li>
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
		<jsp:useBean 
			id="reservationQuery" 
			class="java.util.ArrayList" 
			scope="session"/>

	<h2>these are the reservations</h2>
	<form method="POST" action="/ProjWeb_SCC0219_Part2/Bridgeport/ReservationServlet" id="deleteReservation">
		<table border=1>
			<tr><td><b>ID</b></td><td><b>Name</b></td><td><b>idate</b></td><td><b>odate</b></td><td><b>adult</b></td><td><b>baby</b></td><td><b>child</b></td><td></td></tr>
			<c:forEach var="reservation" items="${reservationQuery}" varStatus="status">
				<tr>
				<td><input type="checkbox" name="removeReservation${status.index}" value="true"/></td>
				<td>${status.index}</td>
				<td>${reservation.user}</td>
				<td>${reservation.checkin}</td>
				<td>${reservation.checkout}</td>
				<td>${reservation.adult}</td>
				<td>${reservation.baby}</td>
				<td>${reservation.child}</td>
				</td>
				</tr>
			</c:forEach>
		</table>

		<input type="hidden" name="action" value="delete">
		<input class= "btn btn-md btn-danger btn-block form-control " type="submit" id="reserve" value ="delete selected"/>
	</form>
		</div>

</div>
</body>

</html>