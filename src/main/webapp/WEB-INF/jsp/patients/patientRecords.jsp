<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Records</title>
<link rel="icon" type="image/x-icon" href="Verity.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script defer type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<style>

body, html {
  
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin-bottom: 100px;
}

table {
	width: 	900px;
	border-collapse: collapse;
}

table, th, td, tr {
	border: 1px solid black !important;
	padding: 5px;
	 text-align: center;
}

.error {
	color: red;
	font-weight: bold;
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	
		
			
	<c:choose>
		<c:when test="${empty patients}">
			<p class="error">Record is not available</p>
		</c:when>
		<c:otherwise>

			<c:if test="${not empty patients}">
		 
				<table class="table table-new m-0 dataTable no-footer" style="max-width:100% !important; margin-left:0px; width:1121.55px;"
				area-describedby="tableID_info" role="gray" > 
					
					<thead>
						<tr>
						<tr role= "row">
							<th style="width: 25%;">Name</th>
							<th style="width: 25%;">Phone</th>
							<th style="width: 25%;">Address</th>
							<th style="width: 25%;">Action</th>


						</tr>
					</thead>
					<tbody>
						<c:forEach var="patient" items="${patients}">
							<tr>
							   
							  
								<td style="width: 25%;">${patient.firstName} ${patient.lastName}</td>
								<td style="width: 25%;">${patient.phoneNumber}</td>
								<td style="width: 25%;">${patient.address}</td>
								<td style="width: 25%;"><a class="btn btn-sm Spti-btn"
												href="/appointments/bookAppointmentsForm/patient/${patient.id}"
												style="right: 146px">Appointment</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:if>
		</c:otherwise>
	</c:choose>




	<script> 		
		$(document).ready( function() {
			loadTable(${list.number},
			${list.numberOfElements};
		)}; 
		</script>
</body>
</html>
