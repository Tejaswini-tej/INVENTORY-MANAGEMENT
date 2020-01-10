<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body id="top">

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
	
	<div class="bgded"
		style="background-image: url('images/demo/backgrounds/10_welcome.jpg');">
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
		<div class="wrapper overlay">
			<article id="pageintro" class="hoc clear">
				<h3 class="heading">Welcome To Cmart Super Market</h3>
				<p>Your most unhappy customers are your greatest source of
					learning.</p>

			</article>
		</div>
	</div>
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>