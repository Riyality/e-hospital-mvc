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

td {
	font-size: 0.9em;
	font-style: inherit;
	line-height: 1.33333;
	font-weight: 500;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">

			<h6>Current treatments</h6>

			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>02-11-2023</td>
						<td>Tab - Paracetamol - 500mg</td>
						<td>2 times a day</td>
						<td>115rs</td>
						<td><span class="badge bg-danger">Unpaid</span></td>
					</tr>
					<tr>
						<td>02-11-2023</td>
						<td>Tab - acetaminophen - 100mg</td>
						<td>3 times a day</td>
						<td>90rs</td>
						<td><span class="badge bg-success">Paid</span></td>
					</tr>
					<tr>
						<td>02-11-2023</td>
						<td>Syrup - Acebrophylline - 10ml</td>
						<td>5 times a day</td>
						<td>45rs</td>
						<td><span class="badge bg-danger">Unpaid</span></td>
					</tr>
					<tr>
						<td>02-11-2023</td>
						<td>Tab - ibuprofen - 500mg</td>
						<td>2 times a day</td>
						<td>165rs</td>
						<td><span class="badge bg-danger">Unpaid</span></td>
					</tr>
					<tr>
						<td>02-11-2023</td>
						<td>Tab - Bayer Aspirin - 500mg</td>
						<td>2 times a day</td>
						<td>200rs</td>
						<td><span class="badge bg-success">Paid</span></td>
					</tr>
				</tbody>
			</table>
			<form class="login-form" action="/admissions" method="post">
				<div class="row medicine-div" id="my-row">

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

					<button type="button" onclick="savePrescription()"
						class="btn btn-warning btn-sm add-btn float-end Spti-btn">Save</button>
					<button type="button"
						class="btn btn-secondary btn-sm cancel-btn float-end mx-1"
						onclick="window.history.back()">Cancel</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#addUserModel').modal('show');
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
	</script>
</body>

</html>