<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
</head>
<body>

<div class="container ">
		<h1>Product List</h1>
		
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
<a href="${pageContext.request.contextPath}"
											class="btn btn-secondary">Back To Home</a>
	</div>


</body>
</html>