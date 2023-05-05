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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1">
    <link rel="stylesheet" href="${base }/css/admin/voucher.css">
    <link rel="stylesheet"
        href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>Vouchers</title>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${base }/js/admin/voucher.js" defer></script>
</head>
<body>
    <input type="checkbox" id="nav-toggle">
    <div class="sidebar">
        <div class="sidebar-brand">
            <h2><span class="las la-shoe-prints"></span><span>Ksneaker</span></h2>
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
				<li><a href="${base}/admin/product/management"><span
						class="las la-receipt"></span> <span>Add products</span></a></li>
				<li>
                    <a href="${base }/admin/voucher"  class="active"><span class="las la-clipboard-list"></span>
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
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    Vouchers list
                </h2>
                <div class="search-wrapper">
                    <span class="las la-search"></span>
                    <input type="search" placeholder="search here">
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

   <div class="voucher-list">
        <div class="container">
            <div class="search-product single">
                <h1 style="font-size: 25px;">List of vouchers</h1>
            </div>
            <c:forEach items="${vouchers}" var="voucher" varStatus="loop">
            <div class="single">
             <div class="voucher">
                    <div class="detail">
                        <h1>${voucher.name}</h1>
                        <p>${voucher.description}</p>
                        <p>Sales: ${voucher.discount}%</p>
                    </div>
                    <img src="${base }/img/admin/voucher-5309686-4466517.webp" alt="">
                </div>
                <div class="toolbar">
                    <div class="id">
                        <p>Voucher id:</p>
                        <p>${voucher.id}</p>
                    </div>
                    <div class="buttons">
                        <button class="edit"><a href="${base}/admin/add-voucher/${voucher.id}" style="color: black">edit</a></button>
                        <button class="delete" type="button" onclick="deleteVoucher('${base }',${voucher.id})">delete</button>
                    </div>
                </div>
            </div>
             </c:forEach>
        </div>
    </div>
</body>
</html>