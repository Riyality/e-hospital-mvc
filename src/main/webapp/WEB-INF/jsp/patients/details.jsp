<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			<!DOCTYPE html>
			<html>

			<head>
				<title>SPTI</title>
				<link rel="icon" type="image/x-icon" href="Verity.png">
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
				<style>
					/* Add your custom CSS styles here */
					.patient-details {
						background-color: #f7f7f7;
						padding: 20px;
						border-radius: 5px;
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
					}

					.patient-name {
						font-size: 20px;
						font-weight: bold;
						margin-bottom: 10px;
					}

					strong {
						font-size: 14px;
					}

					li {
						font-size: 12px;
					}

					/* Add more custom styles as needed */
				</style>
			</head>

			<body>
				<jsp:include page="../common/header.jsp"></jsp:include>
				<div class="height-90">
					<div class="main-content">
						<div class="container-fluid">
							<h5 class="modal-title" id="exampleModalLabel">Patients Overview</h5>
							<hr>
							<div class="row">
								<div class="col-md-12 PatientsOverview">
									<div class="card">
										<div class="card-body">
											<a class="btn btn-sm Spti-btn"
												href="/prescriptions/addPrescriptions/patient/${patientList.id }">Add
												prescription</a>
											<a class="btn btn-sm Spti-btn"
												href="/admissions/treatments/admissions/${patientList.id}"
												style="right: 146px">Treatment history</a>
											<div class="row">
												<div class="col-md-2">
													<img src="https://picsum.photos/200/300" class="img-thumbnail"
														alt="...">
												</div>
												<div class="col-md-10">
													<div class="border-bottom pb-2 my-2">
														<h2>${patientList.firstName} ${patientList.lastName}</h2>
														<p class="m-0 p-0">679 padmavati sahakarnagar 01 near power
															House</p>
													</div>
													<div class="row">
														<div class="col-md-4">
															<label class="spti-label">Phone Number:</label>
															<p>${patientList.phoneNumber}</p>
														</div>
														<div class="col-md-4">
															<label class="spti-label">Phone Email:</label>
															<p>${patientList.email}</p>
														</div>
														<div class="col-md-4">
															<label class="spti-label">Emergency Contact:</label>
															<p>${patientList.emergencyContactName}
																${patientList.emergencyContactNumber}</p>
														</div>
														<div class="col-md-4">
															<label class="spti-label">Occupation:</label>
															<p>${patientList.occupation}</p>
														</div>
														<div class="col-md-4">
															<label class="spti-label">Marital Status:</label>
															<p>${patientList.maritalStatus}</p>
														</div>
														<div class="col-md-4">
															<label class="spti-label">Nationality:</label>
															<p>${patientList.nationality}</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row my-2">
								<div class="col-md-3">
									<div class="card"
										style="background: linear-gradient(90deg, #a9ffc687 0%, #8ecfff8f 100%);">
										<div class="card-body" style="height: 38vh; overflow-y: auto;">
											<div class="col-md-12 border-bottom">
												<label class="spti-label">Blood Type:</label>
												<p>${patientList.bloodType}</p>
											</div>
											<div class="col-md-12 border-bottom">
												<label class="spti-label">Allergies:</label>
												<p>${patientList.allergies}</p>
											</div>
											<div class="col-md-12 border-bottom">
												<label class="spti-label">Language Spoken:</label>
												<p>${patientList.languageSpoken}</p>
											</div>
											<div class="col-md-12 border-bottom">
												<label class="spti-label">Religion:</label>
												<p>${patientList.religion}</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="card">
										<div class="card-body PatientsPrescriptionWrapper">
											<nav>
												<div class="nav nav-tabs flex-row justify-content-start" id="nav-tab"
													role="tablist">
													<button class="nav-link active" id="nav-profile-tab"
														data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
														role="tab" aria-controls="nav-profile" aria-selected="true"
														onclick="getPrescriptionHistory(${patientList.id})">Prescription</button>
													<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
														data-bs-target="#nav-contact" type="button" role="tab"
														aria-controls="nav-contact" aria-selected="false"
														onclick="getAdmissionHistory(${ patientList.id })">Admission</button>
												</div>
											</nav>
											<div class="tab-content" id="nav-tabContent">
												<div class="tab-pane fade show active" id="nav-profile" role="tabpanel"
													aria-labelledby="nav-profile-tab">
													<div class="prescription-history">
														<ul
															style="list-style-type: none; margin: 10px; font-weight: 600px">
															<c:forEach items="${prescriptionList}" var="prescription">
																<li class="list-group-item">
																	<a
																		href="<c:url value='/prescriptions/medicine?id=${prescription.prescriptionId}' />">
																		<span>
																			<c:out
																				value="${prescription.prescriptionDate}" />
																		</span>
																	</a><br>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="tab-pane fade" id="nav-contact" role="tabpanel"
													aria-labelledby="nav-contact-tab">

													<div class="admission-history">

														<ul
															style="list-style-type: none; margin: 10px; font-weight: 600px">
															<!-- <c:forEach items="${prescriptionList}" var="prescription">
																<li class="list-group-item">
																	<a
																		href="<c:url value='/prescriptions/medicine?id=${prescription.prescriptionId}' />">
																		<span>
																			<c:out
																				value="${prescription.prescriptionDate}" />
																		</span>
																	</a><br>
																</li>
															</c:forEach> -->
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Add Bootstrap JS and jQuery scripts here -->
				<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

				<script type="text/javascript">
					$(document).ready(function () {
						getPrescriptionHistory(${ patientList.id });

						// Event delegation to handle clicks on dynamically added list items
						$(document).on('click', '.admission-history li', function () {
							var prescriptionId = $(this).data('admission-id');
							console.log("Clicked Admission ID:", prescriptionId); // Debugging

							$.ajax({
								type: 'GET',
								url: '/treatment/treatmentDetails/id/' + prescriptionId,
								success: function (data) {
									console.log("Treatment Details:", data); // Debugging
									// Populate the modal with the prescription details
									var tableBody = $("#addUserModel .modal-body table tbody");
									tableBody.empty(); // Clear existing rows

									data.forEach(function (treatment) {
										var row = $("<tr>").append(
											$("<td>").text(treatment.treatment_date),
											$("<td>").text(treatment.medicine),
											$("<td>").text(treatment.medicine_type),
											$("<td>").text(treatment.quantity),
											$("<td>").text(treatment.price),
											$("<td>").text(treatment.payment)
										);
										tableBody.append(row);
									});

									// Show the modal
									$("#addUserModel").modal('show');
								},
								error: function () {
									// Handle errors here
									console.error('Error fetching treatment details');
								}
							});
						});
					});

					function getPrescriptionHistory(id) {
						$.ajax({
							type: 'GET',
							url: '/prescriptions/allPrescriptions/' + id,
							success: function (data) {
								var listContainer = $(".prescription-history ul");
								listContainer.empty(); // Clear the current list items

								if (data && data.length > 0) {
									data.forEach(function (prescription) {
										var listItem = $("<li>")
											.data('prescription-id', prescription.prescriptionId) // Store prescriptionId in data attribute
											.append(
												$("<a>").attr("href", "/prescriptions/medicine?id=" + prescription.prescriptionId).append(
													$("<span>").text(prescription.prescriptionDate + " Diagnosis: " + prescription.diagnosis + "  Seen By " + prescription.doctorName)
												)
											);
										listContainer.append(listItem);
									});
								} else {
									listContainer.append("<li>No prescription history found.</li>");
								}
							},
							error: function () {
								// Handle errors here
								console.error('Error fetching prescription history');
							}
						});
					}

					function getAdmissionHistory(id) {
						$.ajax({
							type: 'GET',
							url: '/admissions/admission-history/patient/' + id,
							success: function (data) {
								console.log("Admission Details:", data);
								var listContainer = $(".admission-history ul");
								listContainer.empty(); // Clear the current list items

								if (data && data.length > 0) {
									data.forEach(function (admission) {
										var listItem = $("<li>").append(
											$("<a>").attr("href", "#").append(
												$("<span>").text(admission.admissionDate + " Diagnosis: " + admission.diagnosis + "  Seen By " + admission.doctorName)
											)
										).data('admission-id', admission.admissionId); // Assuming you have a prescriptionId in the response
										listContainer.append(listItem);
									});
								} else {
									listContainer.append("<li>No Admission history found.</li>");
								}
							},
							error: function () {
								// Handle errors here
								console.error('Error fetching admission history');
							}
						});
					}
				</script>

				<!-- OPD Modal -->
				<div class="modal fade" id="addUserModel" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Treatment Details</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true" onclick="window.history.back()">x</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table">
									<thead>
										<tr>
											<th>Treatment Date</th>
											<th>Medicine Type</th>
											<th>Medicine</th>
											<th>Quantity</th>
											<th>Price</th>
											<th>Payment</th>
										</tr>
									</thead>
									<tbody>
										<!-- Medicine details will be populated here by showOPDModal function -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal end -->
			</body>

			</html>