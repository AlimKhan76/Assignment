<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script type="text/javascript">
	if ("${success}" === true) {
		alert("Customer Created")
	}

	localStorage.setItem("token", "${token}");
</script>
<title>Home Page</title>
</head>
<body>
	<h1 class="text-center m-5">Customer list</h1>
	<c:if test="${ not empty success }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${ not empty error }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>


	<div class="d-flex align-items-center justify-content-center">
		<a class="btn btn-lg btn-primary text-white" href="add">Add
			Customer </a>

	</div>
	<div class="d-flex align-items-center justify-content-center m-4">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">First name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Address</th>
					<th scope="col">City</th>
					<th scope="col">State</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<c:forEach items="${list}" var="a">

				<tbody>
					<tr>
						<td>${a.firstName }</td>
						<td>${a.lastName }</td>
						<td>${a.address }</td>
						<td>${a.city }</td>
						<td>${a.state }</td>
						<td>${a.email }</td>
						<td>${a.phone}</td>
						<td>
							<div class="d-flex ">
								<form class="px-1" action="delete" method="post">
									<input type="hidden" value=${a.uuid } name="uuid">

									<button type="submit" class="btn btn-danger">Delete</button>
								</form>

								<form class="px-1" action="update" method="post">
									<input type="hidden" value=${a.uuid } name="uuid">
									<button class="btn btn-success" type="submit">Update</button>
								</form>
							</div>
						</td>



					</tr>

				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>