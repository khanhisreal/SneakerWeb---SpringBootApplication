<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>

<head>
    <link rel="stylesheet"
	href="${base}/css/customer/fontawesome/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${base }/css/customer/cart_success.css">
    <title>Payment successful</title>
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
    <section class="payment-succesful">
        <div class="description">
            <div class="tick"></div>
            <div class="detail">
                <h1>Payment successful</h1>
                <p>We have received your shopping request, thank you!</p>
                <a href="${base }/homepage">Go to home</a>
            </div>
        </div>
    </section>
</body>

</html>