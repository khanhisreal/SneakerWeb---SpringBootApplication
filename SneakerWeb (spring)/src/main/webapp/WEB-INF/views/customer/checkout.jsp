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
<link rel="stylesheet" href="${base }/css/customer/checkout.css">
<script src="${base }/js/customer/checkout.js" defer></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Checkout</title>
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
			<a href="#"><i class="fa fa-heart"></i></a> <a href="#"><i
				class="fa fa-shopping-cart">
					<p></p>
			</i></a>
			<div class="in-cart">
				<p id="amount">${amount }</p>
			</div>
			<a href="${base }/login"><i class="fa fa-user"></i></a>
		</div>
	</header>
	<!--end header-->
	<section class="checkout">
		<form action="${base }/cart/checkout" method="post">
			<div class="product-info">
				<table>
					<!-- table head -->
					<tr>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Remove</th>
					</tr>
					<!-- table row -->
					<c:forEach items="${cart.cartItems }" var="ci">
						<div class="single-row">
							<tr>
								<td><img src="${base }/upload/${ci.image}" alt=""
									style="margin: 10px 20px;">
									<p>${ci.productName }</p></td>
								<td id="price">$${ci.priceUnit }</td>
								<td><a href="" onclick="updateQuantity('${base}',${ci.productId }, 1)" ><p>+</p></a>
									<p id="quantity">${ci.quantity }</p> 
									<a href="" onclick="updateQuantity('${base}',${ci.productId }, -1)"><p>-</p></a>
								</td>
								<td><a href="" onclick="deleteItem('${base }', ${ci.productId})">Remove</a></td>
							</tr>
						</div>
					</c:forEach>
				</table>
			</div>

            <div class="voucher-info">
                <table>
                    <!-- table head -->
                    <tr>
                        <th>Voucher</th>
                        <th>Discount</th>
                        <th>Use</th>
                    </tr>
                    <!-- table row -->
                    <c:forEach items="${vouchers}" var="voucher">
                        <div class="voucher-info-row">
                            <tr>
                                <td>
                                    ${voucher.name}
                                </td>
                                <td>
                                    <p>${voucher.discount}%</p>
                                </td>
                                <td>
                                    <input type="checkbox" onclick="clickVoucher('${base }', ${voucher.id});"
                                    id="voucher-checkbox-${voucher.id}">
                                     <script>
                                         function checkIfVoucherWasChosen(_baseUrl, voucherId) {
                                             jQuery.ajax({
                                                url: _baseUrl + "/ajax/voucherChosen", 	   //->request mapping định nghĩa bên controller
                                                type: "post",					   //-> method type của Request Mapping
                                                contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
                                                data: JSON.stringify(voucherId), //-> chuyển 1 javascript object thành string json

                                                dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
                                                success: function(jsonResult) {    // gọi ajax thành công
                                                    const checkbox = document.getElementById("voucher-checkbox-" + voucherId)
                                                     if (jsonResult.result)
                                                         checkbox.checked = true
                                                },
                                                error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
                                                    alert("error");
                                                }
                                            });
                                         }
                                        checkIfVoucherWasChosen('${base }', ${voucher.id})
                                     </script>
                                   </input>
                                </td>
                            </tr>
                        </div>
                    </c:forEach>
                </table>
            </div>
            <div class="final-price">
                <span class="title">Final price you have to pay:</span>
                <span class="price"><span class="final-price-value"></span>$</span>
                          <script>
                             function getFinalPrice(_baseUrl) {
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
                            getFinalPrice('${base }')
                         </script>
            </div>


			<div class="bill">
				<div class="customer-infor">
					<h1>CUSTOMER CONTACT</h1>
					<c:choose>
						<c:when test="${isLogined }">
							<form action="">
								<label for="name">name</label> <input type="text" id="name"
									name="name" value="${userLogined.username }" placeholder="type name..."> <label
									for="email">email</label> <input type="email" id="email"
									name="email" value="${userLogined.email }" placeholder="type email..." required> <label
									for="phone">phone</label> <input type="text" id="phone"
									name="phone" value="${userLogined.phone }" placeholder="type phone number..." required> <label
									for="address">address</label> <input type="text" id="address"
									name="address" value="${userLogined.shippingAddress }" placeholder="type address..." required>
							</form>
						</c:when>
						<c:otherwise>
							<form action="">
								<label for="name">name</label> <input type="text" id="name"
									name="name" placeholder="type name..." required> <label
									for="email">email</label> <input type="email" id="email"
									name="email" placeholder="type email..."> <label
									for="phone">phone</label> <input type="text" id="phone"
									name="phone" placeholder="type phone number..."> <label
									for="address">address</label> <input type="text" id="address"
									name="address" placeholder="type address...">
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="shipping-info">
					<h1>IN YOUR CART</h1>
					<p class="title">Payment</p>
					<div class="payment">
						<div class="logos">
							<img src="${base }/img/customer/logos/Logo-Vietcombank.webp"
								alt=""> <img
								src="${base }/img/customer/logos/Logo-MoMo-Transparent.webp"
								alt=""> <img
								src="${base }/img/customer/logos/Visa_Inc._logo.svg.webp" alt="">
						</div>
					</div>
					<div class="single">
						<p>Base</p>
						<p id="base"><span class="final-price-value"></span>$</p>
					</div>
					<div class="single">
						<p>Shipping and handling</p>
						<p id="shipping">$0.00</p>
					</div>
					<div class="single">
						<p>Tax</p>
						<p id="tax">$0.00</p>
					</div>
					<div class="single">
						<p>Total</p>
						<p id="total"><span class="final-price-value"></span>$</p>
					</div>
					<div class="buttons">
						<button type="submit">proceed</button>
					</div>
				</div>
			</div>
		</form>
	</section>
</html>