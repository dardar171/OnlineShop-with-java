
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
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
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/cart/contact">Contact</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/cart/list/">[${cartSize}]Cart</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/showLoginForm">Login</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<body>


	
	<form:form
		action="${pageContext.request.contextPath}/cart/detail/?productId=${product.id}"
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
								<div class="one-forth text-left px-4">
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
											class="btn btn-primary">Cart</button>
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>

		</div>


		</form:form>
</body>
</html>