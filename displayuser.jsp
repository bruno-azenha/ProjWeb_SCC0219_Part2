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
	<title>User Management Page</title>
</head>
<body>

<jsp:useBean 
	id="userQuery" 
	class="java.util.ArrayList" 
	scope="session"/>

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

			<h2 class="header">These are the users</h2>
		
			<form method="POST" action="/ProjWeb_SCC0219_Part2/Bridgeport/UserServlet">
				<input type="hidden" name="action" value="delete"/>
				<table border=1>
					<tr><td><b></b></td><td class= "text"><b>ID</b></td><td class= "text"><b>Registration date</b></td><td class= "text"><b>Name</b></td><td class= "text"><b>CPF</b></td><td class= "text"><b>DoB</b></td><td class= "text"><b>Gender</b></td><td class= "text"><b>Civil Status</b></td><td class= "text"><b>City</b></td><td class= "text"><b>State</b></td><td class= "text"><b>Zipcode</b></td><td class= "text"><b>Email</b><td class= "text"><b>Admin</b></td></td></tr>
					<c:forEach var="user" items="${userQuery}" varStatus="status">
					<tr>
						<td class= "text"><input type = "checkbox" name="removeUser${status.index}" value="true"/></td>
						<td class= "text">${status.index}</td>
						<td class= "text">${user.regDate}</td>
						<td class= "text">${user.name}</td>
						<td class= "text">${user.cpf}</td>
						<td class= "text">${user.dob}</td>
						<td class= "text">${user.gender}</td>
						<td class= "text">${user.civilStatus}</td>
						<td class= "text">${user.city}</td>
						<td class= "text">${user.state}</td>
						<td class= "text">${user.zip}</td>
						<td class= "text">${user.email}</td>
						<td class= "text">${user.isSuper}</td>
					</tr>
					</c:forEach>
				</table>	
				<input class= "btn btn-md btn-danger btn-block form-control " type="submit" id="user" value ="delete selected"/>
			</form>
		</div>

		<footer>
		   <p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
		</footer>
		</div>
	
</body>
</html>