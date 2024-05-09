<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>
<title>SPTI</title>
<link rel="icon" type="image/x-icon" href="Verity.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<div class="section">
				<table class="table table-hover">
					<tr>
						<th>Name</th>
						<th>Address</th>
						<th></th>
					</tr>
					<c:forEach items="${list}" var="branch">
						<tr>
							<td>
							<div class=" d-flex justify-content-start align-items-center">
									<div class=" ">
										<span class="avatar-title">${fn:toUpperCase(fn:substring(branch.name, 0, 1))}</span>
									</div>
									<div class="userName">
										<h5 class="m-0">
											<a >${branch.name}</a>
										</h5>
									</div>
								</div>
							
							
							
							</td>
							<td>${branch.address}</td>
							
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>
</body>
</html>

