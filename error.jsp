<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD><TITLE> 
	Sign in error
</TITLE></HEAD>


<BODY BGCOLOR="white">

<h2>Sign in Error</h2>
	<p>you entered a invalid user or name. Please go back and try again. Passwords are case sensitive. if you forgot your passwored Click<a> here!!! </a><br/>

Notice that you used  ${sessionScope.counter} of 5 attempts to sign in. After 5 failed attempts, you will no longer able to sign in for 1 hour.</p>
</BODY>
</HTML>