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
<title>Subscription</title>
<!-- css phân trang -->
<link rel="stylesheet" href="${base }/css/admin/simplePagination.css">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${base }/js/admin/jquery.simplePagination.js" defer></script>
<link rel="stylesheet" href="${base }/css/admin/subscribe.css">
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
				<li><a href="${base }/admin/subscribe" class="active"><span
						class="las la-users"></span> <span>Customer</span></a></li>
				<li><a href="${base }/admin/order"><span class="las la-cart-plus"></span> <span>Orders</span></a>
				</li>
				<li><a href="${base}/admin/product/list"><span
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
					</label> Subscribers List
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

	<div class="subscribe">
		<form action="${base }/admin/subscribe">
			<section class="title single">
				<h1>From monthly subscribers</h1>
				<div class="search">
					<input id="page" type="text" name="page"
						value="${subscribeDTO.page }" placeholder="1">
					<button type="submit" id="btnSearch">Search</button>
				</div>
			</section>
		</form>
		<section class="table">
			<div class="table-heading single">
				<thead class="heading">
					<tr>
						<div class="left">
							<th>
								<p>id</p>
							</th>
							<th>
								<p>avatar</p>
							</th>
							<th>
								<p>email</p>
							</th>
						</div>
						<div class="right">
							<th>
								<p>action</p>
							</th>
						</div>
					</tr>
				</thead>
			</div>

			<c:forEach items="${contacts.data}" var="contact" varStatus="loop">
				<div class="table-body">
					<tbody>
						<tr>
							<div class="left">
								<td><p>${contact.id }</p></td>
								<td><img src="${base }/img/admin/profile.png" alt=""
									class="image"></td>
								<td class="input"><p id="${contact.id }">${contact.email }</p></td>
							</div>
							<td><a href=""><input type="button" value="copy"
									onclick="copyToClipboard('${contact.id }')"></a></td>
						</tr>
					</tbody>
				</div>

			</c:forEach>
		</section>
		<!-- phân trang -->
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<div id="paging"></div>
			</div>
		</div>
	</div>

	<script>
		function copyToClipboard(input) {
			const str = document.getElementById(input).innerText
			const el = document.createElement('textarea')
			el.value = str
			el.setAttribute('readonly', '')
			el.style.position = 'absolute'
			el.style.left = '-9999px'
			document.body.appendChild(el)
			el.select()
			document.execCommand('copy')
			document.body.removeChild(el)
			alert("Copied: " + str)
		}
		
		$( document ).ready(function() {
			$("#paging").pagination({
				currentPage: ${contacts.currentPage}, 	//trang hiện tại
		        items: ${contacts.totalItems},			//tổng số sản phẩm
		        itemsOnPage: ${contacts.sizeOfPage}, 	//số sản phẩm trên 1 trang
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