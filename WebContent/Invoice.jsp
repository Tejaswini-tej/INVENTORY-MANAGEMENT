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


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>YOUR INVOICE</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
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
	<!-- </div> -->
	<br>

	<div align="center">
		<!-- style="width: 100%; height: 100%; background-image: url('${contextPath}/images/demo/backgrounds/line_angle_light_color_43982_2560x1600.jpg'); background-repeat: repeat;">
 -->
		<h3>Click On invoice code to get bill.</h3>
		<h2>
			Your invoice Code<a href="${contextPath}/${customer_id}/Invoice">:
				INV000${invcode}</a>
		</h2>
	</div>
</body>
</html>