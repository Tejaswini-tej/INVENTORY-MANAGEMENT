<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Product details</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript">
	function calculate() {

		var punit = parseInt(document.getElementById('priceper_unit').value);
		var qsold = parseInt(document.getElementById('quantityrequired').value);
		var qres = parseInt(document.getElementById('quantities_received').value);
		var price = punit * qsold;
		var qavbl = qres - qsold;
		document.getElementById('totalprice').value = price;
		document.getElementById('quantityavailable').value = qavbl;
		if (qres < qsold) {
			alert("QuantityAvailable Only" + qres);
			document.getElementById('quantityrequired').value = 0;
			document.getElementById('totalprice').value = 0;

		}
	}
</script>
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
</style>

</head>



<body id="top">




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- <div align="center" style="width: 100%; height: 100%; background-image: url('${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg'); background-repeat: repeat;">
		
 -->
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
						<h3>
							<a href="${contextPath}/welcome">INVENTORY MANAGEMENT</a>
						</h3>
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

		<h2>Add Items To Cart</h2>


		<form action="${contextPath}/${customer_id}/searching" method="get">
			<div align="center">
				<table>
					<tr>

						<td><input type="text" class="form-control" id="product_name"
							name="product_name" placeholder="Search for Product" /></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary">Search</button>

			</div>
		</form>

		<form method="get" action="${contextPath}/${customer_id}/addtocart">

			<c:forEach var="product" items="${products}">
				<table align="center">
					<tr>
						<td style="color: black">Product ID:</td>

						<td style="color: black"><input type="text" name="productsid"
							value="${product.productsid}" /></td>
					</tr>
					<tr>
						<td style="color: black">Product Name:</td>
						<td style="color: black"><input type="text"
							name="product_name" value="${product.product_name}" /></td>
					</tr>

					<tr>
						<td style="color: black">Quantities Per Price:</td>
						<td style="color: black"><input type="text"
							name="priceper_unit" value="${product.priceper_unit}"
							id="priceper_unit" /></td>
					</tr>

					<tr>
						<td style="color: black"><input type="hidden"
							name="vendor_name" value="${product.vendor_name}" /></td>
					</tr>
					<tr>
						<td style="color: black"><input type="hidden"
							name="quantities_received" value="${product.quantities_received}"
							id="quantities_received" /></td>
					</tr>
					<tr>
						<td style="color: black"><input type="hidden"
							name="quantityavailable" id="quantityavailable" /></td>
					</tr>
					<tr>
						<td style="color: black">Quantity Required:</td>
						<td style="color: black"><input type="text"
							name="quantityrequired" id="quantityrequired"
							oninput="calculate()" /></td>
					</tr>

					<tr>
						<td style="color: black">Total Price:</td>
						<td style="color: black"><input type="text" name="totalprice"
							id="totalprice" /></td>
					</tr>
					<br />
					<br />
					<br />
					<tr>
						<td></td>
						<td><input class="button button5" type="submit"
							value="addtocart" /></td>
					</tr>
				</table>
				<br />


			</c:forEach>
		</form>



		<div>
			<h4>Cart Items</h4>
		</div>


		<table align="bottom" border="1px" style="width: 50%;">
			<tr>

				<th><b>Product ID</b></th>
				<th><b>Product Name</b></th>
				<th><b>Price per Unit</b></th>
				<th><b>Quantity Required</b></th>
				<th><b>Total Price</b></th>
			</tr>
			<c:forEach var="carts" items="${cart}">
				<tr>

					<td>${carts.productsid}</td>
					<td>${carts.product_name}</td>
					<td>${carts.priceper_unit}</td>
					<td>${carts.quantityrequired}</td>
					<td>${carts.totalprice}</td>

					<td><input type="hidden" name="totalprice" id="totalprice"
						value="${carts.totalprice}" /></td>
				</tr>
			</c:forEach>
		</table>

		<form method="get" action="${contextPath}/${customer_id}/addamount">

			<table>
				<tr>
					<td style="color: black">TotalAmount</td>
					<td style="color: black"><input type="text" name="totalamount"
						value="${totalamount}" /></td>
				</tr>
				<!-- <td><input type="submit" name="Addtotal" value="generate voice" /></td> -->
			</table>
			<div align="center">
				<input type="submit" class="btn btn-warning" name="Addtotal"
					value="Generate Invoice" />
			</div>
		</form>

	</div>


</body>
</html>




