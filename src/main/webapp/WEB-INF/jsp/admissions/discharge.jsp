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
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<style>
.table td {
	font-size: 12px;
}

p {
	margin: 10px 0px !important;
}

.custom-table th {
	font-size: 12px;
	/* Change the font size to your desired value */
}
</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="height-90">
		<div class="main-content  ">
			<div class="modal-body">
				<h5 class="modal-title" id="exampleModalLabel">Discharge :
					${data.patient.firstName } ${data.patient.lastName}</h5>

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
									<label class="spti-label details-label">Discharge Date:</label>
									<p class="spti-p">${data.dischargeDate }</p>
								</div>

								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Total days:</label>
									<p class="spti-p">${data.admittedDays }&nbsp;days</p>
								</div>

								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Ward:</label>
									<p class="spti-p">${data.ward.wardName }</p>
								</div>

								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Ward charges:</label>
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
									<p class="spti-p" style="font-weight: 600" id="originalBill">${data.bill }</p>
									<label class="spti-label details-label"> Treatment Bill
										:</label> <input id="treatmentBill" type="number"
										style="width: 100px; height: 20px; font-weight: 400"
										oninput="calculateTotalBill()">
								</div>
								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Discount (%):</label> <select
										id="discountPercentage1" style="width: 55%; height: 30px"
										onchange="calculateTotalBill()">
										<option value="0">0%</option>
										<option value="5">5%</option>
										<option value="10">10%</option>
										<option value="15">15%</option>
										<option value="20">20%</option>
										<!-- Add more options as needed -->
									</select>
								</div>
								<div
									class="col-md-12 my-2 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Total Bill:</label> <input
										type="text" class="my-2" id="totalBill" readonly />
								</div>
								
								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Final Bill:</label> <input
										type="text" class="my-2" id="finalBill" readonly />
								</div>

								<div
									class="col-md-12 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Paid Amount:</label> <input
										type="text" class="my-2" id="paid-amount"
										oninput="calculatePendingAmount()" />
								</div>
								<div
									class="col-md-12 my-2 border-bottom d-flex justify-content-between align-items-center">
									<label class="spti-label details-label">Pending Amount:</label>
									<input type="text" class="my-2" id="pending-amount" readonly />
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
									<button class="btn btn-primary Spti-btn" id="generate-bill-btn"
										style="margin: 15px auto;"
										onclick="generateBill(${data.bill}, ${data.admissionId})">Generate
										Bill and Pay</button>
									<p style="color: green; font-weight: 600; display: none;"
										id="bill-msg">Bill paid successfully</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-7 my-2">
						<table
							class="table table-striped table-hover shadow-custom custom-table"
							border="1">
							<thead>
								<tr>
									<th>Treatment ID</th>
									<th>Medicine Type</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Treatment Date</th>
									<th>Payment</th>
								</tr>
							</thead>
							<tbody id="medicineTableBody">
								<!-- Table rows will be added here dynamically -->
								<c:forEach items="${listall}" var="list">
									<tr>
										<td>${list.treatment_id}</td>
										<td>${list.medicine_type}</td>
										<td>${list.medicine}</td>
										<td>${list.quantity}</td>
										<td class="price">${list.price}</td>
										<td>${list.treatment_date}</td>
										<td>${list.payment}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="3"></td>
									<td><label class="spti-label details-label">Total
											pay:</label></td>
									<td><p id="totalPay" class="spti-p m-0 p-0"
											style="font-weight: 600"></p></td>
								</tr>

							</tbody>
						</table>
					</div>
					<form>
						<div class="col-md-12">
							<input type="hidden" name="admissionId"
								value="${data.admissionId}">
							<button class="btn btn-primary Spti-btn" id="discharge-btn"
								type="button" style="float: right;"
								onclick="discharge(${data.admissionId})" disabled>Discharge</button>
							<button class="btn btn-danger"
								style="float: right; margin-right: 10px">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
        $(window).on('load', function() {
            $('#addUserModel').modal('show');
        });

        function discharge(admissionId) {
            $.ajax({
                url:"/admissions/discharge/patient/"+ admissionId,
                type: "POST",
                data: {id: admissionId },
                success: function(response) {
                  //  alert('Patient discharged successfully.');
                    window.location.href = "/patients";
                   
                },
                error: function(error) {
                   // alert('Error discharging patient.');
                    console.log(error);
                }
            });
        }

        function generateBill(originalBillAmount, admissionId) {
            let discount = document.getElementById('discountPercentage1').value;
            let finalBill = parseFloat(document.getElementById('finalBill').value) || 0; // Ensure finalBill is parsed as float
            let paidAmount = parseFloat(document.getElementById('paid-amount').value) || 0;
            let pendingAmount = parseFloat(document.getElementById('pending-amount').value) || 0;
            let billStatus = document.getElementById('bill-status').value;

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
                    document.getElementById('generate-bill-btn').style.display = "none";
                    let billMsg = document.getElementById('bill-msg');
                    billMsg.style.display = "block";


                    document.getElementById('discharge-btn').disabled = false;
                }
            });
        }


        document.addEventListener('DOMContentLoaded', function() {
            calculateTotalPay();
            document.getElementById('discountPercentage1').addEventListener('change', function() {
                calculateTotalBill();
            });
            document.getElementById('paid-amount').addEventListener('input', calculatePendingAmount);
            document.getElementById('treatmentBill').addEventListener('input', calculateTotalBill);
        });

        function calculateTotalPay() {
            let total = 0;
            document.querySelectorAll('.price').forEach(function(priceElement) {
                total += parseFloat(priceElement.innerText) || 0;
            });
            document.getElementById('totalPay').innerText = total.toFixed(2);
            document.getElementById('treatmentBill').value = total.toFixed(2); // Update treatmentBill field
        }

        function calculateTotalBill() {
            // Get original bill amount
            let originalBill = parseFloat(document.getElementById('originalBill').innerText) || 0;

            // Get treatment bill amount
            let treatmentBill = parseFloat(document.getElementById('treatmentBill').value) || 0;

            // Calculate total bill before discount
            let totalBillBeforeDiscount = originalBill + treatmentBill;

            // Get selected discount percentage
            let discountPercentage = parseFloat(document.getElementById('discountPercentage1').value) || 0;

            // Calculate discount amount
            let discountAmount = (totalBillBeforeDiscount * discountPercentage) / 100;

            // Calculate final bill after discount
            let finalBill = totalBillBeforeDiscount - discountAmount;

            // Update total bill and final bill fields
            document.getElementById('totalBill').value = totalBillBeforeDiscount.toFixed(2);
            document.getElementById('finalBill').value = finalBill.toFixed(2);

            // Calculate pending amount whenever the total bill changes
            calculatePendingAmount();
        }

        function calculatePendingAmount() {
            const finalBill = parseFloat(document.getElementById('finalBill').value) || 0;
            const paidAmount = parseFloat(document.getElementById('paid-amount').value) || 0;

            const pendingAmount = finalBill - paidAmount;

            document.getElementById('pending-amount').value = pendingAmount.toFixed(2);
        }
    </script>

</body>

</html>
