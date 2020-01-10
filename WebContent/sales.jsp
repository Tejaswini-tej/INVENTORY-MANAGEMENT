
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>SOLD ITEMS</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<title>Sales Details</title>
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

body {
	background-image:
		url("${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg");
	background-size: 100%;
}

.table2 {
	width: 50%;
	max-width: 100%;
	margin-bottom: 20px
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
	<br />
	<br />
	<br />
	<div align="center">
	<h3>Inventory Sales</h3>
		<!-- style="width: 100%; height: 100%; background-image: url('${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg'); background-repeat: repeat;">
		 -->
		 </br>
		<form action="${contextPath}/searchproduct" method="get">
			<div>
				<div align="center">
					<h4>Search by ProductName</h4>

					<table>
						<td><input type="text" class="form-control" id="product_name"
							name="product_name" placeholder="Search for Product" /></td>
						
						</tr>
				</table>
					<button type="submit" class="btn btn-primary">
								Search</button>
				</div>
		</form>

		<br />
		<div align="center">
			<form action="${contextPath}/searchdate">

				<div align="center">
					<h4>Search Orders By Date:</h4>
					<table>

						
						<tr>
							<td><input type="date" id="startdate" name="startdate"
								class="form-control" /></td>
							<td><input type="date" id="enddate" name="enddate"
								class="form-control" /></td>

							
								
							
						</tr>
					</table>
					<button class="btn btn-primary">Search</button>
			</form>
		</div>


		<br />
		<div align="center">
			<form action="${contextPath}/searchprice">


				<h4>Search Orders By Price Range:</h4>
				<table>
					<tr>
						<td><input type="number" id="lowprice" name="lowprice"
							class="form-control" /></td>
						<td><input type="number" id="highprice" name="highprice"
							class="form-control" /></td>
						
					</tr>
				</table>
				<button class="btn btn-primary">Search</button>
			</form>
		</div>
		<br />


		<div>
			<div>
				<table class="table"
					style="text-align: center; width: 50%; height: 50%;" >
					<tr>
						<!-- <td><b>Product Id</b></td> -->
						<th><b>Product Name</b></th>
						<th><b>Priceper Unit</b></th>
						<th><b>Quantity Sold</b></th>
						<th><b>Date of sold</b></th>
						<th><b>Total Price</b></th>
					</tr>
					<c:forEach var="carts" items="${carts}">
						<tr>
							<%-- <td>${carts.id}</td> --%>
							<!-- <td>${carts.productsid}</td> -->
							<td>${carts.product_name}</td>
							<td>${carts.priceper_unit}</td>

							<td>${carts.quantityrequired}</td>
							<td>${carts.date}</td>

							<td>${carts.totalprice}</td>

							<td><input type="hidden" name="totalprice" id="totalprice"
								value="${carts.totalprice}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div align="center">
				<h4>Total No of Quantities sold</h4>
				<table align="center">
					<tr>
						<input type="text" value="${totalcount}" />
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
