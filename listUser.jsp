<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" session="true" isErrorPage="false"%>

<html>
	<head charset="UTF-8">
	
	</head>
	
	<body>
		
		<jsp:useBean
		  id="User"
		  class="Bridgeport.User"
		  scope="session"/>
		
		Name: <jsp:getProperty
				  name="User"
				  property="name"/>
		CPF: <jsp:getProperty
				  name="User"
				  property="cpf"/>
		Date of Birth: <jsp:getProperty
				  name="User"
				  property="dob"/>
		Gender: <jsp:getProperty
				  name="User"
				  property="gender"/>
		Civil Status: <jsp:getProperty
				  name="User"
				  property="civilStatus"/>
		City: <jsp:getProperty
				  name="User"
				  property="city"/>                
		State: <jsp:getProperty
				  name="User"
				  property="state"/>
		Zip: <jsp:getProperty
				  name="User"
				  property="zip"/>
		Email: <jsp:getProperty
				  name="User"
				  property="email"/>
		Password: <jsp:getProperty
				  name="User"
				  property="password"/>
				  
		<% session.removeAttribute("User"); %>
		
	</body>
	
	
</html>