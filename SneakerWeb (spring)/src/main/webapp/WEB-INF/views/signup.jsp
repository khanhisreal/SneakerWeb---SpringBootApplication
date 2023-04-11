<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign up</title>
<link rel="stylesheet" href="${base }/css/signup.css">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="signup-box">
		<h1>Sign up</h1>
		<h4>It's free and only takes a minute</h4>
		<form method="post">
			<label>Username</label> <input type="text" id="idUsername"
				onfocus="this.value=''" required placeholder="Name..."> <label>Email</label>
			<input type="email" id="idEmail" onfocus="this.value=''" required
				placeholder="Email..."> <label>Password</label> <input
				type="password" id="idPassword" onfocus="this.value=''" required
				placeholder="Password..."> <label>Confirm Password</label> <input
				type="password" id="idConfirmPassword" onfocus="this.value=''"
				required placeholder="Confirm password..."> <label>Phone
				Number</label> <input type="number" id="idPhone" onfocus="this.value=''"
				required placeholder="Phone number..."> <label>Address</label>
			<input type="text" id="idShippingAddress" onfocus="this.value=''"
				required placeholder="Address...">
			<button type="button" onclick="test('${base}')">Register</button>
		</form>
		<p>By clicking the Register button, you agree to our Terms and
			Condition</p>
	</div>
	<p class="para-2">
		Already have an account? <a href="${base }/login">Login here</a>
	</p>
</body>
<script type="text/javascript">
	function test(baseUrl) {
		let pass = document.querySelector("#idPassword").value;
		let conf = document.querySelector("#idConfirmPassword").value;
		if (pass === conf) {
			accountRegister(baseUrl);
		} else {
			alert("Input mismatch! Your confirm password does not match your password.");
		}
	}

	function accountRegister(baseUrl) {
		var data = {
			username : jQuery("#idUsername").val(),
			password : jQuery("#idPassword").val(),
			email : jQuery("#idEmail").val(),
			phone : jQuery("#idPhone").val(),
			shippingAddress : jQuery("#idShippingAddress").val()
		};

		jQuery.ajax({
			url: baseUrl + "/register",
			type: "post",					   //-> method type của Request Mapping	
			contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
			data: JSON.stringify(data), //-> chuyển 1 javascript object thành string json
			dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
			success: function(jsonResult) {    // gọi ajax thành công
				alert("Your account \""
						+ jsonResult.username
						+ "\" has been created successfully! Redirecting to the login site.");
				window.location.href = baseUrl + "/login"
			},								   // gọi ajax thất bại
			  error: function(jqXhr, textStatus, errorMessage) {
			        if (jqXhr.responseJSON && jqXhr.responseJSON.errorMessage) {
			            alert(jqXhr.responseJSON.errorMessage);
			        } else {
			            alert("Duplicated username, please try again.");
			        }
			    }
		});
	}
</script>
</html>