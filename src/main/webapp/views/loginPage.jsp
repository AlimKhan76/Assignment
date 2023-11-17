<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<div class="d-flex h-100  justify-content-center m-5">
		<div class="form w-75">
			<h1 class="text-center m-3 ">Login Page</h1>
			<c:if test="${not empty error}">
				<div class="alert alert-danger" role="alert">${error }</div>
			</c:if>

			<form action="/login" method="post">
				<div class="form-group ">
					<label for="exampleInputEmail1">Email address</label> <input
						name="loginId" type="email" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp"
						placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						name="password" type="password" class="form-control"
						id="exampleInputPassword1" placeholder="Password">
				</div>
				<div class="text-center">
					<button type="submit"
						class="btn btn-lg btn-primary text-center align-items-center">Submit</button>
				</div>
			</form>

		</div>
	</div>

</body>
</html>