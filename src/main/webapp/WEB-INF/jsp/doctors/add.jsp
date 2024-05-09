<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>SPTI</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- Import jquery cdn -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous">
	
</script>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
			
		  <div class="row">
			<div class="col-md-8">
		<div class="main-content  ">
		
		 <div class="container">

			<h5 class="">Add Doctor</h5>
			<form class="login-form" action="doctors" method="post">
				<div class="row">
					<div class="col-md-6">
						<label class="col-form-label spti-label">First Name</label> <span
							class="mandatory-sign">*</span> <input type="text"
							name="firstName" class="col-md-12 spti-inpt" placeholder="riya">
					</div>

					<div class="col-md-6">
						<label class="col-form-label spti-label">Last Name</label> <input
							type="text" name="lastName" class="col-md-12 spti-inpt"
							placeholder="cena">
					</div>
					<div class="col-md-6">
						<label class="col-form-label spti-label">Email</label> <input
							type="text" name="email" class="col-md-12 spti-inpt"
							placeholder="riya@gmail.com">
					</div>
					<div class="col-md-6">
						<label class="col-form-label spti-label">Phone Number</label> <input
							type="text" name="phoneNumber" class="col-md-12 spti-inpt"
							placeholder="e.g 9090981981">
					</div>
					<div class="col-md-4">
						<label class="col-form-label spti-label">Specialization</label> <select
							name="specialization" class="col-md-12 spti-inpt">
							<option disabled="disabled" selected>Select
								specialization</option>
							<c:forEach items="${specializations }" var="specialization">
								<option value="${specialization.title }">${specialization.title }</option>
							</c:forEach>

						</select>
					</div>
					<div class="col-md-4">
						<label class="col-form-label spti-label">Experience</label> <input
							type="text" name="experience" class="col-md-12 spti-inpt"
							placeholder="e.g 2 years">
					</div>

					<div class="col-md-4">
						<label class="col-form-label spti-label">Status</label> <select
							name="status" class="col-md-12 spti-inpt">
							<option disabled="disabled" selected>Select status</option>
							<option value="Active">Active</option>
							<option value="Inactive">Inactive</option>
							<option value="Away">Away</option>
						</select>
					</div>

					<div class="col-md-4">
						<label class="col-form-label spti-label">Consultation Fee</label>
						<input type="text" name="consultationFee"
							class="col-md-12 spti-inpt" placeholder="e.g 500">
					</div>

					<div class="col-md-4">
						<label class="col-form-label spti-label">Available days</label> <input
							type="text" name="availableDays" class="col-md-12 spti-inpt"
							placeholder="e.g Monday to Friday">
					</div>

					<div class="col-md-4">
						<label class="col-form-label spti-label">Available time
							slots</label> <input type="text" name="availableTimeSlots"
							class="col-md-12 spti-inpt" placeholder="e.g 11 to 5">
					</div>

					<div class="col-md-6">
						<label class="col-form-label spti-label">Joining date</label> <input
							type="datetime-local" name="joiningDate"
							class="col-md-12 spti-inpt">
					</div>

					<div class="col-md-6">
						<label class="col-form-label spti-label">Qualifications</label> <input
							type="text" name="qualifications" class="col-md-12 spti-inpt"
							placeholder="e.g MBBS, BHMS">
					</div>

					<div class="col-md-12">
						<label class="col-form-label spti-label">Address</label>
						<textarea class="col-md-12 spti-textarea-height" name="address"
							placeholder="eg.Hadpsar, pune" ></textarea>
					</div>
				</div>
				<div class="col-md-12">

					<button type="submit"
						class="btn btn-warning btn-sm add-btn float-end Spti-btn">Add</button>
					<button type="button"
						class="btn btn-secondary btn-sm cancel-btn float-end mx-1"
						onclick="window.history.back()">Cancel</button>
				</div>
			</form>
		</div>
	</div>
	</div>
  </div>
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
		});
	</script>
</body>

</html>