<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageContext.servletContext.contextPath <=> http://localhost:8080 -->
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maxium-scale=1">
<link rel="stylesheet" href="${base }/css/admin/add-product.css">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<title>Add products</title>
<script src="${base }/js/admin/script.js" defer></script>
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
				<li><a href="${base}/admin/product/list"><span
						class="las la-clipboard-list"></span> <span>Products</span></a></li>
				<li><a href="${base}/admin/product/management" class="active"><span
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

		<div class="main-content">
			<header>
				<h2>
					<label for="nav-toggle"> <span class="las la-bars"></span>
					</label> Add/Update products
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

	<section class="form">
		<div class="container">
			<div class="contact-box">
				<div class="left"></div>
				<div class="right">
					<sf:form enctype="multipart/form-data" modelAttribute="product"
						action="${base}/admin/product/management/saveOrUpdate"
						method="post">
						<h2>Add/Update product</h2>
						<sf:input path="id" type="text" class="field" placeholder="Id"></sf:input>
						<sf:input path="name" type="text" class="field"
							placeholder="Product name"></sf:input>
						<sf:input path="description" type="text" class="field"
							placeholder="Description"></sf:input>
						<sf:input path="price" type="text" class="field"
							placeholder="Price"></sf:input>
						<!-- avatar -->
						<label for="avatar">Avatar</label>
						<input path="location" type="file" class="field"
							name="productAvatar">
						<!-- ảnh cover -->
						<label for="fileProductPictures">Picture(Multiple)</label>
						<input type="file" id="fileProductPictures" name="productPictures"
							class="field" multiple="multiple">
						<button class="btn" type="submit">Send</button>
					</sf:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>