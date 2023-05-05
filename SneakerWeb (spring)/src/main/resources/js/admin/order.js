function approve(url_, order_id) {
  // Display confirmation dialog to the user
  var result = window.confirm("Do you want to approve the order?");

  if (result) {
	var data = {
		id: order_id,
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:  url_ + "/admin/order/approve",//-> request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(data), //-> chuyển 1 javascript object thành string json
	
		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			alert(jsonResult.statusMessage);
			location.reload();
		},								   // gọi ajax thất bại
		error: function(jqXhr, textStatus, errorMessage) { 
			alert("cannot approve order");
		}
	});
  } else {
    // Do nothing
    return;
  }
}


function disapprove(url_, order_id) {
  // Display confirmation dialog to the user
  var result = window.confirm("Do you want to disapprove the order?");

  if (result) {
	var data = {
		id: order_id,
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:  url_ + "/admin/order/disapprove",//-> request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping	
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(data), //-> chuyển 1 javascript object thành string json
	
		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
			alert(jsonResult.statusMessage);
			location.reload();
		},								   // gọi ajax thất bại
		error: function(jqXhr, textStatus, errorMessage) { 
			alert("cannot disapprove order");
		}
	});
  } else {
    // Do nothing
    return;
  }
}
