<h2>These are the users</h2>
<jsp:useBean 
		id="userQuery" 
		class="java.util.ArrayList" 
		scope="session"/>

<form method="POST" action="/ProjWeb_SCC0219_Part2/Bridgeport/UserServlet">
	<input type="hidden" name="action" value="delete"/>
	<table border=1>
		<tr><td><b></b></td><td><b>ID</b></td><td><b>registration date</b></td><td><b>name</b></td><td><b>cpf</b></td><td><b>DoB</b></td><td><b>gender</b></td><td><b>civilStatus</b></td><td><b>city</b></td><td><b>state</b></td><td><b>zipcode</b></td><td><b>email</b><td><b>admin</b></td></td><td></td></tr>
		<c:forEach var="user" items="${userQuery}" varStatus="status">
		<tr>
			<td><input type = "checkbox" name="removeUser${status.index}" value="true"/></td>
			<td>${status.index}</td>
			<td>${userQuery.get(status.index).name}</td>
			<td>${user.regDate}</td>
			<td>${user.cpf}</td>
			<td>${user.dob}</td>
			<td>${user.gender}</td>
			<td>${user.civilStatus}</td>
			<td>${user.city}</td>
			<td>${user.state}</td>
			<td>${user.zip}</td>
			<td>${user.email}</td>
			<td>${user.isSuper}</td>
		</tr>
		</c:forEach>
	</table>	
	<input class= "btn btn-md btn-danger btn-block form-control " type="submit" id="user" value ="delete selected"/>
</form>