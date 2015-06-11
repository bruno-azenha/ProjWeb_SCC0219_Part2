<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD><TITLE> 
	Logout
</TITLE></HEAD>

<body>
	<c:redirect url="/Bridgeport/UserServlet?action=logout"/>
</body>


</html>