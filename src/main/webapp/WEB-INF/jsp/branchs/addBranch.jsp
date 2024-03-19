<!DOCTYPE html>
<html>
<head>
<title>Add Branch</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">

			<!-- Modal -->
			<div class="modal fade" id="addModuleModel" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">

				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Branch</h5>

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							</button>
						</div>

						<div class="modal-body">

							<form class="login-form" action="branch" method="post">


								<div class="col-md-6">
									<label class="col-form-label"> Name</label> <input type="text"
										name="name" class="col-md-12 spti-inpt"
										placeholder="Magarpatta">
								</div>
								<div class="col-md-6">
									<label class="col-form-label">Address</label> <input
										type="text" name="address" class="col-md-12 spti-inpt"
										placeholder="Pune">
								</div>
								<div class="col-md-6">
									<button type="submit" class="btn btn-primary btn-md add-btn">Add</button>
									<button type="button" class="btn btn-danger btn-md cancel-btn"
										onclick="window.history.back()">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
    $(window).on('load', function() {
        $('#addModuleModel').modal('show');
    });
</script>
</body>

</html>