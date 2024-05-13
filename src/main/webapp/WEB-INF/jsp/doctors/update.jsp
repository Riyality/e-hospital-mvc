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
	<div class="height-90">
		<div class="main-content  ">
		
			<div class="container-fluid">
							<h5 class="modal-title" id="exampleModalLabel">Update Doctor</h5>
							
						</div>
						<div class="modal-body ">
							<form class="login-form px-3" action="/hrs/doctors/update"
								method="post">
								<div class="row">
									<div class="col-md-6">
										<label class="col-form-label spti-label">First Name</label> <span
											class="mandatory-sign">*</span> <input type="hidden"
											name="id" value="${doctor.id}"> <input type="text"
											name="firstName" class="col-md-12 spti-inpt"
											placeholder="riya" value="${doctor.firstName}">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Last Name</label> <input
											type="text" name="lastName" class="col-md-12 spti-inpt"
											placeholder="cena" value="${doctor.lastName}">
									</div>
									<div class="col-md-6">
										<label class="col-form-label spti-label">Email</label> <input
											type="text" name="email" class="col-md-12 spti-inpt"
											placeholder="riya@gmail.com" value="${doctor.email}">
									</div>
									<div class="col-md-6">
										<label class="col-form-label spti-label">Phone Number</label>
										<input type="text" name="phoneNumber"
											class="col-md-12 spti-inpt" placeholder="e.g 9090981981"
											value="${doctor.phoneNumber}">
									</div>
									<div class="col-md-4">
										<label class="col-form-label spti-label">Specialization</label>
										<select name="specialization" class="col-md-12 spti-inpt">
											<option disabled="disabled" selected>Select
												specialization</option>
											<c:forEach items="${specializations }" var="specialization">

												<c:choose>
													<c:when
														test="${specialization.title == doctor.specialization }">
														<option value="${specialization.title }" selected>${specialization.title }</option>
													</c:when>
													<c:otherwise>
														<option value="${specialization.title }">${specialization.title }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-4">
										<label class="col-form-label spti-label">Experience</label> <input
											type="text" name="experience" class="col-md-12 spti-inpt"
											placeholder="e.g 2 years" value="${doctor.experience}">
									</div>

									<div class="col-md-4">
										<label class="col-form-label spti-label">Status</label> <select
											name="status" class="col-md-12 spti-inpt">

											<c:choose>
												<c:when test="${doctor.status == 'Active'}">
													<option value="Active" selected>Active</option>
													<option value="Inactive">Inactive</option>
													<option value="Away">Away</option>
												</c:when>
												<c:when test="${doctor.status == 'Inactive'}">
													<option value="Active">Active</option>
													<option value="Inactive" selected>Inactive</option>
													<option value="Away">Away</option>
												</c:when>
												<c:when test="${doctor.status == 'Away'}">
													<option value="Active">Active</option>
													<option value="Inactive">Inactive</option>
													<option value="Away" selected>Away</option>
												</c:when>
												<c:otherwise>
													<option disabled="disabled" selected>Select status</option>
													<option value="Active">Active</option>
													<option value="Inactive">Inactive</option>
													<option value="Away" selected>Away</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>

									<div class="col-md-4">
										<label class="col-form-label spti-label">Consultation
											Fee</label> <input type="text" name="consultationFee"
											class="col-md-12 spti-inpt" placeholder="e.g 500"
											value="${doctor.consultationFee}">
									</div>

									<div class="col-md-4">
										<label class="col-form-label spti-label">Available
											days</label> <input type="text" name="availableDays"
											class="col-md-12 spti-inpt"
											placeholder="e.g Monday to Friday"
											value="${doctor.availableDays}">
									</div>

									<div class="col-md-4">
										<label class="col-form-label spti-label">Available
											time slots</label> <input type="text" name="availableTimeSlots"
											class="col-md-12 spti-inpt" placeholder="e.g 11 to 5"
											value="${doctor.availableTimeSlots}">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Joining date</label>
										<input type="datetime-local" name="joiningDate"
											class="col-md-12 spti-inpt" value="${doctor.joiningDate}">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Qualifications</label>
										<input type="text" name="qualifications"
											class="col-md-12 spti-inpt" placeholder="e.g MBBS, BHMS"
											value="${doctor.qualifications}">
									</div>

									<div class="col-md-12">
										<label class="col-form-label spti-label">Address</label>
										<textarea class="col-md-12 spti-textarea-height"
											name="address" placeholder="eg.Hadpsar, pune">${doctor.address}</textarea>
									</div>
								</div>
								<div class="col-md-12">

									<button type="submit"
										class="btn btn-warning btn-sm add-btn float-end Spti-btn">Update</button>
									<button type="button"
										class="btn btn-secondary btn-sm cancel-btn float-end mx-1"
										onclick="window.history.back()">Cancel</button>
								</div>
							</form>
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