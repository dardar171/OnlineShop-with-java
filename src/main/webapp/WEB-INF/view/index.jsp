
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shopping with MCG</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">

</head>

  <body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Barbie Online Shop</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart/contact">Contact</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart/list/">[${cartSize}]Cart</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/showLoginForm">Login</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">Barbie</h1>
				<security:authorize access="hasRole('ADMIN')"> 
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/product/addProduct" class="list-group-item">Add Product</a> 
					<a href="${pageContext.request.contextPath}/product/list" class="list-group-item">Product List</a> 
					<a href="${pageContext.request.contextPath}/order/listOrder"
						class="list-group-item">Order List</a>
				</div>
</security:authorize>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/resources/images/banner1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/resources/images/banner2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/resources/images/banner1.jpg"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				
				<div class="list-group">
				
					<c:forEach var="tmpProduct" items="${products}">
							<c:url var="clothingLink" value="/product/detail/clothing">
							<c:param name="productCate" value="cloth" />
						</c:url>
					</c:forEach>
					
					<c:forEach var="tmpProduct" items="${products}">
							<c:url var="shoesLink" value="/product/detail/shoes">
							<c:param name="productCate" value="shoes" />
						</c:url>
					</c:forEach>
					
					<c:forEach var="tmpProduct" items="${products}">
							<c:url var="bagsLink" value="/product/detail/bags">
							<c:param name="productCate" value="bags" />
						</c:url>
					</c:forEach>
					
					<c:forEach var="tmpProduct" items="${products}">
							<c:url var="accessoriesLink" value="/product/detail/accessories">
							<c:param name="productCate" value="accessories" />
						</c:url>
					</c:forEach>
					
				
					
					<a href="${clothingLink}" class="list-group-item">Clothing </a>
					<a href="${shoesLink}" class="list-group-item">Shoes </a>
					<a href="${bagsLink}" class="list-group-item">Bags </a>
					<a href="${accessoriesLink}" class="list-group-item">Accessories </a>
				</div>

				<div class="row">

					<c:forEach var="tmpProduct" items="${products}">

						<c:url var="cartProduct" value="/cart/detail/"> <!-- /add -->
							<c:param name="productId" value="${tmpProduct.id}" />
						</c:url>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/${tmpProduct.id}.jpg"
									alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">${tmpProduct.name}</a>
									</h4>
									<h5>${tmpProduct.unitPrice}</h5>
									<p class="card-text">${tmpProduct.description}</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
									<!-- <button type="submit" name="productId" value="${tmpProduct.id}"
										class="btn btn-success">Cart</button> -->
										
									<a href="${cartProduct}" class="btn btn-success">Cart</a>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Thanks for shopping with us
				</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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

</body>


</html>
