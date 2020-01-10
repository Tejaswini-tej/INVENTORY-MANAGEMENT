<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${contextPath}/layout/styles/layout.css" rel="stylesheet"
	type="text/css" media="all">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Product Details</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body id="top">
	<style>
.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
}

.button5 {
	border-radius: 50%;
}

.table1 {
	width: 65%;
	max-width: 100%;
	margin-bottom: 20px
}

body {
	background-image:
		url("${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg");
	background-size: 100%;
}
</style>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


	<div class="wrapper row0">
		<div id="topbar" class="hoc clear">
			<ul>
				<li><i class="fa fa-clock-o"></i> Mon. - Fri. 8am - 5pm</li>
				<li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
				<li><i class="fa fa-envelope-o"></i> info@domain.com</li>

			</ul>
		</div>
	</div>




	<div class="wrapper row2">
		<nav id="mainav" class="hoc clear">
			<ul class="clear">
				<li>
						<div align="left">
							<h3><a href="${contextPath}/welcome">INVENTORY MANAGEMENT</a></h3>
						</div>
					</li>

				<li class="active"><a href="${contextPath}/welcome.jsp"
					style="color: black">Home</a></li>
				<li><a href="${contextPath}/Product" style="color: black">product</a></li>
				<li><a href="${contextPath}/new-customer" style="color: black">New
						customer</a></li>
				<li><a href="${contextPath}/invTracking" style="color: black">Tracking
				</a></li>
				<li><a href="${contextPath}/sales" style="color: black">Sales</a></li>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<form id="logoutForm" method="POST" action="${contextPath}/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>


					<a style="color: black"
						onclick="document.forms['logoutForm'].submit()">Logout</a>

				</c:if>

			</ul>
		</nav>
	</div>



	<br />



	<div align="center">
		<!-- style="width: 100%; height: 100%; background-image: url('${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg'); background-repeat: repeat;">
		 -->
		<h2>Product Details</h2>
		<hr />
		<a href="${contextPath}/new-product">
			<button class="button button5">Add new product</button>

		</a> <br /> <br />

		<table class="table"
			style="text-align: center; width: 70%; height: 50%;" border="1px">
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Quantities Received</th>
				<th>Price per Unit</th>
				<th>Vendor Name</th>
				<th></th>
			</tr>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.productsid}</td>
					<td>${product.product_name}</td>
					<td>${product.quantities_received}</td>
					<td>${product.priceper_unit}</td>
					<td>${product.vendor_name}</td>
					<td><a class="btn btn-primary" role="button"
						href="${contextPath}/${product.productsid}/product">Edit</a> <a
						class="btn btn-danger" role="button"
						href="${contextPath}/${product.productsid}/productdelete">Delete</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>
	</div>
	</div>
	</div>
	<br>
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>


