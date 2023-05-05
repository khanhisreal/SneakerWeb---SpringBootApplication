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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<link rel="stylesheet" href="${base }/css/admin/product.css">
<!-- css phân trang -->
<link rel="stylesheet" href="${base }/css/admin/simplePagination.css">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${base }/js/admin/jquery.simplePagination.js" defer></script>
<script type="text/javascript" src="${base }/js/admin/product.js" defer></script>
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
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
				<li><a href="${base }/admin/order"><span class="las la-cart-plus"></span> <span>Orders</span></a>
				</li>
				<li><a href="${base}/admin/product/list" class="active"><span
						class="las la-clipboard-list"></span> <span>Products</span></a></li>
				<li><a href="${base}/admin/product/management"><span
						class="las la-receipt"></span> <span>Add products</span></a></li>
				<li>
                    <a href="${base}/admin/voucher"><span class="las la-clipboard-list"></span>
                        <span>Voucher</span></a>
                </li>
                <li>
                    <a href="${base }/admin/add-voucher"><span class="las la-receipt"></span>
                        <span>Add Voucher</span></a>
                </li>
				<li><a href="${base }/logout"><span class="las la-sign-out-alt"></span>
						<span>Log out</span></a></li>
			</ul>
		</div>

		<form action="${base} /admin/product/list" method="get"></form>

		<div class="main-content">
			<header>
				<h2>
					<label for="nav-toggle"> <span class="las la-bars"></span>
					</label> Products List
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

	<div class="product-list">
		<div class="container">

			<form action="${base }/admin/product/list" method="get">
				<!-- Thanh tìm kiếm thông tin sản phẩm -->
				<div class="search-product single">
					<h1>Search by name</h1>
					<!-- Ô nhập trang thứ n muốn xem trong danh sách sản phẩm -->
					<input type="text" id="page" name="page" placeholder="Page"
						value="${productSearch.page }" style="max-width: 30px;">
					<!-- Ô nhập tên sản phẩm -->
					<input type="text" placeholder="Type..."
						value="${productSearch.keyword }" id="keyword" name="keyword"
						autocomplete="off">
					<button type="submit" id="btnSearch" name="btnSearch"
						value="Search">search</button>
				</div>
			</form>
			<!-- Danh sách sản phẩm -->
			<c:forEach items="${products.data}" var="product" varStatus="loop">
				<div class="single">
					<div class="product">
						<div class="detail">
							<!-- product name -->
							<h1 id="name">${product.name }</h1>
							<!-- model -->
							<p id="description">${product.description }</p>
							<!-- price -->
							<p id="price">
								Price:
								<fmt:setLocale value="en_US" scope="session" />
								<fmt:formatNumber value="${product.price }" type="currency"
									pattern="USD #,###.##;USD -#,###.##" currencySymbol="USD" />
							</p>
						</div>
						<img src="${base }/upload/${product.location}" alt=""
							id="location">
					</div>
					<div class="toolbar">
						<div class="id">
							<p>Product id:</p>
							<!-- product id -->
							<p id="id">&nbsp${product.id }</p>
						</div>
						<div class="buttons">
							<button class="edit" type="button">
								<a href="/admin/product/management/${product.id }"
									style="color: black">edit</a>
							</button>
							<button class="delete" type="button"
								onclick="deleteFromList(${product.id})">delete</button>
						</div>
					</div>
				</div>
			</c:forEach>
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
					currentPage: ${products.currentPage}, 	//trang hiện tại
			        items: ${products.totalItems},			//tổng số sản phẩm
			        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
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