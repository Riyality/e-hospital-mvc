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
.modal-title {
	font-weight: 800;
}

.modal-content {
	background-color: #F3E2A9;
	border: 1px solid #FFA533;
	border-radius: 10px;
}

.table {
	background-color: #fff;
}

.table th {
	background-color: #FFA533;
	color: black;
	font-size: 13px;
	font-weight: 600;
}

.table tr:nth-child(even) {
	background-color: #F9E79F;
	font-size: 13px;
}

.table tr:nth-child(odd) {
	background-color: #F5CBA7;
	font-size: 13px;
}

.btn-add {
	background-color: #3498DB;
	color: #fff;
}

.btn-add:hover {
	background-color: #2980B9;
}

.btn-cancel {
	background-color: #E74C3C;
	color: #fff;
}

.btn-cancel:hover {
	background-color: #C0392B;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<!-- Modal -->
			<div class="modal fade" id="addUserModel" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Prescription
								Details</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" onclick="window.history.back()">x</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<tr>
									<th>Type</th>
									<th>Name</th>
									<th>Dosage</th>
									<th>Instructions</th>
									<th>Days</th>
									<th>Quantity</th>
								</tr>
								<c:forEach items="${medicineList}" var="medicine">
									<tr>
										<td>${medicine.medicineType}</td>
										<td>${medicine.medicineName}</td>
										<td>${medicine.dosage}</td>
										<td>${medicine.instructions}</td>
										<td>${medicine.numDays}</td>
										<td>${medicine.tabletQuantity}</td>
									</tr>
								</c:forEach>
							</table>
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