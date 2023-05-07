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

function clickVoucher(_baseUrl, voucherId) {
    const checkbox = document.getElementById("voucher-checkbox-" + voucherId)
    if (checkbox.checked) chooseVoucher(_baseUrl, voucherId)
    else unchooseVoucher(_baseUrl, voucherId)
}

function resetFinalPrice(_baseUrl) {
     jQuery.ajax({
        url: _baseUrl + "/ajax/finalPrice", 	   //->request mapping định nghĩa bên controller
        type: "post",					   //-> method type của Request Mapping
        contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object

        dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
        success: function(jsonResult) {    // gọi ajax thành công
            const finalPrices = document.getElementsByClassName("final-price-value")
            for (var i = 0; i < finalPrices.length; i++)
                finalPrices[i].innerText = jsonResult.result
        },
        error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
            alert("error");
        }
    });
 }

function unchooseVoucher(_baseUrl, voucherId) {
    jQuery.ajax({
		url: _baseUrl + "/ajax/unchooseVoucher", 	   //->request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(voucherId), //-> chuyển 1 javascript object thành string json

		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
		    resetFinalPrice(_baseUrl)
		},
		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
			alert("error");
		}
	});
}

function chooseVoucher(_baseUrl, voucherId) {
    jQuery.ajax({
		url: _baseUrl + "/ajax/chooseVoucher", 	   //->request mapping định nghĩa bên controller
		type: "post",					   //-> method type của Request Mapping
		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
		data: JSON.stringify(voucherId), //-> chuyển 1 javascript object thành string json

		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {    // gọi ajax thành công
                resetFinalPrice(_baseUrl)
		},
		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
			alert("error");
		}
	});
}
