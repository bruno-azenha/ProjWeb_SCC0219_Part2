<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
		<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/signup.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/signup.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui/jquery-ui.min.css">
	
	<title>Sign up</title>
</head>
<body>
	<div class= "navbar-wrapper">
		<nav class="navbar navbar-default" >
			<div class ="container">
				<div class = "navbar-header ">
					<a class ="navbar-brand" href= "${pageContext.request.contextPath}">Bridgeport Hotel</a>
				</div>
				<div id="navbar" class="">
					<ul class="nav navbar-nav">
						<li class=""><a href="index.jsp">Home</a></li>
						<li><a href="#register">register</a></li>
						<li><a href="contact.jsp">Contact</a></li>
						<a class="btn btn-md btn-primary navbar-btn " href="login.jsp" role="button">log in</a>	                
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container cover">
		<div class= "col-md-12">
		
			<form  class = "form" action="/ProjWeb_SCC0219_Part3/Bridgeport/UserServlet" method="POST" id= "register" autocomplete = "off" accept-charset="utf-8">
				<h1>Register</h1>
				<div class="form-group">
					<label for ="name">Full Name: </label>
					<input type="hidden" name="origin" value="user">
					<input  class="form-control" name = "name" id = "name" type = "text" required/>
				</div>
				<div class="form-group">
					<label for ="cpf">CPF: </label>
					<input class = "form-control" name = "cpf" id = "cpf" type="text" maxlength = "11" placeholder = "only numbers" required/>
				</div>
				<div class = "form-group">
					<label for = "datanasc">Date of Birth</label><br>
					<input name = "dob" id = "dob" readonly = 'true' required />
				</div>
				<div >
					<label for = "gender">Gender: </label>
					<input name= "gender" type = "radio" value = "Masc" required/>Male
					<input name= "gender" type = "radio" value = "Fem" required/>Female
					<input name= "gender" type = "radio" value = "None" required/>Rather not state
				</div>
				<div class="form-group">
					<label for = "civilStatus">Marital Status: </label>
					<input name= "civilStatus" type = "radio" value = "Solteiro" required/>Single
					<input name= "civilStatus" type = "radio" value = "Casado" required/>Married
					<input name= "civilStatus" type = "radio" value = "Outros" required/>Other
				</div>
				<div class="form-group">
					<label for = "city"> City: </label>
					<input class = "form-control field" name = "city" id = "city" type = "text" required/>
					<label for = "state">State: </label>
					<select name = "state" id = "state" >
						<option>AC</option>			<option>AL</option>		<option>AP</option>			
						<option>AM</option>			<option>BA</option>		<option>CE</option>
						<option>DF</option>			<option>ES</option>		<option>GO</option>
						<option>MA</option>			<option>MT</option>		<option>MS</option>
						<option>MG</option>			<option>PA</option>		<option>PB</option>
						<option>PE</option>			<option>PI</option>		<option>PR</option>
						<option>RJ</option>			<option>RN</option>		<option>RO</option>
						<option>RR</option>			<option>RS</option>		<option>SC</option>
						<option>SE</option>			<option>SP</option> 	<option>TO</option>
					</select>
				</div>
				<div class = "form-group">
					<label for = "zip">Zipcode: </label>
					<input class = "form-control" id = "zip" name = "zip" type = "text" maxlength = "8" placeholder = "only numbers" required/>
				</div>
				<div class = "form-group">
					<label for = "email">E-mail: </label>
					<input class = "form-control field" type = "text" id = "email" name = "email" required/>
				</div>
				<div class = "form-group">
					<label for = "password">Password: </label>
					<input class = "form-control" type = "password" id = "password" name = "password"/>
					<p class = "forca" id = "forcaDaSenha"></p>
				</div>	
				<div class = "form-group">
					<label for = "passConfirmation">Password Confimation: </label>			
					<input class = "form-control" type = "password" id = "passConfirmation" required/>
				</div>
				<input type = "hidden" name = "action" value = "add"/>
					<input class = "btn btn-lg btn-primary btn-block" type = "submit" value = "Register" id = "register"/>
			</form>		
		</div>
	</div>
	<div class = "container">
		<footer>
		<p>&copy; 2015 Designed by Bruno Azenha &amp; Clayton de Oliveira, All rights reserved</p>
	</footer>
	</div>
	</html>

</body>
</html>


