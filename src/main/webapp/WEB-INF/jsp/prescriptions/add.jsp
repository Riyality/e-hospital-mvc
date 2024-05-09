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
#selected-medicine-block {
	border: 1px solid lightgray;
	border-spacing: 30px;
}

#selected-medicine-block tr td {
	padding-right: 25px;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">



			<h5 class="modal-title" id="exampleModalLabel">Add Prescription</h5>
			<form class="login-form" action="/admissions" method="post">
				<div class="row medicine-div" id="my-row">
					<div class="col-md-12">
						<label class="col-form-label spti-label">Name</label> <span
							class="mandatory-sign">*</span> <input type="hidden"
							name="patientId" value="${patient.id }"> <input
							type="text" name="firstName" class="col-md-12 spti-inpt"
							placeholder="e.g 2"
							value="${patient.firstName } ${patient.lastName}"
							disabled="disabled">
					</div>

					<div class="col-md-6">
						<label class="col-form-label spti-label">Preferred doctor</label>
						<select name="doctorId" id="select-doctor"
							class="col-md-12 spti-inpt">
							<c:forEach items="${doctors }" var="doctor">
								<c:if test="${doctor.id == doctorId}">
									<option value="${doctor.id }">${doctor.firstName}
										${doctor.lastName }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-6">
						<label class="col-form-label spti-label">Prescription Date</label>
						<input type="datetime-local" name="prescriptionDate"
							class="col-md-12 spti-inpt" id="prescriptionDate">
					</div>
					<div class="col-md-2">
						<label class="col-form-label spti-label">Type</label> <select
							name="medicineType" class="col-md-12 spti-inpt">
							<option>select type</option>
							<c:forEach items="${medicineTypes }" var="medicine">
								<option value="${medicine.type }">${medicine.type }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-3">
						<label class="col-form-label spti-label">Medicine name</label> <input
							type="text" name="medicineName" class="col-md-12 spti-inpt">
					</div>
					<div class="col-md-1">
						<label class="col-form-label spti-label">Dosage</label> <input
							type="text" name="dosage" class="col-md-12 spti-inpt">
					</div>

					<div class="col-md-3">
						<label class="col-form-label spti-label">Instructions</label> <input
							type="text" name="instructions" class="col-md-12 spti-inpt">
					</div>

					<div class="col-md-1">
						<label class="col-form-label spti-label">Days</label> <input
							type="text" name="numDays" class="col-md-12 spti-inpt">
					</div>
					<div class="col-md-1">
						<label class="col-form-label spti-label">Quantity</label> <input
							type="text" name="tabletQuantity" class="col-md-12 spti-inpt">
					</div>
					<div class="col-md-1">
						<label class="col-form-label spti-label">Add</label>
						<button type="button" onclick="saveMedicine()"
							class="btn btn-success btn-sm col-md-12 spti-inpt">+</button>
					</div>
				</div>
				<hr>
				
				<div class="col-md-12">
					<table class="table" style="display: none;" id="prescription-table">
						<thead>
							<tr>
								<th scope="col">Type</th>
								<th scope="col">Medicine</th>
								<th scope="col">Dosage</th>
								<th scope="col">Info</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody id="precscription-body">

						</tbody>
					</table>
				</div>
				<div class="col-md-12">
					<a href="/generate-pdf/${patient.id }"
						class="btn btn-warning btn-sm add-btn float-end Spti-btn">Print</a>
					<button type="button" onclick="savePrescription()"
						class="btn btn-warning btn-sm add-btn float-end Spti-btn mx-2">Save</button>
					<button type="button"
						class="btn btn-secondary btn-sm cancel-btn float-end"
						onclick="window.history.back()">Cancel</button>

				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
		});
		
		 document.addEventListener('DOMContentLoaded', function() {
		        var currentDate = new Date().toISOString().slice(0, 16);
		        document.getElementById('prescriptionDate').value = currentDate;
		    });

		let medicines = [];
		let rowCount = 1;
		function saveMedicine() {
			let medicineBlock = document
					.getElementById('prescription-table');
			let medicine = {
				medicineType : document.querySelector('[name="medicineType"]').value,
				medicineName : document.querySelector('[name="medicineName"]').value,
				dosage : document.querySelector('[name="dosage"]').value,
				instructions : document.querySelector('[name="instructions"]').value,
				numDays : document.querySelector('[name="numDays"]').value,
				tabletQuantity : document
						.querySelector('[name="tabletQuantity"]').value
			};

			medicines.push(medicine);
			medicineBlock.style.display="inline-table";
			medicineBlock.style.width="100%";
			 let tr = document.createElement( 'tr' );
	           
	            let td1 = document.createElement( 'td' );
	            td1.innerHTML = document.querySelector('[name="medicineType"]').value;
	            let td2 = document.createElement( 'td' );
	            let div = document.createElement( 'div' );
	            let h6 = document.createElement( 'h6' );
	            h6.setAttribute( "class", "h6-label" );
	            h6.innerHTML = document.querySelector('[name="medicineName"]').value;
	            let p = document.createElement( 'small' );
	            p.setAttribute( 'class', 'm-0 p-0' );
	            p.innerHTML = document.querySelector('[name="instructions"]').value;
	            td2.appendChild( h6 );
	            td2.appendChild( p );

	            let td3 = document.createElement( 'td' );
	            td3.innerHTML = document.querySelector('[name="dosage"]').value;

	            let td4 = document.createElement( 'td' );
	            td4.innerHTML = "Qnty: "+document
				.querySelector('[name="tabletQuantity"]').value+" "+document.querySelector('[name="numDays"]').value+" days";

	            let td5 = document.createElement( 'td' );
	            let i1 = document.createElement( 'i' );
	            i1.setAttribute( 'class', "fa fa-pencil-square-o mx-3 text-primary" );
	            i1.setAttribute( 'aria-hidden', 'true' );

	            let i2 = document.createElement( 'i' );
	            i2.setAttribute( 'class', "fa fa-trash text-danger" );
	            i2.setAttribute( 'aria-hidden', 'true' );

	            td5.appendChild( i1 );
	            td5.appendChild( i2 );

	            tr.appendChild( td1 );
	            tr.appendChild( td2 );
	            tr.appendChild( td3 );
	            tr.appendChild( td4 );
	            tr.appendChild( td5 );
	            document.getElementById( 'precscription-body' ).appendChild( tr );

			document.querySelector('[name="medicineType"]').value = "select type";
			document.querySelector('[name="medicineName"]').value = "";
			document.querySelector('[name="dosage"]').value = "";
			document.querySelector('[name="instructions"]').value = "";
			document.querySelector('[name="numDays"]').value = "";
			document.querySelector('[name="tabletQuantity"]').value = "";

			rowCount++;

		}

		function savePrescription() {
			let patientId = ${patient.id};
			let doctorSelect = document.getElementById('select-doctor');
			let doctorId = doctorSelect.value;
			
			let prescriptionDate = document.getElementById('prescriptionDate').value;
			
			let obj = {
					patientId:patientId,
					doctorId:doctorId,
					prescriptionDate:prescriptionDate,
					medicines:medicines
			};

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						let data = JSON.parse(this.responseText);
						console.log(data);
						$('#addUserModel').modal('hide');
					}
				} catch (error) {
					console.error('An error occurred:', error);
					$('#addUserModel').modal('hide');
				}
			};

			var jsonData = JSON.stringify(obj);

			xhttp.open("POST", "/prescriptions", true);

			xhttp.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8");

			xhttp.send(jsonData);
		}

		function getCots() {
			let wardSelect = document.getElementById('wardId');
			let value = wardSelect.value;

			let xhr = new XMLHttpRequest();

			let url = '/cots/available/wards/' + value;
			xhr.open("GET", url, true);

			xhr.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						let data = JSON.parse(this.responseText);
						let select = document.getElementById('cotId');
						select.innerHTML = "";
						let opt1 = document.createElement('option');
						opt1.innerHTML = "Select cot";
						opt1.disabled = "disabled";
						opt1.selected = "selected";
						select.appendChild(opt1);
						for (var i = 0; i < data.length; i++) {
							let temp = data[i];
							let option = document.createElement('option');
							option.value = temp.id;
							option.innerHTML = temp.cotNumber;
							select.appendChild(option);
						}
					}
				} catch (error) {
					console.log("error")
				}
			}
			xhr.send();
		}

		function addMedicine1() {

		}
	</script>
</body>

</html>