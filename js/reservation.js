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
		var date = new Date($(this).val());
		var minOutDate = new Date(date.getFullYear(), date.getDate()+2, date.getMonth());
        console.log(date);
        console.log(minOutDate);
        
        console.log($(this).val());
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
