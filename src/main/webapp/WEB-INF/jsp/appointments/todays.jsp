<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>SPTI</title>
<link rel="icon" type="image/x-icon" href="Verity.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"> </script>

<script defer type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<link href="${pageContext.request.contextPath}/css/table.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/common.js"></script>

<style type="text/css">
.ward-table {
	background-color: #ddd;
}

.ward-table tr th {
	padding: 5px 1px 5px 1px;
	border-bottom: 1px solid #838282;
	font-size: 13px;
	font-weight: 600;
}

#tableID td {
    /* border-bottom: 1px solid #ddd; */
    padding: 4px !important;
}

</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<h5 class="modal-title" id="exampleModalLabel">Todays Appointments</h5>
			<hr class="mb-1">
			
			
			<table class="table table-new m-0" id="tableID" style="max-width: 100% !important;">
				<thead class="ward-table">
					<tr>
						<th style="width: 25%;">Name</th>
						<th style="width: 20%;">Phone number</th>
						<th style="width: 15%;">Time</th>
						<th style="width: 20%;">Doctor</th>
						<th style="width: 15%;">Status</th>
						<th style="width: 5%;">action</th>
					</tr> 
				</thead>
				<tbody>
					<c:forEach items="${appointments}" var="user">
						<tr>

							<td style="width:25%;"><div
									class=" d-flex justify-content-start align-items-center">
									<div class=" ">
										<span class="avatar-title">${fn:toUpperCase(fn:substring(user.patientName, 0, 1))}</span>
									</div>
									<div class="userName">
										<h5 class="m-0">
											<a href='/patients/details-form/${user.patientId}'>${user.patientName}</a>
										</h5>
									</div>
								</div></td>
							<td style="width:20%;">${user.phoneNumber}</td>
							<td style="width:15%;">${user.appointmentTime}</td>
							<td style="width:20%;">${user.doctorName}</td>
							<td style="width:15%;">${user.status}</td>

							<td style="width:5%;"><a
								href="http://localhost:8181/appointments/id/${user.id }"><i
									class="fa fa-pencil edit-icon" style="font-size: 14px"></i></a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	
</body>
</html>