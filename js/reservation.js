$(document).ready(function() {
	
	 var d = new Date();
     var minInDate;
	 
	 minInDate = new Date(d.getFullYear(), d.getMonth(), d.getDate()+2);
	 
	$("#iDate").datepicker({
		minDate: minInDate,
		dateFormat: "dd/mm/yy",
	});

	$("#oDate").datepicker({
		dateFormat: "dd/mm/yy",
	});
	
	$("#iDate").change(function() {

		var parts = $(this).val().split('/');
		
		var minOutDate = new Date(parseInt(parts[2]), parseInt(parts[1]), parseInt(parts[0])+2);
		console.log($(this).val());
		console.log(minOutDate);

		$('#oDate').datepicker('option', 'minDate', minOutDate);
		$("#oDate").val("");
		$("#oDate").removeAttr("disabled");

	
	});
	
	$("#oDate").change(function() {
		removeError($("#iDate"));
	});
	
	$("#reservation").submit(function (event){
		if ($("#oDate").val() != "" && $("#iDate").val() != ""){
			//removeError($("#iDate"));
			localStorage.setItem("iDate",$("#iDate").datepicker({ dateFormat: 'dd-mm-yy' }).val());
			localStorage.setItem("oDate",$("#oDate").datepicker({ dateFormat: 'dd-mm-yy' }).val());
			localStorage.setItem("adults",$("#adult").val());
			localStorage.setItem("baby",$("#baby").val());
			localStorage.setItem("child",$("#child").val());
		}
		else{
			displayError($("#iDate"), "Please fill in both dates.");
			event.preventDefault();
		}
		
	});
	
});

window.onload = function(){
 
 var d = new Date();
 var minInDate;
 
 if(d.getMonth()<10){
 	minInDate = d.getFullYear()+"-0"+(d.getMonth()+1)+"-"+(d.getDate()+2);	
 }
 else
 	minInDate = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate()+2);
 

$("#iDate").attr("min",minInDate);
$("#oDate").attr("disabled", "disabled");


};
