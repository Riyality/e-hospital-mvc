<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.td-first-col {
	border-bottom: 1px solid gray;
	padding: 10px;
	width: 500px;
}

.td-second-col {
	border-bottom: 1px solid gray;
	padding: 10px;
}

#existing-appointment {
	display: none;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<input type="text" name="phoneNumber" placeholder="e.g 9090981981"
				id="phoneNumber">
			<button type="button" class="btn btn-primary btn-sm Spti-btn"
				onclick="searchPatientsByPhoneNumber()">Search</button>
			<hr>
			<div id="new-appointment" style="display: none;">
				<!-- <p style="color: red">No patient history detected. Add patient and book appointment</p>-->
				<a href="#" class="btn btn-primary btn-sm Spti-btn">Add Patient</a> 
				<img alt="" src="${pageContext.request.contextPath}/images/no-patient-history.svg" style="width: 100%;height: 500px">
			</div>
			<table id="existing-appointment">
				<tr>
					<th style="width: 500px;">Name</th>
					<th>Action</th>
				</tr>
				<tbody id="tbody">

				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		function searchPatientsByPhoneNumber() {
			let inpt = document.getElementById("phoneNumber");
			let phoneNumber = inpt.value;
			let xhr = new XMLHttpRequest();

			let url = '/appointments/phoneNumber/' + phoneNumber;
			xhr.open("GET", url, true);

			xhr.onreadystatechange = function() {
				document.getElementById('tbody').innerHTML = "";
				try {
					if (this.readyState == 4 && this.status == 200) {
						let data = JSON.parse(this.responseText);
						console.log(data);
						if (data.length == 0) {
							document.getElementById('existing-appointment').style.display = "none";
							document.getElementById('new-appointment').style.display = "block";
						} else {
							document.getElementById('new-appointment').style.display = "none";
							document.getElementById('existing-appointment').style.display = "block";
							for (var i = 0; i < data.length; i++) {
								let d = data[i];
								let tr = document.createElement('tr');
								let td = document.createElement('td');
								td.setAttribute('class', 'td-first-col');
								td.innerHTML = d.firstName + " " + d.lastName;
								tr.appendChild(td);
								let td2 = document.createElement('td');
								td2.setAttribute('class', 'td-second-col');
								let btn = document.createElement('button');
								btn.setAttribute('class',
										'btn btn-primary btn-sm');
								btn.innerHTML = "Book Appointment";
								btn.setAttribute('onclick',
										'bookAppointmmentForm(' + d.id + ')');
								td2.appendChild(btn);
								tr.appendChild(td2);
								document.getElementById('tbody')
										.appendChild(tr);
							}
						}
					}
				} catch (error) {
					console.log("error");
				}
			}
			xhr.send();
		}

		function bookAppointmmentForm(id) {
			let a = document.createElement('a');
			a.href = "/appointments/bookAppointmentsForm/patient/" + id;
			a.click();
		}
	</script>
</body>

</html>