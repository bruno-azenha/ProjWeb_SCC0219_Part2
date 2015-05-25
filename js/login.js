$(document).ready(function() {
	
	$("#inputEmail").focusout(function(event){
		var email = $("#inputEmail");
		if (validaEmail(email) == false) {
			displayError(email,"invalid e-mail");
		}
		else {
			removeError(email);
			
		}
	})

	$("#login").submit(function(event){
		var email = $("#inputEmail");
		var pass = $("#password");
		if (!validaEmail(email)) {
			
			event.preventDefault();
		}
		else
			localStorage.setItem("email",email.val());
			localStorage.setItem("password",pass.val());


		
	});		
})
