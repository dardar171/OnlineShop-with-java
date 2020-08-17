<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<body>

	<div class="container" id="page">


		<h1>Vocher</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					
					<th scope="col">Product Name</th>
					<th scope="col">Unit Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
	
			<c:forEach var="tmpCartSize" items="${cartItems}">

				<tr>
					<td>${tmpCartSize.product.name}</td>
					<td>${tmpCartSize.product.unitPrice}KS</td>
					<td>${tmpCartSize.quantity}</td>
					<td>${tmpCartSize.product.unitPrice * tmpCartSize.quantity}Ks</td>

				</tr>
				<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				
				
					<td>${totalPrice}</td>
				</tr>
				<c:set var="totalPrice" value="${0}" />
				<c:forEach var="tmpCartSize" items="${cartItems}">

					<c:set var="totalPrice"
						value="${totalPrice + tmpCartSize.product.unitPrice * tmpCartSize.quantity}" />

				</c:forEach>
			</c:forEach>
		</table>
		<br>
		<span></span>
		<hr>

		<a href="${pageContext.request.contextPath}"
											class="btn btn-secondary">Back To Home</a>
		  <a href="${pageContext.request.contextPath}/order/orderProduct"
			class="btn btn-success"> Order now </a> 

 
			 
		<!--	<a href="${pageContext.request.contextPath}"
											class="btn btn-secondary">Back To Home</a>
													<a href="${pageContext.request.contextPath}"
											class="btn btn-secondary">Order Now</a> -->
	</div>
		
				
</body>

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<!-- popper -->
<script
	src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script
	src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</html>