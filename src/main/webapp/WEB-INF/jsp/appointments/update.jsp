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
			<!-- Modal -->
			<div class="modal fade" id="addUserModel" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update
								Appoinment</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" onclick="window.history.back()">x</span>
							</button>
						</div>
						<div class="modal-body">
							<form class="login-form" action="/appointments/update" method="post">
								<div class="row">
									<div class="col-md-12">
										<label class="col-form-label spti-label">Name</label> <span
											class="mandatory-sign">*</span> <input type="hidden"
											name="id" class="col-md-12 spti-inpt"
											placeholder="e.g 2" value="${data.id }"><input type="hidden"
											name="patientId" class="col-md-12 spti-inpt"
											placeholder="e.g 2" value="${patient.id }"><input
											type="text" name="firstName" class="col-md-12 spti-inpt"
											placeholder="e.g 2"
											value="${patient.firstName } ${patient.lastName}"
											disabled="disabled">
									</div>

									<div class="col-md-12">
										<label class="col-form-label spti-label">Phone number</label>
										<input type="text" name="phoneNumber"
											class="col-md-12 spti-inpt" value="${patient.phoneNumber }"
											readonly="readonly">
									</div>

									<div class="col-md-12">
										<label class="col-form-label spti-label">Appoinment
											Date</label> <input type="datetime-local" name="appointmentDate"
											class="col-md-12 spti-inpt" value="${data.appointmentDate }">
									</div>


									<div class="col-md-12">
										<label class="col-form-label spti-label">Appoinment
											time</label> <input type="time" name="appointmentTime"
											class="col-md-12 spti-inpt" value="${data.appointmentTime }" step="60">
									</div>


									<div class="col-md-12">
										<label class="col-form-label spti-label">Preferred
											doctor</label> <select name="doctorId" class="col-md-12 spti-inpt">
											<option disabled="disabled" selected>Select doctor</option>
											<c:forEach items="${doctors }" var="doctor">
												<c:choose>
													<c:when test="${doctor.id == data.doctorId}">
														<option value="${doctor.id }" selected="selected">${doctor.firstName}
															${doctor.lastName }</option>
													</c:when>
													<c:otherwise>
														<option value="${doctor.id }">${doctor.firstName}
															${doctor.lastName }</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</select>
									</div>

									<div class="col-md-12">
										<label class="col-form-label spti-label">Status</label> <select
											name="status" class="col-md-12 spti-inpt">
											<option disabled="disabled" selected>Select status</option>
											<c:choose>
												<c:when test="${data.status == 'Confirmed' }">
													<option value="Confirmed" selected="selected">Confirmed</option>
													<option value="Need to Confirm">Need to Confirm</option>
													<option value="Completed">Completed</option>
												</c:when>
												<c:when test="${data.status == 'Need to Confirm' }">
													<option value="Confirmed">Confirmed</option>
													<option value="Need to Confirm" selected="selected">Need to Confirm</option>
													<option value="Completed">Completed</option>
												</c:when>
												<c:when test="${data.status == 'Completed' }">
													<option value="Confirmed">Confirmed</option>
													<option value="Need to Confirm">Need to Confirm</option>
													<option value="Completed" selected="selected">Completed</option>
												</c:when>
												<c:otherwise>
													<option value="Confirmed">Confirmed</option>
													<option value="Need to Confirm">Need to Confirm</option>
													<option value="Completed">Completed</option>
												</c:otherwise>
											</c:choose>

										</select>
									</div>

									<div class="col-md-12">
										<label class="col-form-label spti-label">Notes</label>
										<textarea class="col-md-12 spti-textarea-height" name="notes"
											placeholder="eg.Hadpsar, pune"></textarea>
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
		</div>
	</div>
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
		});
	</script>
</body>

</html>