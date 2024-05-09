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
<style>
.popup {
	display: none;
	width: 350px;
	position: absolute;
	top: -125px;
	left: 72%;
	transform: translate(-50%, -50%);
	border: 1px solid #ccc;
	padding: 20px;
	background: #fff;
	z-index: 9999;
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-shadow: 2px 2px 15px #00000073;
	left: 72%;
}

.popup input {
	width: 300px;
	margin: 5px 0px;
	border: 1px solid lightgray;
}

.popup input[type="datetime-local"] {
	font-size: 11px;
	padding: 4px;
	color: #757575;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<div class="modal-body">
				<h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
				<form class="login-form" action="/patients" method="post">
					<div class="row">
						<div class="col-md-4">
							<label class="col-form-label spti-label">First Name</label> <span
								class="mandatory-sign">*</span> <input type="text"
								name="firstName" class="col-md-12 spti-inpt" placeholder="riya">
						</div>

						<div class="col-md-4">
							<label class="col-form-label spti-label">Last Name</label> <input
								type="text" name="lastName" class="col-md-12 spti-inpt"
								placeholder="cena">
						</div>

						<div class="col-md-4">
							<label class="col-form-label spti-label">Email</label> <input
								type="text" name="email" class="col-md-12 spti-inpt"
								placeholder="riya@gmail.com">
						</div>
						<div class="col-md-4">
							<label class="col-form-label spti-label">PhoneNumber</label> <input
								type="text" name="phoneNumber" class="col-md-12 spti-inpt"
								placeholder="e.g 9090981981">
						</div>

						<div class="col-md-4">
							<label class="col-form-label spti-label">Emergency
								ContactName</label> <input type="text" name="emergencyContactName"
								class="col-md-12 spti-inpt" placeholder="e.g Ram Anuse">
						</div>

						<div class="col-md-4">
							<label class="col-form-label spti-label">Emergency
								ContactNumber</label> <input type="text" name="emergencyContactNumber"
								class="col-md-12 spti-inpt" placeholder="e.g Ram Anuse">
						</div>
						<div class="col-md-3">
							<label class="col-form-label spti-label">Preferred Doctor</label>
							<select name="doctorId" class="col-md-12 spti-inpt">
								<option value="">Select doctor</option>
								<c:forEach items="${doctors }" var="doctor">
									<option value="${doctor.id }">${doctor.firstName }
										${doctor.lastName }</option>
								</c:forEach>

							</select>
						</div>
						<div class="col-md-3">
							<label class="col-form-label spti-label">Gender</label> <select
								name="gender" class="col-md-12 spti-inpt">
								<option value="">Select gender</option>
								<option value="MALE">Male</option>
								<option value="FEMALE">Female</option>
								<option value="OTHER">Other</option>
							</select>
						</div>

						<div class="col-md-3">
							<label class="col-form-label spti-label">Date of birth</label> <input
								type="datetime-local" name="dateOfBirth"
								class="col-md-12 spti-inpt">
						</div>

						<div class="col-md-3">
							<label class="col-form-label spti-label">Blood group</label> <select
								name="bloodType" class="col-md-12 spti-inpt">
								<option value="">Select group</option>
								<option value="A+">A+</option>
								<option value="A-">A-</option>
								<option value="B+">B+</option>
								<option value="AB+">AB+</option>
								<option value="AB-">AB-</option>
								<option value="O+">O+</option>
								<option value="O-">O-</option>
							</select>
						</div>

						<div class="col-md-6">
							<label class="col-form-label spti-label">Address</label>
							<textarea class="col-md-12 spti-textarea-height" name="address"
								placeholder="eg.Hadpsar, pune"></textarea>
						</div>

						<div class="col-md-6">
							<label class="col-form-label spti-label">Allergies</label>
							<textarea class="col-md-12 spti-textarea-height" name="allergies"
								placeholder="eg.some allergies"></textarea>
						</div>

						<div class="col-md-2">
							<label class="col-form-label spti-label">Occupation</label> <input
								type="text" name="occupation" class="col-md-12 spti-inpt"
								placeholder="e.g IT">
						</div>
						<div class="col-md-2">
							<label class="col-form-label spti-label">Nationality</label> <input
								type="text" name="nationality" class="col-md-12 spti-inpt"
								placeholder="e.g Indian">
						</div>
						<div class="col-md-3">
							<label class="col-form-label spti-label">Language spoken</label>
							<input type="text" name="languageSpoken"
								class="col-md-12 spti-inpt" placeholder="e.g Marathi">
						</div>

						<div class="col-md-3">
							<label class="col-form-label spti-label">Religion</label> <input
								type="text" name="religion" class="col-md-12 spti-inpt"
								placeholder="e.g hindu,muslim,Crist..">
						</div>

						<div class="col-md-2">
							<label class="col-form-label spti-label">Marital status</label> <select
								name="maritalStatus" class="col-md-12 spti-inpt">
								<option value="">Select status</option>
								<option value="MARRIED">Married</option>
								<option value="SINGLE">Single</option>
								<option value="DIVORCED">Divorced</option>
								<option value="WIDOWED">Widowed</option>
							</select>
						</div>
						<div class="col-md-12">
							<label class="col-form-label spti-label">Medical history</label>
							<textarea class="col-md-12 spti-textarea-height" row="3"
								name="medicalHistory" placeholder="eg.cold problem"></textarea>
						</div>

						



						<div class="col-md-7">
							<label class="col-form-label spti-label">Insurance</label> <input
								type="text" name="policyNumber" id="policyNumber"
								class="col-md-12 spti-inpt"> <input type="hidden"
								name="insuranceId" id="insuranceId" class="col-md-12 spti-inpt">
							<span style="color: red;" id="no-policy-found-msg"></span>
						</div>
						<div class="col-md-5">
							<button type="button" style="margin-top: 24px;"
								class="btn btn-primary btn-sm" onclick="searchPolicy()"><i class='bx bx-search-alt-2' ></i></button>
							<button type="button" style="margin-top: 24px;"
								class="btn btn-success btn-sm" onclick="showPopup()"><i class='bx bx-bookmark-alt-plus'></i></button>
							<button type="button" style="margin-top: 24px;"
								class="btn btn-danger btn-sm" onclick="clearPolicySearch()"><i class='bx bx-trash'></i></button>
						</div>
					</div>
					<div class="col-md-12" style="position: relative;">
						<div class="popup" id="popupForm">
							<form action="processForm.jsp" method="post">
								<input type="text" name="policyNumber" id="policy"
									placeholder="e.g 123456"> <input type="text"
									name="providerName" id="provider" placeholder="e.g Tata">
								<input type="datetime-local" name="expiryDate" id="expiryDate"
									placeholder="e.g Tata">
								<button class="btn btn-sm btn-secondary" onclick="closePopup()">Close</button>
								<button type="button" class="btn btn-sm btn-primary "
									onclick="addInsurtance()">Add</button>
							</form>

						</div>
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
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
		});

		function searchPolicy() {
			let policyNumber = document.getElementById("policyNumber").value;
			let xhr = new XMLHttpRequest();

			let url = '/insurance-details/policy-number/' + policyNumber;
			xhr.open("GET", url, true);

			xhr.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						let data = JSON.parse(this.responseText);
						console.log(data.id);
						console.log(document.getElementById("insuranceId"));
						document.getElementById("policyNumber").value = data.providerName;
						document.getElementById("policyNumber").disabled = "disabled";
						document.getElementById("insuranceId").value = data.id;
						document.getElementById("no-policy-found-msg").innerHTML = "";
					}
				} catch (error) {
					document.getElementById("policyNumber").value = "";
					document.getElementById("insuranceId").value = "";
					document.getElementById("no-policy-found-msg").innerHTML = "No policy found!!!";
				}
			}
			xhr.send();
		}

		function showPopup() {
			document.getElementById("popupForm").style.display = "block";
		}
		function clearPolicySearch() {
			document.getElementById("policyNumber").value = "";
			document.getElementById("insuranceId").value = "";
			document.getElementById("policyNumber").disabled = ""
		}
		function addInsurtance() {
			let policy = document.getElementById("policy").value;
			let provider = document.getElementById("provider").value;
			let expiryDate = document.getElementById("expiryDate").value;
			console.log(policy, provider);
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						let data = JSON.parse(this.responseText);
						document.getElementById("policyNumber").value = data.providerName;
						document.getElementById("policyNumber").disabled = "disabled"
						document.getElementById("insuranceId").value = data.id;
					}
				} catch (error) {
					console.error('An error occurred:', error);
				}
			};

			var jsonData = JSON.stringify({
				policyNumber : policy,
				providerName : provider,
				expiryDate : expiryDate
			});

			xhttp.open("POST", "/insurance-details", true);

			xhttp.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8");

			xhttp.send(jsonData);
			document.getElementById("popupForm").style.display = "none";
		}

		function closePopup() {
			document.getElementById("popupForm").style.display = "none";
		}
	</script>
</body>

</html>