<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
		<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">

	<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
	<title>User Management Page</title>
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
						<li><a href="${pageContext.request.contextPath}/admin.jsp">Manage Users</a></li>
						<li><a href="${pageContext.request.contextPath}/mreservation.jsp">Manage Reservations</a></li>
						<li><a href="${pageContext.request.contextPath}/mmessage.jsp">Manage Messages</a></li>
						<a class="btn navbar-btn btn-primary " href="${pageContext.request.contextPath}/logout.jsp" role="button">log out</a>
					</ul>
				</div>
				
			</div>
		</nav>
	</div>
	<c:if test="${user.isSuper==false}">
    <c:redirect url = "login.jsp"/>
</c:if>
	<div class = "container">
		<div class="row cover">

		<h1  class = " header text-center"> Search users</h1>
		<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part2/Bridgeport/UserServlet" method="GET" id = "byEmail" accept-charset="utf-8">
			<input type="hidden" name="action" value="searchEmail"/>
			<div>
				<label>email</label>
				<input class= "form-control" name = "email" id= "email" required  />

			</div>
			<input class= "btn btn-md btn-success btn-block form-control " type="submit" id="search" value ="Search by email"/>			
		</form>
		
		<form class = "col-md-6 form" action="/ProjWeb_SCC0219_Part2/Bridgeport/UserServlet" method="GET" id = "byDate" accept-charset="utf-8">
			<input type="hidden" name="action" value="searchDate"/>
			<div >
				<label>Start Date</label>
				<input class= "form-control" name = "regDateBegin" id= "iDate" readonly='true' required  />
			</div>
			<div >
				<label>End Date</label>
				<input class= "form-control" name = "regDateEnd" id= "oDate" readonly='true' required />
			</div>
				
			<input class= "btn btn-md btn-success btn-block form-control " type="submit" id="serch" value ="Search by date"/>
				
			</form>
		
		<div id= "searchResponse">
				
		</div>
	</div>
			<footer>
		   <p>&copy; 2015 designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
		</footer>
		</div>
	
</body>
</html>