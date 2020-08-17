<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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


	<form:form
		action="${pageContext.request.contextPath}/product/addProduct?${_csrf.parameterName}=${_csrf.token}"
		method="POST" modelAttribute="product" enctype="multipart/form-data">

		<form:hidden path="id" />

		<div id="page">


			<div class="colorlib-product">
				<div class="container">

					<!--   -->
					<div class="row row-pb-lg">
						<div class="col-md-12">
							<div class="product-name d-flex">
								<div class="one-forth text-left px-4">
									<span>Product Name</span>
								</div>
								<div class="one-forth text-left px-4">
									<span>Description</span>
								</div>
								<div class="one-forth text-left px-4">
									<span>Unit Price</span>
								</div>
								<div class="one-forth text-left px-4">
									<span>Quantity</span>
								</div>
								<div class="one-forth text-left px-4">
									<span>Choose Photo</span>
								</div>
								<div class="one-forth text-left px-4">
									<span>Categorizes</span>
								</div>
								
							</div>

							<div class="product-cart d-flex">
								<div class="one-forth">
									<div class="display-tc">
										<form:input path="name" />
									</div>
								</div>
								<div class="one-forth text-left px-4">
									<div class="display-tc">
										<form:textarea path="description" />
									</div>
								</div>
								<div class="one-forth text-left px-4">
									<div class="display-tc">
										<form:input path="unitPrice" />
									</div>
								</div>
								<div class="one-forth text-left px-4">
									<div class="display-tc">
										<form:input path="quantity" />
									</div>
								</div>
								<div class="one-forth text-left px-4">
									<div class="display-tc">
										<form:input type="file" path="file" />
									</div>
								</div>
								<div class="one-forth text-left px-4 display-tc">
									<div class="display-tc">
										<form:select path="categorizes">
									<option value="cloth">Clothing</option>
									<option value="shoes">Shoes</option>
									<option value="bags">Bags</option>
									<option value="accessories">Accessories</option>
								</form:select>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>

					<div class="row row-pb-lg">
						<div class="col-md-12">
							<div class="total-wrap">
								<div class="row">
									<div class="col-sm-4">
										<button type="submit" value="Add Product"
											class="btn btn-secondary">Save Product</button>
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>

		</div>



		<!-- Name         :<form:input path="name"/>
<br><br>
Description  :<form:textarea path="description"/>
<br><br>
Unit Price   :<form:input path="unitPrice"/>
<br><br>
<form:input type="file" path="file"/>
<br><br>
<button type="submit" value="Add Product" class="btn btn-success">Save</button>
<br>
<a href="${pageContext.request.contextPath}">Back to Home</a>
  -->

	</form:form>




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