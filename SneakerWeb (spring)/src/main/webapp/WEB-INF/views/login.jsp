<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="${base}/css/login.css">
</head>
<body>
	<div class="container">
		<form method="post" action="${base }/login_processing_url">
			<h1>Log in</h1>
			<c:if test="${not empty param.login_error}">
				<div class="alert">
					<p>Log in attempt was not successful! Try again</p>
				</div>
			</c:if>
			<div class="inputs">
				<input class="element" name="username" type="text" placeholder="Username">
				<input class="element" name="password" type="password" placeholder="Password">
				<div class="remember-me">
                    <label for="checkbox">Remember me:</label>
                    <input type="checkbox" name="remember-me" id="">
                </div>
				<button class="element" type="submit">Login</button>
			</div>
			<a href="">Create your account</a>
		</form>
	</div>
</body>
</html>