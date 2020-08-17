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


	<div class="container">
		<h1>Product List</h1>

		<table class="table table-striped" id="products">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Description</th>
					<th scope="col">Unit Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Categorizes</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="tmpProduct" items="${products}">

				<c:url var="updateLink" value="/product/showUpdateForm">
					<c:param name="productId" value="${tmpProduct.id}" />
				</c:url>

				<c:url var="deleteLink" value="/product/deleteProduct">
					<c:param name="productId" value="${tmpProduct.id}" />
				</c:url>

				<tr>
					<td>${tmpProduct.name}</td>
					<td>${tmpProduct.description}</td>
					<td>${tmpProduct.unitPrice}</td>
					<td>${tmpProduct.quantity}</td>
					<td>${tmpProduct.categorizes}</td>
					<td><a href="${updateLink}">Update </a>| <a
						href="${deleteLink}">Delete</a></td>
				</tr>
			</c:forEach>
			
				
			</tbody>
		</table>
<a href="${pageContext.request.contextPath}"
											class="btn btn-secondary">Back To Home</a>
	</div>

</body>
</html>
