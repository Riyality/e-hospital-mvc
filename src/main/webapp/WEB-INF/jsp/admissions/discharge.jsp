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
.table td {
	font-size: 12px;
}

p {
	margin: 10px 0px !important;
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
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Discharge :
								Sachin Anuse</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" onclick="window.history.back()">x</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-5 my-2">
									<div class="card">
										<div class="card-body">
											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Admit Day:</label>
												<p class="spti-p">${data.admissionDate }</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Discharge
													Date:</label>
												<p class="spti-p">${data.dischargeDate }</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Total days:</label>
												<p class="spti-p">${data.admittedDays }days</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Ward:</label>
												<p class="spti-p">${data.ward.wardName }</p>
											</div>


											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Ward
													charges:</label>
												<p class="spti-p">${data.ward.charges }</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">cot No:</label>
												<p class="spti-p">${data.cot.cotNumber }</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Consulted
													doctor: </label>
												<p class="spti-p">${data.doctor.firstName}
													${data.doctor.lastName }</p>
											</div>

											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Bill :</label>
												<p class="spti-p" style="font-weight: 600">${data.bill }</p>
											</div>
											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Discount:</label> <input
													type="text" class="my-2" id="discount" />
											</div>
											<div
												class="col-md-12 my-2 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Final Bill:</label>
												<input type="text" class="my-2" id="final-bill" />
											</div>
											<div
												class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Paid Amount:</label>
												<input type="text" class="my-2" id="paid-amount" />
											</div>
											<div
												class="col-md-12 my-2 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Pending
													Amount:</label> <input type="text" class="my-2" id="pending-amount" />
											</div>
											<div
												class="col-md-12 my-2 border-bottom d-flex justify-content-between align-items-center">
												<label class="spti-label details-label">Status:</label> <select
													id="bill-status" name="billStatus" style="padding: 5px">
													<option value="Paid">Paid</option>
													<option value="Pending">Pending</option>
												</select>
											</div>
											<div
												class="col-md-12 my-2 d-flex justify-content-between align-items-center"
												id="bill-block">
												<button class="btn btn-primary Spti-btn"
													id="generate-bill-btn" style="margin: 15px auto;"
													onclick="generateBill(${data.bill },${data.admissionId })">Generate
													Bill and Pay</button>
												<p style="color: green; font-weight: 600; display: none;"
													id="bill-msg">Bill paid successfully</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-7 my-2">

									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="spti-table-head">Type</th>
												<th scope="col" class="spti-table-head">Medician</th>
												<th scope="col" class="spti-table-head">Amount</th>
												<th scope="col" class="spti-table-head">status</th>
												<th scope="col" class="spti-table-head">Final</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>DOLO 650mg</td>
												<td>65.00</td>
												<td class="text-success">Paid</td>
												<td class="">00.00</td>
											</tr>

											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>Paracetamol 500mg</td>
												<td>15.00</td>
												<td class="text-danger">unPaid</td>
												<td class="">15.00</td>
											</tr>
											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>Acetaminophen 150mg</td>
												<td>78.00</td>
												<td class="text-success">Paid</td>
												<td class="">00.00</td>
											</tr>

											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>ibuprofen 750mg</td>
												<td>125.00</td>
												<td class="text-danger">unPaid</td>
												<td class="">125.00</td>
											</tr>
											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>aspirin 650mg</td>
												<td>55.00</td>
												<td class="text-success">Paid</td>
												<td class="">00.00</td>
											</tr>

											<tr>
												<th scope="row" class="spti-table-head">Tab</th>
												<td>Naproxen 650mg</td>
												<td>65.00</td>
												<td class="text-danger">unPaid</td>
												<td class="">65.00</td>
											</tr>

											<tr>
												<td colspan="3"></td>
												<td><label class="spti-label details-label">Total
														pay:</label></td>
												<td><p class="spti-p m-0 p-0" style="font-weight: 600">1200</p>
											</tr>

											<tr>
												<td colspan="3"></td>
												<td><label class="spti-label details-label">Discount:</label></td>
												<td><input type="number"
													style="width: 100px; height: 20px"></td>
											</tr>

											<tr>
												<td colspan="3"></td>
												<td><label class="spti-label details-label">Final
														Pay:</label></td>
												<td><input type="number"
													style="width: 100px; height: 20px"></td>
											</tr>


										</tbody>
									</table>

								</div>
								<form>
									<div class="col-md-12">
									<input type="hidden" name="admissionId" value="${data.admissionId }">
										<button class="btn btn-primary Spti-btn" type="submit" style="float: right;">Discharge</button>
										<button class="btn btn-danger"
											style="float: right; margin-right: 10px">Cancel</button>
									</div>
								</form>
							</div>
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
		
		function discharge(admissionId) {
			
		}
		
		function generateBill(originalBillAmount,admissionId) {
			let discount = document.getElementById( 'discount' ).value;
            let finalBill = document.getElementById( 'final-bill' ).value;
            let paidAmount = document.getElementById( 'paid-amount' ).value;
            let pendingAmount = document.getElementById( 'pending-amount' ).value;
            let billStatus = document.getElementById( 'bill-status' ).value;
            $.ajax({
                url: "/admissions/bills/admissions",
                type: "POST",
                contentType: "application/json", 
                data: JSON.stringify({
                    admissionId: admissionId,
                    amount: originalBillAmount,
                    discount: discount,
                    finalBill: finalBill,
                    paidAmount: paidAmount,
                    pendingAmount: pendingAmount,
                    status: billStatus
                }),
                success: function(data, status) {
                    document.getElementById('generate-bill-btn').style.display="none";
                    let billMsg = document.getElementById('bill-msg');
                    billMsg.style.display="block";
                }
            
            });
		}
	</script>
</body>

</html>