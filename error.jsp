<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/reservation.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">
	<title> 
	Sign in error
	</title>
</HEAD>


<BODY BGCOLOR="white">
	<c:choose>	
  <c:when test="${counter<=5}">
   <h2>Sign in Error</h2>
	<p>you entered a invalid user or name. Please go back and try again. Passwords are case sensitive. if you forgot your password Click<a href="recover.jsp"> here!!! </a><br/>

		Notice that you used  ${sessionScope.counter} of 5 attempts to sign in. After 5 failed attempts, you will no longer be able to sign in for 1 hour.</p>

    
	</c:when>
	<c:otherwise >
   <h2>Sign in Error</h2>
	<p>you entered a invalid user or name. you will no longer be able to sign in for 1 hour.</p>
  
	</c:otherwise>
	</c:choose>
</BODY>
</HTML>