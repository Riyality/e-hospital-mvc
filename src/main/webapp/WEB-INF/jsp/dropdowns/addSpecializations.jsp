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

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<!-- Modal -->
			<div class="modal fade" id="addUserModel" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add
								Specializations</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" onclick="window.history.back()">x</span>
							</button>
						</div>
						<div class="modal-body">
							<form class="login-form">
								<div class="row" id="input-row">
									<div class="col-md-12">
										<button type="button" class="btn btn-success"
											style="float: right" onclick="addSpecializationInput()">+</button>
									</div>
									<div class="col-md-12">
										<label class="col-form-label spti-label">Title</label> <input
											type="text" name="title"
											class="col-md-12 spti-inpt title-inpt"
											placeholder="e.g Allergists">
									</div>

								</div>
								<div class="col-md-12" style="position: relative;">
									<button type="button"
										class="btn btn-warning btn-sm add-btn float-end"
										onclick="addSpeciality()">Add</button>
									<button type="button"
										class="btn btn-secondary btn-sm cancel-btn float-end mx-1"
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
			$('#addUserModel').modal('show');
		});

		function addSpecializationInput() {
			let inptObj = document.getElementById('input-row');
			let div = document.createElement('div');
			div.setAttribute("class", "col-md-12");
			let input = document.createElement('input');
			input.setAttribute("class", "col-md-12 spti-inpt title-inpt");
			input.setAttribute("type", "text");
			input.setAttribute("placeholder", "e.g Allergists");
			input.setAttribute("name", "title");
			div.appendChild(input);
			inptObj.appendChild(div);
		}
		function addSpeciality() {
			let inpt = document.getElementsByClassName('title-inpt');
			let arrayObj = [];
			for (var i = 0; i < inpt.length; i++) {
				console.log(inpt[i].value)
				let obj = {
					title : inpt[i].value
				};
				arrayObj.push(obj);
			}

			let data = {
				doctorSpecializations : arrayObj
			};

			let wrapperData = {
				doctorSpecializations : data.doctorSpecializations
			};

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				try {
					if (this.readyState == 4 && this.status == 200) {
						$('#addUserModel').modal('hide');
						let a = document.createElement('a');
						a.href = "/dashboards/hr";
						a.click();
					}
				} catch (error) {
					console.error('An error occurred:', error);
					$('#addUserModel').modal('hide');
					let a = document.createElement('a');
					a.href = "/dashboards/hr";
					a.click();
				}
			};

			xhttp.open("POST", "/drop-downs/specializations", true);

			xhttp.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8");

			xhttp.send(JSON.stringify(wrapperData));
		}
	</script>
</body>

</html>