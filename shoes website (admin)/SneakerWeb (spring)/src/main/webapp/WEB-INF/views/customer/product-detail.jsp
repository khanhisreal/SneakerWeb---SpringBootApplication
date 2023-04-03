<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>


<html>
<head>
<link rel="stylesheet"
	href="${base}/css/customer/fontawesome/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="${base }/css/customer/product-detail.css">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Product detail</title>
</head>
<body>
	<header>
		<div id="menu-bar" class="fa fa-bars"></div>
		<a href="${base }/homepage" class="logo">Ksneaker</a>
		<nav class="navbar">
			<a href="#home">Home</a> <a href="#product">Latest Product</a> <a
				href="#fearured">New Product</a> <a href="#blog">Blog</a> <a
				href="#news">News</a>
		</nav>
		<div class="icons">
			<a href="#"><i class="fa fa-heart"></i></a> <a href="/cart/checkout"><i
				class="fa fa-shopping-cart"></i></a>
			<div class="in-cart">
				<p id="amount">${amount }</p>
			</div>
			<a href="#"><i class="fa fa-user"></i></a>
		</div>
	</header>
	<!--end header-->
	<section class="detail">
		<div class="container">
			<div class="images">
				<c:forEach items="${product.productImages }" var="image"
					varStatus="loop">
					<img src="${base }/upload/${image.path}" alt="">
				</c:forEach>
			</div>
			<div class="description">
				<h1>${product.name }</h1>
				<div class="stars">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i>
				</div>
				<fmt:setLocale value="en_US" scope="session" />
				<div class="price">
					$${product.price } <span>$${product.price + 20}</span>
				</div>
				<p class="text">${product.description}</p>
				<a href="#" class="btn"
					onclick="AddToCart('${base }',${product.id },1)">add to card</a>
			</div>
		</div>
	</section>
</body>
</html>

<script src="${base}/js/customer/product-detail.js"></script>