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
<style type="text/css">
.bed-image {
	width: 100px;
	/* border: 1px solid lightgray; */
	margin: 10px;
}

.image-btn {
	border: none;
	background: none;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
		
			<div class="container-fluid">
							<h5 class="modal-title" id="exampleModalLabel">Patient
								admission form</h5>
							
						</div>
						<div class="modal-body">
							<form class="login-form" action="/admissions" method="post">
								<div class="row">
									<div class="col-md-12">
										<label class="col-form-label spti-label">Name</label> <span
											class="mandatory-sign">*</span> <input type="hidden"
											name="patientId" class="col-md-12 spti-inpt"
											placeholder="e.g 2" value="${patient.id }"><input
											type="hidden" name="cotId" id="cotId"
											class="col-md-12 spti-inpt" placeholder="e.g 2" value="0"><input
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

									<div class="col-md-6">
										<label class="col-form-label spti-label">Admission
											Date</label> <input type="datetime-local" name="admissionDate"
											class="col-md-12 spti-inpt">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Discharge
											Date</label> <input type="datetime-local" name="dischargeDate"
											class="col-md-12 spti-inpt">
									</div>


									<div class="col-md-6">
										<label class="col-form-label spti-label">Preferred
											doctor</label> <select name="doctorId" class="col-md-12 spti-inpt">
											<option disabled="disabled" selected>Select doctor</option>
											<c:forEach items="${doctors }" var="doctor">
												<option value="${doctor.id }">${doctor.firstName}
													${doctor.lastName }</option>
											</c:forEach>
										</select>
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Kin Name</label> <input
											type="text" name="nextOfKinName" class="col-md-12 spti-inpt">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Kin
											relationship</label> <input type="text" name="nextOfKinRelationship"
											class="col-md-12 spti-inpt">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Kin contact</label> <input
											type="text" name="nextOfKinPhoneNumber"
											class="col-md-12 spti-inpt">
									</div>

									<div class="col-md-6">
										<label class="col-form-label spti-label">Ward</label> <select
											name="wardId" class="col-md-12 spti-inpt"
											onchange="getCots()" id="wardId">
											<option disabled="disabled" selected>Select ward</option>
											<c:forEach items="${wards }" var="ward">
												<option value="${ward.id }">${ward.wardName }</option>
											</c:forEach>
										</select>
									</div>

								</div>
								<div class="col-md-12">

									<button type="submit"
										class="btn btn-warning btn-sm add-btn Spti-btn float-end Spti-btn">Add</button>
									<button type="button"
										class="btn btn-secondary btn-sm cancel-btn float-end mx-1"
										onclick="window.history.back()">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
	

	<div class="modal fade" id="ward-allocation" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content bg-light">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Select Cot</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" onclick="closeCotDialog()">x</span>
					</button>
				</div>
				<div class="modal-body d-flex flex-wrap" id="img-block"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
		});
		var cotId = 0;
		function getCots() {
			let imgBlock = document.getElementById('img-block');
			imgBlock.innerHTML = "";
			let wardSelect = document.getElementById('wardId');
			let value = wardSelect.value;

			let xhr = new XMLHttpRequest();

			let url = '/cots/wards/' + value;
			xhr.open("GET", url, true);

			xhr.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						$('#ward-allocation').modal('show');
						let data = JSON.parse(this.responseText);

						for (var i = 0; i < data.length; i++) {
							let temp = data[i];
							let div = document.createElement('div');
							div.setAttribute('class', 'card text-center m-1');
							div.style.width = "10rem";

							let btn = document.createElement('button');
							btn.setAttribute('onclick', 'getCotId(' + temp.id
									+ ',this)');
							btn.setAttribute('class', 'image-btn');
							if (temp.status == "Occupied") {
								btn.disabled = "disabled";
								btn.style.opacity = "0.3";
							}
							let img = document.createElement('img');
							img
									.setAttribute('src',
											'${pageContext.request.contextPath}/images/bed.jpeg');
							img.setAttribute('class', 'bed-image img-thumbnail');
							btn.appendChild(img);

							let span = document.createElement('span');
							span.innerHTML = temp.cotNumber;
							span.style.fontSize='13px';
							span.style.fontWeight='bold';
							div.appendChild(btn);
							div.appendChild(span);
							imgBlock.appendChild(div);
						}
					}
				} catch (error) {
					console.log("error")
				}
			}
			xhr.send();
		}
		function getCotId(id, e) {
			console.log(e);
			e.disabled = "disabled";
			e.style.opacity = "0.3";
			document.getElementById('cotId').value = id;
		}
		function closeCotDialog() {
			$('#ward-allocation').modal('hide');
		}
	</script>
</body>

</html>