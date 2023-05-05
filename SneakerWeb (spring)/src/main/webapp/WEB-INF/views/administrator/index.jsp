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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1">
    <link rel="stylesheet" href="${base}/css/admin/style.css">
    <link rel="stylesheet"
        href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>Dashboard</title>
    <script src="${base}/admin/js/script.js" defer></script>
</head>

<body>
    <input type="checkbox" id="nav-toggle">
    <div class="sidebar">
        <div class="sidebar-brand">
            <h2><span class="las la-shoe-prints"></span><span>Ksneaker</span></h2>
        </div>

        <div class="sidebar-menu">
             <ul>
				<li><a href="${base}/admin/home" class="active"><span
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
                    <a href="${base }/admin/voucher"><span class="las la-clipboard-list"></span>
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
    </div>

    <div class="main-content">
        <header>
            <h2>
                <label for="nav-toggle">
                    <span class="las la-bars"></span>
                </label>
                Dashboard
            </h2>
            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="search here">
            </div>

            <div class="user-wrapper">
                <img src="${base }/img/admin/admin-avatar.jpg" width="40px" height="40px" alt="">
                <div>
                    <h4>${userLogined.email }</h4>
                    <small>Super admin</small>
                </div>
            </div>
        </header>

        <main>
            <div class="cards">
                <div class="card-single">
                    <div>
                        <h1>${customersCount }</h1>
                        <span>Customer</span>
                    </div>
                    <div>
                        <span class="las la-users"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>${productsCount }</h1>
                        <span>Products</span>
                    </div>
                    <div>
                        <span class="las la-clipboard"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>${saleOrderProducts }</h1>
                        <span>Orders</span>
                    </div>
                    <div>
                        <span class="las la-cart-plus"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>${income }</h1>
                        <span>Income</span>
                    </div>
                    <div>
                        <span class="lab la-google-wallet"></span>
                    </div>
                </div>
            </div>

            <div class="recent-grid">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>New arrivals</h3>
                            <button>See all<span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <td>Brand</td>
                                        <td>Category</td>
                                        <td>Price</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${newArrivals }" var="newArrival" varStatus="loop">
                                    <c:choose>
                                    <c:when test="${loop.index % 2 == 0}">
                                    <tr>
                                        <td>${newArrival.name }</td>
                                        <td>Nike shoes</td>
                                        <td>
                                            <span class="status purple"></span>
                                            $${newArrival.price }
                                        </td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    <tr>
                                        <td>${newArrival.name }</td>
                                        <td>Nike shoes</td>
                                        <td>
                                            <span class="status pink"></span>
                                            $${newArrival.price }
                                        </td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                </tbody>
                            </table>
                           </div>
                        </div>
                    </div>
                </div>

                <div class="customers">
                    <div class="card">
                        <div class="card-header">
                            <h3>New customers</h3>
                            <button>See all<span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                            <div class="customer">
                                <div class="info">
                                    <img src="${base }/img/admin/315644395_138319718987146_4308660723032303297_n.jpg" width="40px"
                                        height="40px" alt="">
                                    <div>
                                        <h4>Tran Hai Cuong</h4>
                                        <small>Scammer</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span class="las la-user-circle"></span>
                                    <span class="las la-user-comment"></span>
                                    <span class="las la-user-phone"></span>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </main>
    </div>
    </div>
</body>

</html>