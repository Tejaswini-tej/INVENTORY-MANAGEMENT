<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

<meta charset="utf-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Create an account</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<script>
	function myFunction() {
		window.print();
	}
</script>


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

.table2 {
	width: 50%;
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






	<div align="center">
		<!--  style="width: 100%; height: 100%; background-image: url('${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg'); background-repeat: repeat;">
		 -->

		<br /> <br /> <br />

		<div>

			<div>
				<div>
					<div>
						<h2>Customer Details</h2>
					</div>
				</div>
				<br />
				<div>
					<table class="table2">

						<c:forEach var="customers" items="${customers}">
							<tr>
							<tr>
								<td>ID
								<td>
								<td>${customers.customer_id}</td>
							<tr>
								<td>Name
								<td>
								<td>${customers.customer_name}</td>
							</tr>
							<tr>
								<td>number
								<td>
								<td>${customers.contact_number}</td>
							</tr>

							<tr>
								<td>Address
								<td>
								<td>${customers.customer_address}</td>
							</tr>


						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<br /> <br />

		<talbe class="table2">
		<div>
			<div>
				<div>
					<h2>ItemsSold</h2>
				</div>
			</div>
			<div>
				<table border="1">
					<tr>
						<th>customer_id</th>
						<th>SerialNumber</th>
						<th>ProductName</th>
						<th>PricePerUnit</th>
						<th>VendorName</th>
						<th>TotalPrice</th>
					</tr>
					<c:forEach var="carts" items="${carts}">
						<tr>
							<td>${carts.customer_id}</td>
							<td>${carts.productsid}</td>
							<td>${carts.product_name}</td>
							<td>${carts.priceper_unit}</td>
							<td>${carts.vendor_name}</td>
							<td><p>${carts.totalprice}</p></td>

						</tr>
					</c:forEach>

				</table>

				<div align="center">
					<h4>
						<b>Total:${totalamount}</b>
					</h4>
				</div>
				<div align="center">
					<button onclick="myFunction()" class="btn btn-primary">Print</button>
				</div>
			</div>
		</div>
	</div>


	</div>

</body>
</html>

