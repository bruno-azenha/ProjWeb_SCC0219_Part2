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
		<jsp:useBean 
		id="messageList" 
		class="java.util.ArrayList" 
		scope="session"/>
		<h2 class = "header" >these are the messages</h2>
	<table border=1>
		<tr><td class="text"><b>ID</b></td><td class="text"><b>date</b></td><td class="text"><b>name</b></td><td class="text"><b>email</b></td><td class="text"><b>mobile</b></td><td class="text"><b>known</b></td><td class="text"><b>message</b></td><td class="text"></td></tr>
		<c:forEach var="message" items="${messageList}" varStatus="status">
		<tr>
		<td class="text"><input type = "checkbox"</td>
		<td class="text">${status.index}</td>
		<td class="text">${message.date}</td>
		<td class="text">${message.name}</td>
		<td class="text">${message.email}</td>
		<td class="text">${message.mobile}</td>
		<td class="text">${message.known}</td>
		<td class="text">${message.message}</td>
		</tr>
		</c:forEach>
</table>	
	<input class= "btn btn-md btn-danger btn-block form-control " type="submit" id="message" value ="delete selected"/>
		</div>

</div>
		</div>
			<footer>
		   <p>&copy; 2015 designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
		</footer>
		</div>
	
</body>
</html>