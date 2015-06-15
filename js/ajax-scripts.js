$( document ).ready(function() {

	$("#byEmail").submit(function(e){
		alert("Entrou no js!");
		alert($(this).serialize())
		$.ajax({
			url		: $(this).attr('action'),
			type	: $(this).attr('method'),
			data	: $(this).serialize(),
			success : function( response ) {
				alert(response);
				$("#searchResponse").html(response);
			}
		});

		e.preventDefault();
	});

	$("#byDate").submit(function(e){
		alert("Entrou no js!");
		$.ajax({
			url		: $(this).attr('action'),
			type	: $(this).attr('method'),
			data	: $(this).serialize(),
			success : function( response ) {
				alert( "response" );
				$("#searchResponse").html(response);
			}
		});
		e.preventDefault();
	});
});