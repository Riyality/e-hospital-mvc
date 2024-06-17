<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="icon" type="image/x-icon" href="Verity.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js">
	
</script>

<script defer type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
</head>
<body>
      <jsp:include page="../common/header.jsp"></jsp:include>
<div class="height-90">
		<div class="main-content  ">
			<div class="modal-body">
				<h5 class="modal-title" id="exampleModalLabel">Report</h5>
				<hr>
				<form class="login-form" action="submitShowPatientsForm" >
					
						<div class="col-md-3">
							<label class="col-form-label spti-label">admission</label> <select
								name="type" class="col-md-12 spti-inpt">
								<option value="">Select group</option>
								<option value="todays" name="todays">Todays</option>
								<option value="weekly" name="weekly">Weekly</option>
								<option value="monthly" name="monthly">Monthly</option>
								<option value="yearly" name="yearly">Yearly</option>
								<option value="all">All</option>
								
							</select>
						</div>
						<button type="submit" class="btn btn-sm btn-primary ">show</button>

						
				</form>
			</div>

		
		
		
	
	<div class="height-90">
		<div class="main-content  ">
			<h5 class="modal-title" id="exampleModalLabel">Patients Admission Table</h5>
			<hr>
			<table class="table table-new m-0" id="tableID"
				style="max-width: 100% !important;">
				<thead>
					<tr>
						<th style="width: 25%;">Name</th>
						<th style="width: 15%;">Phone Number</th>
						<th style="width: 20%;">Diagnosis</th>
						
					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${patientsRecord1}" var="user">
						<tr>

							 <td style="width: 25%;"><div
									class=" d-flex justify-content-start align-items-center">
									<div class=" ">
										<span class="avatar-title"></span>
									</div>
									<div class="userName">
										<h5 class="m-0" style="cursor: pointer;">
									<%-- 	<a onclick="window.location.href='/admissions/details-form/${user.id}'"> --%>
											<a>${user.patientName}
												</a>
										</h5>
										<%-- <p class="text-muted mb-0">${user.bloodType}</p> --%>
									</div>
								</div></td> 
							<td style="width: 15%;">${user.contact}</td>
							<td style="width: 20%;">${user.diagnosis}</td>
							

							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</div>

</body>
</html>