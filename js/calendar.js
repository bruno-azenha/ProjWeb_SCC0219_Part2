$(document).ready(function() {
	
	 	 
	$("#iDate").datepicker({
		dateFormat: "dd/mm/yy",
	});

	$("#oDate").datepicker({
		dateFormat: "dd/mm/yy",
	});
	
	$("#iDate").change(function() {
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
