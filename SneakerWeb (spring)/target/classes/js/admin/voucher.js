function deleteVoucher(url_, voucherId) {
	var data = {
		id: voucherId,
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:  url_ + "/admin/voucher/delete",//-> request mapping định nghĩa bên controller
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
