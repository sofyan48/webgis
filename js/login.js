$(document).ready(function(){
	$("#loginModal").modal('show');
	$("#btnLogin").click(function(){
		$("#loginForm").submit(function(e)
		{
			var postData = $(this).serializeArray();
			var formURL = $(this).attr("action");
			$.ajax(
			{
				url : formURL,
				type: "POST",
				data : postData,
				success:function(data, textStatus, jqXHR) 
					{
						if (data != "false"){
							$("#loginModal").modal('hide');
							window.location.replace('index.php');
						}
						else{
							alert("Penyusup :p ");
						}
					},
				error: function(jqXHR, textStatus, errorThrown) 
					{
						
					}
			});
				e.preventDefault();
		});
				
		$("#loginForm").submit();
	});
});
