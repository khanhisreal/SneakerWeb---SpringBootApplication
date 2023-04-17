function deleteFromList(productId){
	// Tạo javascript object
	console.log(productId);
	
	var data = {
		id: productId,
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:  "/admin/product/management/delete",//-> request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(data), //-> chuyển 1 javascript object thành string json
	
		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			alert(jsonResult.statusMessage);
			location.reload();
		},								   // gọi ajax thất bại
		error: function(jqXhr, textStatus, errorMessage) { 
			alert("error");
		}
	});
}

function test() {
	console.log("123 test");
}
