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
							<h5 class="modal-title" id="exampleModalLabel">Update Ward</h5>
							
						</div>
						<div class="modal-body">
							<form class="login-form" action="/wards/update" method="post">
								<div class="row">
									<div class="col-md-12">
										<label class="col-form-label spti-label">Ward Name</label> <span
											class="mandatory-sign">*</span> <input type="hidden"
											name="id" class="col-md-12 spti-inpt"  value="${ward.id }"><input type="text"
											name="wardName" class="col-md-12 spti-inpt"
											placeholder="e.g ward 01" value="${ward.wardName }">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Max capacity</label>
										<input type="text" name="maxCapacity"
											class="col-md-12 spti-inpt" placeholder="e.g 20"
											value="${ward.maxCapacity }">
									</div>
									<div class="col-md-6">
										<label class="col-form-label spti-label">Current
											occupancy</label> <input type="text" name="currentOccupancy"
											class="col-md-12 spti-inpt" placeholder="e.g 15"
											value="${ward.currentOccupancy }">
									</div>
									<div class="col-md-6">
										<label class="col-form-label spti-label">floor number</label>
										<input type="text" name="floorNumber"
											class="col-md-12 spti-inpt" placeholder="e.g 2"
											value="${ward.floorNumber }">
									</div>
									<div class="col-md-6">
										<label class="col-form-label spti-label">Wing</label> <input
											type="text" name="wing" class="col-md-12 spti-inpt"
											placeholder="e.g B wing" value="${ward.wing }">
									</div>
									
									<div class="col-md-4">
										<label class="col-form-label spti-label">Charges</label> <input
											type="text" name="charges" class="col-md-12 spti-inpt"
											placeholder="e.g 500"  value="${ward.charges }">
									</div>
									
									<div class="col-md-4">
										<label class="col-form-label spti-label">Status</label> <select
											name="status" class="col-md-12 spti-inpt">
											<c:choose>
												<c:when test="${ward.status == 'Active' }">
													<option disabled="disabled">Select status</option>
													<option value="Active" selected>Active</option>
													<option value="Inactive">Inactive</option>
												</c:when>
												<c:when test="${ward.status == 'Inactive' }">
													<option disabled="disabled" selected>Select status</option>
													<option value="Active">Active</option>
													<option value="Inactive">Inactive</option>
												</c:when>
												<c:otherwise>
													<option disabled="disabled" selected>Select status</option>
													<option value="Active">Active</option>
													<option value="Inactive">Inactive</option>
												</c:otherwise>
											</c:choose>

										</select>
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