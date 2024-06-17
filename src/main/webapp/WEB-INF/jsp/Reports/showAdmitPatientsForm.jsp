<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

		</div>
		
		
	</div>
      


</body>
</html>