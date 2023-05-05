<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maxium-scale=1">
<link rel="stylesheet" href="${base }/css/admin/order.css">
<!-- css phân trang -->
<link rel="stylesheet" href="${base }/css/admin/simplePagination.css">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<title>Orders</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${base }/js/admin/jquery.simplePagination.js" defer></script>
<script src="${base }/js/admin/order.js" defer></script>
</head>

<body>
	<input type="checkbox" id="nav-toggle">
	<div class="sidebar">
		<div class="sidebar-brand">
			<h2>
				<span class="las la-shoe-prints"></span><span>Ksneaker</span>
			</h2>
		</div>

		<div class="sidebar-menu">
			<ul>
				<li><a href="${base}/admin/home" class=""><span
						class="las la-igloo"></span> <span>Dashboard</span></a></li>
				<li><a href="${base }/admin/subscribe"><span
						class="las la-users"></span> <span>Customer</span></a></li>
				<li><a href="${base }/admin/order" class="active"><span
						class="las la-cart-plus"></span> <span>Orders</span></a></li>
				<li><a href="${base}/admin/product/list"><span
						class="las la-clipboard-list"></span> <span>Products</span></a></li>
				<li><a href="${base}/admin/product/management"><span
						class="las la-receipt"></span> <span>Add products</span></a></li>
				<li><a href="${base }/admin/voucher"><span
						class="las la-clipboard-list"></span> <span>Voucher</span></a></li>
				<li><a href="${base }/admin/add-voucher"><span
						class="las la-receipt"></span> <span>Add Voucher</span></a></li>
				<li><a href="${base }/logout"><span
						class="las la-sign-out-alt"></span> <span>Log out</span></a></li>
			</ul>
		</div>

		<div class="main-content">
			<header>
				<h2>
					<label for="nav-toggle"> <span class="las la-bars"></span>
					</label> Orders list
				</h2>
				<div class="search-wrapper">
					<span class="las la-search"></span> <input type="search"
						placeholder="search here">
				</div>

				<div class="user-wrapper">
					<img src="${base }/img/admin/admin-avatar.jpg" width="40px"
						height="40px" alt="">
					<div>
						<h4>${userLogined.email }</h4>
						<small>Super admin</small>
					</div>
				</div>
			</header>
		</div>
	</div>

	<div class="orders-list">
		<div class="container">
			<form action="${base }/admin/order" method="get">
				<div class="search-bar">
					<h1>Order management tool</h1>
					<input type="text" id="page" name="page" placeholder="Page"
						value="${page }" style="max-width: 40px;"> <input
						type="text" value="${oderDTO.name }" name="customer_name"
						placeholder="Search by name...">
					<button type="submit" id="btnSearch">search</button>
				</div>
			</form>
			<div class="single">
				<div class="orders">
					<table id="customers">
						<tr>
							<th>Code Orders</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Address</th>
							<th>Product</th>
							<th>Quantity</th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach items="${saleOrderProducts.data}"
							var="saleOrderProduct" varStatus="loop">
							<c:choose>
								<c:when test="${saleOrderProduct.status == true}">
									<tr>
										<td>${saleOrderProduct.saleOrder.code }</td>
										<td>${saleOrderProduct.saleOrder.customerName }</td>
										<td>${saleOrderProduct.saleOrder.customer_phone }</td>
										<td>${saleOrderProduct.saleOrder.customer_email }</td>
										<td>${saleOrderProduct.saleOrder.customerAddress }</td>
										<td>${saleOrderProduct.product.name }</td>
										<td style="text-align: center;">${saleOrderProduct.quantity }</td>
										<td><button
												onclick="approve('${base}',${saleOrderProduct.id })">Approve</button></td>
										<td><button
												onclick="disapprove('${base}',${saleOrderProduct.id })">Disapprove</button></td>
									</tr>
								</c:when>
								<c:when test="${saleOrderProduct.status == false}">
									<tr class="inactive">
										<td>${saleOrderProduct.saleOrder.code }</td>
										<td>${saleOrderProduct.saleOrder.customerName }</td>
										<td>${saleOrderProduct.saleOrder.customer_phone }</td>
										<td>${saleOrderProduct.saleOrder.customer_email }</td>
										<td>${saleOrderProduct.saleOrder.customerAddress }</td>
										<td>${saleOrderProduct.product.name }</td>
										<td style="text-align: center;">${saleOrderProduct.quantity }</td>
										<td colspan="2" style="text-align: center; color: red;">Order
											disapproved</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="inactive">
										<td>${saleOrderProduct.saleOrder.code }</td>
										<td>${saleOrderProduct.saleOrder.customerName }</td>
										<td>${saleOrderProduct.saleOrder.customer_phone }</td>
										<td>${saleOrderProduct.saleOrder.customer_email }</td>
										<td>${saleOrderProduct.saleOrder.customerAddress }</td>
										<td>${saleOrderProduct.product.name }</td>
										<td style="text-align: center;" class="inactive">1</td>
										<td colspan="2" style="text-align: center; color: green;">Order
											approved</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- phân trang -->
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>
						</div>
					</div>
		</div>
	</div>
	<script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${saleOrderProducts.currentPage}, 	//trang hiện tại
			        items: ${saleOrderProducts.totalItems},			//tổng số sản phẩm
			        itemsOnPage: ${saleOrderProducts.sizeOfPage}, 	//số sản phẩm trên 1 trang
			        cssStyle: 'light-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
	</script>
</body>

</html>