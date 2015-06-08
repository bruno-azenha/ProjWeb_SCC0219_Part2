$(document).ready(function(){
	$("#name").focusout(function(event){
		var n = $("#name");
		var name = n.val();
		
		if(validateName(name)){
			removeError(n);
		}
		else
			displayError(n,"name has to start with a letter and has to contain 3 letters or more");
			

	})
	$("#email").focusout(function(event){
		var e = $("#email");
		var email = e.val();
		
		if(validaEmail(e)){
			removeError(e);
		}
		else
			displayError(e,"invalid e-mail");
			

	})

	$("#phone").focusout(function(event){
		var p = $("#phone");
		var phone= p.val();
			
		if(p.val().length==0 || validatePhone(phone) ){
			removeError(p);
			
		}
		else
			displayError(p,"invalid phone");
			
			

	})

	$("#contact").submit(function(event){ 	
		c = $("#conheceu");
		n = $("#name");
		e = $("#email");
		p = $("#phone");
		m = $("#message");
		phoneFlag = false;
	
	var checked = $('input[type="checkbox"]').is(":checked");
	
	if(p.val().length==0 || validatePhone(p.val()) ){
			phoneFlag= true;
			
		}
		
    
    	
	if(!validateName(n.val()) || !validaEmail(e)|| !phoneFlag || !checked){
			event.preventDefault();
			if (!checked){
    	displayError(c,"Please check at least one checkbox");
        
            }
	}

	else {
		
    	removeError(c);

    	 var conheceu = new String();
        $(':checkbox:checked').each(function(i){
          conheceu += $(this).val()+';';
          });
        //alert(conheceu);

        localStorage.setItem("name",n.val());
    	localStorage.setItem("email",e.val());
    	localStorage.setItem("phone",p.val());
    	localStorage.setItem("conheceu",conheceu);
    	localStorage.setItem("message",m.val());


    	
  	}
  	})
})