// Verifica se um email é válido de acordo
// com as especificações do trabalho.
function validaEmail(email){ 
	var pattern = new RegExp("^[a-z]([a-z0-9\-\_]*\.?[a-z0-9\-\_]+)*\@[a-z0-9\-\_]+\.[a-z\-\_\.]*[a-z0-9\-\_]+$");
	if (pattern.test(email.val()) == false) {
		return false;
	}
	else 
		return true;
}

// Verifica a qualidade da senha
// Retorna uma string, podendo ser
// 'pequena', 'fraca', 'media' ou 'forte'
function verificaSenha(senha){
	
	var tipoSenha;
	
	// Verifica se eh muito curta
	var smallPattern = new RegExp("^.{0,5}$");
	if (smallPattern.test(senha)){
		return (-1);
	}
	
	// Verifica se eh muito grande
	var largePattern = new RegExp("^.{13,}$");
	if (largePattern.test(senha)){
		return (-1);
	}
	
	// Verifica se a senha eh fraca
	var weakPattern = new RegExp("^(.{6}|[a-zA-Z0-9]+)$");
	if (weakPattern.test(senha)){
		return ("fraca");
	}
	
	// Para verificar se eh media, precisa checar 
	// se possui char especiais, letras e numeros
	var temLetrasPattern = new RegExp("[a-zA-z]");
	var temNumerosPattern = new RegExp("[0-9]");
	var temSpecialPattern = new RegExp("[^a-zA-Z0-9]");
	
	if (temLetrasPattern.test(senha)){
		if (temNumerosPattern.test(senha)){
			if (temSpecialPattern.test(senha)){
				tipoSenha = "media";
			}
		}
	}
	
	// Para verificar se eh forte, precisa checar
	// se possui letras maiusculas, minusculas eh
	// pelo menos 2 special char diferentes.
	var temMinusculasPattern = new RegExp("[a-z]");
	var temMaiusculasPattern = new RegExp("[A-Z]");
	
	if (tipoSenha == "media"){
		var specChar = temSpecialPattern.exec(senha);
		var temOutroSpecCharacterpattern = new RegExp("[^a-zA-Z0-9" + specChar + "]");
		if (temOutroSpecCharacterpattern.test(senha)){
			if (temMaiusculasPattern.test(senha)){
				if (temMinusculasPattern.test(senha)){
					return "forte";
				}
			}
		}
	} 
	return "media"
}

//simple method to check if date1 is greater than date2
// uses two Date objects to do the comparison
function validateDate(date1,date2){

	if (date1 > date2){
		return true;
	}
	else return false;
}

//validate name as the specified rules
function validateName(name){
	var count = 0;
	count = name.length;
	var reName = new RegExp("^[a-z]|[A-Z]");
	
  if (reName.test(name.charAt(0)) && (count>2)){
  	return true;
  }
  	
  else
  	return false;
}

//validate full name as the specified rules
function validateFullName(fName){

	var name= fName.split(" ");
	if (name.length<2)
		return false;
	for(i=0;i<name.length;i++){
		if(!validateName(name[i]))
			return false;
	}
	return true;
}

//validate CPF as seen in the reference below
//reference: http://www.receita.fazenda.gov.br/aplicacoes/atcta/cpf/funcoes.js

function validateCPF(cpf) { 

	var soma =0; 
	var resto; 
	
	if (cpf == "00000000000") return false;
	 for (i=1; i<=9; i++){
	 	soma = soma + parseInt(cpf.substring(i-1, i)) * (11 - i);
	 }
	resto = (soma * 10) % 11;

	if (resto == 10)
	 resto = 0; 
	
	if (resto != parseInt(cpf.substring(9, 10)) ) 
	 	return false; 
	 
	 soma = 0; 
	 for (i = 1; i <= 10; i++) 
	 	soma = soma + parseInt(cpf.substring(i-1, i)) * (12 - i); 
	 
	 resto = (soma * 10) % 11; 
	 if (resto == 10) 
	 	resto = 0; 
	 
	 if (resto != parseInt(cpf.substring(10, 11) ) ) 
	 	return false; 
	 
	 return true; 
}

//display error receives a reference and a string message
//applies the error class into the given id
function displayError(id,msg){
	id.next().remove(".errorMsg");
	id.removeClass("accept");
	id.addClass("error");
	id.after("<span class = errorMsg>"+msg+"</span>");
	
}
//remove the error class above
function removeError(id){
	id.removeClass("error");
	id.next().remove(".errorMsg");
	

}
//applies the accept class of css.error
function accept(id){
	id.addClass("accept");

}

// display the strength of the password
function displayPasswordStrength(msg){
	$("#forcaDaSenha").html(msg);
}

//verify if the inout password are equal.
function validatePass(pass1,pass2){
	if (pass1 != pass2 || verificaSenha(pass1) == -1){
		return false;
	}
	return (true);

}

// Função que verifica se um telefone é válido de 
// acordo com as especificações do trabalho.
function validatePhone(phone){ 
	var pattern = new RegExp("^([(][0-9]{2}[)][0-9]{5}[-][0-9]{2}[-][0-9]{2})$");
	
	if (pattern.test(phone) == false) {
		return false;
	}
	else 
		return true;
}

//reference http://www.devmedia.com.br/dicas-validando-cep/833
function validateCEP(cep){
	var zip = cep.charAt(0)+cep.charAt(1)+cep.charAt(2);

	if(zip<10){

		return false;
	}
	
	if( (zip >=10) && (zip <=199)) {
		// $("#state").val("SP");
		if ($("#state").val() != "SP"){
			displayError($("#zip"), "Esse CEP é de SP. Será que você errou?");
			return false;
		}
		return true;
	}
	
	if( (zip >=200) && (zip <=289)) {
		//$("#state").val("RJ");
		if ($("#state").val() != "RJ"){
			displayError($("#zip"), "Esse CEP é de RJ. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=790) && (zip <=799)) {
		//$("#state").val("MS");
		if ($("#state").val() != "MS"){
			displayError($("#zip"), "Esse CEP é de MS. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=300) && (zip <=399)) {
		//$("#state").val("MG");
		if ($("#state").val() != "MG"){
			displayError($("#zip"), "Esse CEP é de MG. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=780) && (zip <=788)) {
		//$("#state").val("MT");
		if ($("#state").val() != "MT"){
			displayError($("#zip"), "Esse CEP é de MT. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=699) && (zip <=699)) {
		//$("#state").val("AC");
		if ($("#state").val() != "AC"){
			displayError($("#zip"), "Esse CEP é de AC. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=570) && (zip <=579)) {
		//$("#state").val("AL");
		if ($("#state").val() != "AL"){
			displayError($("#zip"), "Esse CEP é de AL. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=690) && (zip <=698)) {
		//$("#state").val("AM");
		if ($("#state").val() != "AM"){
			displayError($("#zip"), "Esse CEP é de AM. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=689) && (zip <=689)) {
		//$("#state").val("AP");
		if ($("#state").val() != "AP"){
			displayError($("#zip"), "Esse CEP é de AP. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=400) && (zip <=489)) {
		//$("#state").val("BA");
		if ($("#state").val() != "BA"){
			displayError($("#zip"), "Esse CEP é da belíssima Bahia. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=600) && (zip <=639)) {
		//$("#state").val("CE");
		if ($("#state").val() != "CE"){
			displayError($("#zip"), "Esse CEP é de CE. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=700) && (zip <=736)) {
		//$("#state").val("DF");
		if ($("#state").val() != "DF"){
			displayError($("#zip"), "Esse CEP é de DF. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=290) && (zip <=299)) {
		//$("#state").val("ES");
		if ($("#state").val() != "ES"){
			displayError($("#zip"), "Esse CEP é de ES. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=737) && (zip <=769)) {
		//$("#state").val("GO");
		if ($("#state").val() != "GO"){
			displayError($("#zip"), "Esse CEP é de GO. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=650) && (zip <=659)) {
		//$("#state").val("MA");
		if ($("#state").val() != "MA"){
			displayError($("#zip"), "Esse CEP é de MA. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=660) && (zip <=688)) {
		//$("#state").val("PA");
		if ($("#state").val() != "PA"){
			displayError($("#zip"), "Esse CEP é de PA. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=580) && (zip <=589)) {
		//$("#state").val("PB");
		if ($("#state").val() != "PB"){
			displayError($("#zip"), "Esse CEP é de PB. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=500) && (zip <=569)) {
		//$("#state").val("PE");
		if ($("#state").val() != "PE"){
			displayError($("#zip"), "Esse CEP é de PE. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=640) && (zip <=649)) {
		//$("#state").val("PI");
		if ($("#state").val() != "PI"){
			displayError($("#zip"), "Esse CEP é de PI. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=800) && (zip <=879)) {
		//$("#state").val("PR");
		if ($("#state").val() != "PR"){
			displayError($("#zip"), "Esse CEP é de PR. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=590) && (zip <=599)) {
		//$("#state").val("RN");
		if ($("#state").val() != "RN"){
			displayError($("#zip"), "Esse CEP é de RN. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=789) && (zip <=789)) {
		//$("#state").val("RO");
		if ($("#state").val() != "RO"){
			displayError($("#zip"), "Esse CEP é de RO. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=693) && (zip <=693)) {
		//$("#state").val("RR");
		if ($("#state").val() != "RR"){
			displayError($("#zip"), "Esse CEP é de RR. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=900) && (zip <=999)) {
		//$("#state").val("RS");
		if ($("#state").val() != "RS"){
			displayError($("#zip"), "Esse CEP é de RS. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=880) && (zip <=899)) {
		//$("#state").val("SC");
		if ($("#state").val() != "SC"){
			displayError($("#zip"), "Esse CEP é de SC. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=490) && (zip <=499)) {
		//$("#state").val("SE");
		if ($("#state").val() != "SE"){
			displayError($("#zip"), "Esse CEP é de SE. Será que você errou?");
			return false;
		}
		return true;
	}

	if( (zip >=770) && (zip <=779)) {
		//$("#state").val("TO");
		if ($("#state").val() != "TO"){
			displayError($("#zip"), "Esse CEP é de TO. Será que você errou?");
			return false;
		}
		return true;
	}

}

// Function that capitalizes the first letter of each word in a string
function toTitleCase(str){
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}
