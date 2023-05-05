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
<link rel="stylesheet" href="${base}/css/customer/style.css">

<!-- css phân trang -->
<link rel="stylesheet" href="${base }/css/admin/simplePagination.css">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${base }/js/admin/jquery.simplePagination.js" defer></script>

<script src="${base}/js/customer/script.js"></script>
<title>Home</title>
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
			<a href="${base }/login"><i class="fa fa-user"></i></a>
		</div>
	</header>
	<!--end header-->
	<section class="home" id="home">
		<div class="slide-container active">
			<div class="slide">
				<div class="content">
					<span>Welcome</span>
					<h3>Nike Vendors</h3>
					<p>Introducing the latest collection from Nike - the ultimate
						blend of style and performance. Whether you're a seasoned athlete
						or just starting out, our products are designed to help you reach
						your full potential.</p>
				</div>
				<div class="image">
					<img src="img/customer/slide/lebron.webp" class="shoe">
				</div>
			</div>
		</div>
	</section>
	<!--end home-->
	<section class="product" id="product">
		<h1 class="heading">
			latest <span>Products</span>
		</h1>
		<div class="box-container">
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img src="img/customer/slide/af1_black.webp" alt="">
					<h3>Nike Air Force 1 '07</h3>
					<div class="price">
						$110 <span>$120</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img src="img/customer/slide/af1_white.webp" alt="">
					<h3>Nike Air Force 1 White</h3>
					<div class="price">
						$110 <span>$120</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img src="img/customer/slide/af1_high.webp" alt="">
					<h3>Nike Air Force 1 High '07 LV8</h3>
					<div class="price">
						$145 <span>$155</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img src="img/customer/slide/af1_mid.webp" alt="">
					<h3>Nike Air Force 1 Mid</h3>
					<div class="price">
						$145 <span>$150</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img src="img/customer/slide/af1_mid_red.webp" alt="">
					<h3>Nike Air Force 1 Mid '07 LX</h3>
					<div class="price">
						$145 <span>$150</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="icons">
					<a href="#" class="fa fa-heart"></a> <a href="#"
						class="fa fa-share"></a> <a href="#" class="fa fa-eye"></a>
				</div>
				<div class="content">
					<img
						src="img/customer/slide/752efdf6-b2b7-47fc-b137-5a70b5dd9423.webp"
						alt="">
					<h3>Nike Shoes</h3>
					<div class="price">
						$110 <span>$150</span>
					</div>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--end product-->
	<section class="featured" id="fearured">
		<h1 class="heading">
			New <span>Product</span>
		</h1>

       <div class="dropdown-sort-product">
            <button class="dropbtn-sort-product">Sort Products <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
              </svg> </button>
            <div class="dropdown-content-sort-product">
            <a href="${base }/homepage?productSort=PRICE_ASC">Price <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
              </svg> </a>
            <a href="${base }/homepage?productSort=PRICE_DESC">Price <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
              </svg> </a>
            <a href="${base }/homepage?productSort=NAME_ASC">Name <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
              </svg> </a>
            <a href="${base }/homepage?productSort=NAME_DESC">Name <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
              </svg> </a>
            </div>
       </div>

		<form action="${base }/homepage">
			<div class="temp">
				<input id="pagerData" name="page" type="text" placeholder="ca"
					style="background-color: black; color: white;"
					value="${homeProductsDTO.page}">
                <input id="productSort"  type="text"
                        style="background-color: black; color: white;"
                        value="${productSort}">
				<button type="submit" id="btnSearchCustom" style="cursor: pointer;">Click
					Me!</button>
			</div>
		</form>

		<c:forEach items="${products.data }" var="product" varStatus="loop">
			<div class="row">
				<div class="image-container">
					<div class="small-image">
						<c:forEach items="${product.productImages }" var="image"
							varStatus="loop">
							<img src="${base }/upload/${image.path}" alt=""
								class="featured-image-1">
						</c:forEach>
					</div>
					<div class="big-image">
						<img src="${base }/upload/${product.location}" alt=""
							class="big-image-1">
					</div>
				</div>
				<div class="content">
					<h3><a href="/homepage/product/detail/${product.seo }" style="color: black;">${product.name }</a></h3>
					<div class="stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
					<p>${product.description}</p>
					<fmt:setLocale value="en_US" scope="session" />
					<div class="price">
						$${product.price } <span>$${product.price + 20}</span>
					</div>
					<a href="#" class="btn" onclick="AddToCart('${base }',${product.id },1)">add
						to cart</a>
				</div>
			</div>
		</c:forEach>

		<!-- phân trang -->
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<div id="paginator"></div>
			</div>
		</div>

	</section>
	<!--end featured-->
	<section class="blog" id="blog">
		<h1 class="heading">
			Team <span>Weblog</span>
		</h1>
		<div class="box-container">
			<div class="box">
				<img src="img/customer/team/huong.jpg" alt="">
				<h3>Lan Huong</h3>
				<p>I purchased a pair of Nike sneakers from Ksneaker and I was
					thoroughly impressed with the level of service and quality of the
					product. The staff at Ksneaker were knowledgeable and helped me
					find the perfect fit for my feet.</p>
				<div class="stars">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa fa-star"></i>
				</div>
			</div>
			<div class="box">
				<img src="img/customer/team/thuy anh.jpg" alt="">
				<h3>Thuy Anh</h3>
				<p>I recently purchased a pair of Nike shoes from Ksneaker and I
					couldn't be happier with my purchase. The shoes are not only
					stylish, but also extremely comfortable and supportive.</p>
				<div class="stars">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa fa-star-half-o"></i>
				</div>
			</div>
			<div class="box">
				<img src="img/customer/team/giang.jpg" alt="">
				<h3>Hoang Giang</h3>
				<p>I recently bought a pair of Nike sneakers from Ksneaker and I
					am extremely satisfied with my purchase. The sneakers are not only
					stylish, but also very versatile and comfortable. I wear them to
					work, the gym, and even on casual outings.</p>
				<div class="stars">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i><i
						class="fa fa fa-star-half-o"></i> 
						<i class="fa fa-star-o"></i> 
				</div>
			</div>
		</div>
	</section>
	<!--end blog-->
	<section class="news" id="news">
		<div class="content">
			<h3>monthly news letter</h3>
			<p>Don't miss out on exclusive deals, promotions, and exciting
				updates. By submitting your email, you'll be the first to know about
				our newest products, upcoming events, and more.</p>

			<!-- nhận dữ liệu từ form sử dụng ajax -->
			<form action="">
				<input type="email" name="email" id="email"
					placeholder="please enter your email" class="email">
				<button type="button" onclick="PostContactUsingAjax('${base}')"
					value="save" class="btn">Send</button>
			</form>

		</div>
	</section>
	<!--end news-->
	<section class="cridet" id="cridet">
		<div class="box">
			<h3>customized by Khanh Phan</h3>
		</div>
	</section>

	<script>
		$( document ).ready(function() {
			$("#paginator").pagination({
				currentPage: ${products.currentPage}, 	//trang hiện tại
		        items: ${products.totalItems},			//tổng số sản phẩm
		        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
		        cssStyle: 'light-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#pagerData').val(pageNumber);
		            $('#productSort').val('${productSort}');
		        	$('#btnSearchCustom').trigger('click');
				},
		    });
		});
	</script>
</body>
</html>