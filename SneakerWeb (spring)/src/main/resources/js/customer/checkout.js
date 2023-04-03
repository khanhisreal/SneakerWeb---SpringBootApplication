function updateQuantity(_baseUrl, _productId, _quantity) {
	// tạo javascript object để binding với data bên phía controller  
	var requestBody = {
		productId: _productId,
		quantity: _quantity
	};
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: _baseUrl + "/ajax/increaseItems", 	   //->request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json

		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			let prevQuantity = ($(`#quantity${_productId}`).text());//lấy text (ở đây là quantity) 
			$(`#quantity${_productId}`).html(parseInt(prevQuantity) + _quantity);// lay cai text tren cong hoac tru 1
			$("#amount").html(jsonResult.totalItems);
			location.reload();
			// console.log($(`#quanlity${_productId }`));
		},
		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
			alert("error");
		}
	});
}

function deleteItem(_baseUrl, _productId) {

	// tạo javascript object để binding với data bên phía controller  
	var requestBody = {
		productId: _productId
	};
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: _baseUrl + "/ajax/deleteItems", 	   //->request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json

		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			location.reload();
			$("#amount").html(jsonResult.totalItems);
		},
		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
			alert("error");
		}

	});
}