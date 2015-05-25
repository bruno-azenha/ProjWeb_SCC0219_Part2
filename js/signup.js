window.onload = function(){
 
 var d = new Date();
 var maxDate;
 
 if(d.getMonth()<10){
 	maxDate = d.getFullYear()+"-0"+(d.getMonth()+1)+"-"+(d.getDate());	
 }
 else
 	maxDate = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate());
 

$("#datanasc").attr("max",maxDate);
	
};

$(document).ready(function(){
	$("#datanasc").datepicker({
		minDate: new Date(1900, 0, 1),
		maxDate: new Date(),
		yearRange: '1900:',
		dateFormat: 'dd/mm/yy'
	});
	
	$("#cpf").focusout(function(event){
		var cpf = $("#cpf");
		
		if(validateCPF(cpf.val()))
			removeError(cpf);
		else
			displayError(cpf,"invalid CPF");
	})

	$("#cep").focusout(function(event){
		var cep = $("#cep");
		var mask = new RegExp("^[0-9]{8}$");
		if(mask.test(cep.val())){
			
			if(validateCEP(cep.val()))
				removeError(cep);
			//else
				//displayError(cep,"invalid CEP");

		}

		else
			displayError(cep,"invalid CEP");
	})

	$("#email").focusout(function(event){
		var email = $("#email");
		if (validaEmail(email) == false) {
			displayError(email,"invalid e-mail");
		}
		else {
			removeError(email);
		}
	})


	$("#name").focusout(function(event){
		$("#name").val(toTitleCase($("#name").val()));
		var name = $("#name");
		
		if(validateFullName(name.val()))
			removeError(name);
		else
			displayError(name,"name has to be at least 2 words long\n each word with 3 characters or more")
	})

	$("#estado").change(function(event){
		var cep = $("#cep").val()
		if (cep != ""){
			if (validateCEP(cep))
				removeError($("#cep"));
		}
	})
	
	
	$("#senha").keyup(function(event){
		var senha = $("#senha").val();
		var forca = verificaSenha(senha);
		if (forca == -1){
			displayError($("#senha"), "A senha deve ter entre 6 e 12 caracteres");
		}
		else {
			displayPasswordStrength(forca);
			removeError($("#senha"));
		}
		
	})

	// Impede o usuário de colar no campo de confirmação de senha
	$("#passConfirmation").bind('paste', function(e) {
        e.preventDefault();
		alert("Você não pode colar nesse campo.");
	})
	$("#passConfirmation").focusout(function(event){
		var pass = $("#senha");
		var conf = $("#passConfirmation");
		if( validatePass(pass.val(),conf.val())){
			removeError(conf);
		}
		else
			displayError(conf,"passwords did not match");


	})


	$("#register").submit(function(event){

		var fName = $("#name");
		var cpf = $("#cpf");
		var data = $("#datanasc");
		var email = $("#email");
		var sexo = $("[name='sexo']:checked");
		var eCivil = $("[name='estadoCivil']:checked");
		var cidade = $("#cidade");
		var estado = $("#estado");
		var cep = $("#cep");
		var senha = $("#senha");
		var senhaC = $("#passConfirmation");
		console.log(validateFullName(fName.val()));
		console.log(validateCPF(cpf.val()));
		console.log(validateCEP(cep.val()));
		console.log(validaEmail(email));
		console.log(senha.val());
		console.log(senhaC.val());
		console.log(validatePass(senha.val(),senhaC.val()));
		

		if ((!validateFullName(fName.val())) || (!validateCPF(cpf.val())) || (!validateCEP(cep.val()))
		 	|| (!validaEmail(email)) ||(!validatePass(senha.val(),senhaC.val()))) {
			event.preventDefault();
		}
		else {

			localStorage.setItem("fName",fName.val());
			localStorage.setItem("cpf",cpf.val());
			localStorage.setItem("dOB",data.val());
			localStorage.setItem("sexo",sexo.val());
			localStorage.setItem("eCivil",eCivil.val());
			localStorage.setItem("cidade",cidade.val());
			localStorage.setItem("estado",estado.val());
			localStorage.setItem("cep",cep.val());
			localStorage.setItem("email",email.val());
			localStorage.setItem("senha",senha.val());

		
		}
		
	});		



	
})



