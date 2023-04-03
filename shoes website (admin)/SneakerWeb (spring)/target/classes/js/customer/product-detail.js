//Cho giỏ hàng
function AddToCart(_baseurl,_productId, _quantity) {
	var requestBody = {
		productId: _productId,
		quantity: _quantity,
	};

	jQuery.ajax({
		url: _baseurl + "/ajax/addToCart",
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json
		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			$("#amount").html(jsonResult.totalItems);
		},								   // gọi ajax thất bại
		error: function(jqXhr, textStatus, errorMessage) {
			alert("error");
		}
	});
}