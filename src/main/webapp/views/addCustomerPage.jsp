<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Add Customer</title>
</head>
<body>

	<h1 class="text-center my-5">Add Customer</h1>


	<div class="  container col-md-6 offset-md-3">
		<form action="/addNewCustomer" method="post">
			<!-- 2 column grid layout with text inputs for the first and last names -->
			<div class="row mb-4">
				<div class="col">
					<div class="form-outline">

						<!-- Input field for username -->
						<label class="form-label" for="uname">First Name</label> <input
							type="text" id="uname" name="firstName" class="form-control"
							placeholder="First Name " required />
					</div>
				</div>

			</div>

			<!-- Message input -->
			<div class="form-outline mb-4">
				<label class="form-label" for="password">Last Name</label> <input
					type="text" id="password" name="lastName" class="form-control"
					placeholder="Last Name " required />


			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="password">Street</label> <input
					type="text" id="password" name="street" class="form-control"
					placeholder="Street" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="password">Address</label> <input
					type="text" id="password" name="address" class="form-control"
					placeholder="Address" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="password">City</label> <input
					type="text" id="password" name="city" class="form-control"
					placeholder="City" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="password">State</label> <input
					type="text" id="password" name="state" class="form-control"
					placeholder="State" />
			</div>

			<!-- Email input -->
			<div class="form-outline mb-4">
				<label class="form-label" for="email">Email</label> <input
					type="email" id="email" name="email" class="form-control"
					placeholder="Email" />

			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="phone_number">Phone Number</label> <input
					type="number" id="phone_number" name="phone" class="form-control"
					placeholder="Phone Number" />

			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-lg btn-primary">Submit</button>

			</div>


		</form>
	</div>
</body>
</html>