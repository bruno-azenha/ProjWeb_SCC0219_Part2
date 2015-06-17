<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD><TITLE> 
	test page
</TITLE></HEAD>


<BODY BGCOLOR="white">
	
<jsp:useBean 
		id="userList" 
		class="java.util.ArrayList" 
		scope="session"/>
<jsp:useBean 
		id="userQuery" 
		class="java.util.ArrayList" 
		scope="session"/>
<jsp:useBean 
		id="messageList" 
		class="java.util.ArrayList" 
		scope="session"/>
<jsp:useBean 
		id="reservationList" 
		class="java.util.ArrayList" 
		scope="session"/>

<jsp:useBean 
		id="reservationQuery" 
		class="java.util.ArrayList" 
		scope="session"/>

<jsp:useBean 
		id="unavailableDays" 
		class="java.util.ArrayList" 
		scope="session"/>

<c:choose> 
	<c:when test="${registrationOK == true}">
		<h2>Registration was successfull!</h2>
	</c:when>
	<c:otherwise>
		<h2>Registration failed.</h2>
	</c:otherwise>
</c:choose>

<h2>these are the users</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>Nome</b></td><td><b>email</b></td><td></td></tr>
<c:forEach var="user" items="${userList}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${user.name}</td>
	<td>${user.email}</td>
	
	</tr>
</c:forEach>
</table>

<hr>

<h2>This is the result of the user query</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>Nome</b></td><td><b>email</b></td><td></td></tr>
<c:forEach var="user" items="${userQuery}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${user.name}</td>
	<td>${user.email}</td>
	</tr>
</c:forEach>
</table>

<hr>

<h2>these are the messages</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>date</b></td><td><b>name</b></td><td><b>known</b></td><td></td></tr>
<c:forEach var="message" items="${messageList}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${message.date}</td>
	<td>${message.name}</td>
	<td>${message.known}</td>
	
	</tr>
</c:forEach>
</table>

<hr>

<h2>these are the reservations</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>Name</b></td><td><b>idate</b></td><td></td></tr>
<c:forEach var="reservation" items="${reservationList}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${reservation.user}</td>
	<td>${reservation.checkin}</td>
	<td>${reservation.checkout}</td>
	
	</tr>
</c:forEach>
</table>

<hr>

<h2>these is the reservation Query</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>Name</b></td><td><b>idate</b></td><td></td></tr>
<c:forEach var="reservation" items="${reservationQuery}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${reservation.user}</td>
	<td>${reservation.checkin}</td>
	<td>${reservation.checkout}</td>
	
	</tr>
</c:forEach>
</table>

<hr>

<h2>this is the Unavailable Periods</h2>
<table border=1>
<tr><td><b>ID</b></td><td><b>Start Date</b></td><td><b>End Date</b></td><td></td></tr>
<c:forEach var="tp" items="${unavailableDays}" varStatus="status">
	<tr>
	<td>${status.index}</td>
	<td>${tp.startDate}</td>
	<td>${tp.endDate}</td>
	
	</tr>
</c:forEach>
</table>

<hr>

</BODY>
</HTML>
