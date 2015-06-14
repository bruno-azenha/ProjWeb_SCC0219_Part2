<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/reservation.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test.css">

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
			<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part2/Bridgeport/RecoveryServlet" method="GET" id = "recovery">
				
				
				<h2>Password Recovery</h2>
				<p>please enter your registered email account<br>
				a new password will be sent to it
				</p>
				<div>
					<input  type = "text" class= "form-control" name = "email" id= "email" required  />
				</div>
				<input class= "btn btn-md btn-warning btn-block form-control " type="submit" id="serch" value ="send request"/>
				
			</form>
		<div id= "searchResponse">
				
		</div>
		</div>
	</div>
	
</body>
</html>