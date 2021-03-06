<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<title>Reservations Management Page</title>
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
	<c:if test="${user==null}">
    <c:redirect url = "login.jsp"/>
</c:if>

<div class = "container">
	<div class="row cover">
		<jsp:useBean 
			id="reservationQuery" 
			class="java.util.ArrayList" 
			scope="session"/>

	<h2 class="header" >these are the reservations</h2>
	<form method="POST" action="/ProjWeb_SCC0219_Part3/Bridgeport/ReservationServlet" id="deleteReservation" accept-charset="utf-8">
		<table border=1>
			<tr><td class = "text"></td><td class = "text"><b>ID</b></td><td class = "text"><b>Name</b></td><td class = "text"><b>Checkin</b></td><td class = "text"><b>Checkout</b></td><td class = "text"><b>Adults</b></td><td class = "text"><b>Babies</b></td><td class = "text"><b>Children</b></td></tr>
			<c:forEach var="reservation" items="${reservationQuery}" varStatus="status">
				<tr>
				<td class = "text"><input type="checkbox" name="removeReservation${status.index}" value="${reservation.id}"/></td>
				<td class = "text">${reservation.id}</td>
				<td class = "text">${reservation.userEmail}</td>
				<td class = "text">${reservation.checkin}</td>
				<td class = "text">${reservation.checkout}</td>
				<td class = "text">${reservation.adult}</td>
				<td class = "text">${reservation.baby}</td>
				<td class = "text">${reservation.child}</td>
				</td>
				</tr>
			</c:forEach>
		</table>

		<input type="hidden" name="action" value="delete">
		<input class= "btn btn-md btn-danger btn-block form-control " type="submit" id="reserve" value ="delete selected"/>
	</form>
		</div>
	<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>

</div>
</body>

</html>