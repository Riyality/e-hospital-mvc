<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>SPTI</title>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha384-ZvpUoO/+PzF+Z7ZZ4b4MJ3mfZTLtG8C1eY7n6ihjIv/vuVGO3jm5syDkc6+uWb8/"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .shadow-custom {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            margin-top: 6px;
            max-height: 200px; /* Set the max height for the scrollable area */
            overflow-y: auto; /* Enable vertical scrolling */
            font-size: small;
            height: 10vh;
            
        }

        .alert-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
        }
         th{
         font-size: .5em !importent;
         }
        .alert-success-custom {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
            box-shadow: 0 4px 8px rgba(0, 255, 0, 0.3);
            display: flex;
            align-items: center;
        }

        .loader {
            display: inline-block;
            width: 24px;
            height: 24px;
            border: 4px solid lightgreen;
            border-radius: 50%;
            border-top: 4px solid transparent;
            animation: spin 1s linear infinite;
            margin-right: 10px;
        }

.table{
height: 10vh}
        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div class="height-90">
        <div class="main-content">
            <h6>Current treatments</h6>
            <div class="alert-container" id="alertContainer"></div>
            <div class="container ">
                <div class="table-container">
                    <table class="table table-striped table-hover shadow-custom" border="1">
                        <thead >
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
                          <td>${list.price}</td>
                          <td>${list.treatment_date}</td>
                          <td>${list.payment}</td>
                          </tr>
                          </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="card shadow-custom">
                    <div class="card-header">
                        <h4>Treatment Form</h4>
                    </div>
                    <div class="card-body">
                        <form id="treatmentForm">
                            <div class="form-row">
                                <input type="hidden" name="admission" id="admissionIdInput" />
                                <div class="form-group col-md-2">
                                    <label for="pmedicine_type">Medicine Type</label>
                                    <select class="form-control" name="medicine_type" required>
                                        <option value="">Select type</option>
                                        <c:forEach items="${medicineTypes}" var="medicine">
                                            <option value="${medicine.type}">${medicine.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="pmedicine">Medicine</label>
                                    <input type="text" class="form-control" name="medicine" required>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="pquantity">Quantity</label>
                                    <input type="number" class="form-control" name="quantity" required>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="pprice">Price</label>
                                    <input type="number" class="form-control" name="price" required>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="ppayment">Payment</label>
                                    <select class="form-control" name="payment" required>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-primary">+ Add Treatment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="table-container">
                    <table class="table table-striped table-hover shadow-custom">
                        <thead>
                            <tr >
                                <th>Treatment ID</th>
                                <th>Medicine Type</th>
                                <th>Medicine</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Payment</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="treatmentTableBody">
                            <!-- Table rows will be added here dynamically -->
                        </tbody>
                    </table>
                   
                </div>
            </div>
             <button class="btn btn-success" id="saveAllButton">Save All</button>
                    <a href="" id="treatmentListLink">list</a>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Extract the last digit from the URL path
            var path = window.location.pathname;
            var parts = path.split('/');
            var lastSegment = parts[parts.length - 1]; // Get the last segment
            var admissionId = parseInt(lastSegment); // Convert to integer

            // Set this value in the input box
            document.getElementById('admissionIdInput').value = admissionId;
            
            var treatmentListLink = document.getElementById('treatmentListLink');
            treatmentListLink.href = '/treatment/list/' + admissionId;
        });

        let treatmentId = 1;
        var AdmissionID;

        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('treatmentForm').addEventListener('submit', function (e) {
                e.preventDefault();

                AdmissionID = document.querySelector('[name="admission"]').value;
                const medicineType = document.querySelector('[name="medicine_type"]').value;
                const medicine = document.querySelector('[name="medicine"]').value;
                const quantity = document.querySelector('[name="quantity"]').value;
                const price = document.querySelector('[name="price"]').value;
                const payment = document.querySelector('[name="payment"]').value;

                const tableBody = document.getElementById('treatmentTableBody');
                const newRow = document.createElement('tr');

                // Create table cells and append them to the new row
                const treatmentIdCell = document.createElement('td');
                treatmentIdCell.textContent = treatmentId++;
                newRow.appendChild(treatmentIdCell);

                const medicineTypeCell = document.createElement('td');
                medicineTypeCell.textContent = medicineType;
                newRow.appendChild(medicineTypeCell);

                const medicineCell = document.createElement('td');
                medicineCell.textContent = medicine;
                newRow.appendChild(medicineCell);

                const quantityCell = document.createElement('td');
                quantityCell.textContent = quantity;
                newRow.appendChild(quantityCell);

                const priceCell = document.createElement('td');
                priceCell.textContent = price;
                newRow.appendChild(priceCell);

                const paymentCell = document.createElement('td');
                paymentCell.textContent = payment;
                newRow.appendChild(paymentCell);

                const actionCell = document.createElement('td');

                const deleteButton = document.createElement('button');
                deleteButton.className = 'btn btn-danger btn-sm';
                deleteButton.textContent = 'Delete';
                deleteButton.onclick = function () {
                    deleteRow(this);
                };

                actionCell.appendChild(deleteButton);
                newRow.appendChild(actionCell);

                tableBody.appendChild(newRow);

                // Clear the form
                document.getElementById('treatmentForm').reset();
            });

            document.getElementById('saveAllButton').addEventListener('click', function () {
                saveAllTreatments();
            });
        });

        function saveAllTreatments() {
            const tableBody = document.getElementById('treatmentTableBody');
            const rows = tableBody.getElementsByTagName('tr');
            const treatments = [];

            for (let i = 0; i < rows.length; i++) {
                const row = rows[i];
                const medicineType = row.cells[1].textContent;
                const medicine = row.cells[2].textContent;
                const quantity = row.cells[3].textContent;
                const price = row.cells[4].textContent;
                const payment = row.cells[5].textContent;

                treatments.push({
                    medicine_type: medicineType,
                    medicine: medicine,
                    quantity: parseInt(quantity),  // Ensure quantity is a number
                    price: parseInt(price),        // Ensure price is a number
                    payment: payment,
                    
                    admission: parseInt(AdmissionID)  // Ensure admission ID is a number
                });
            }

            console.log(treatments);  // Debugging: Check the treatments array in the browser console

            $.ajax({
                type: 'POST',
                url: '/treatment',
                contentType: 'application/json',
                data: JSON.stringify(treatments),
                success: function (response) {
                 
                    $('#treatmentTableBody').empty();  // Clear the table or update UI based on the response
                    showSuccessMessage();  // Implement this function to display a success message
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }

        function deleteRow(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        function showSuccessMessage() {
            const alertContainer = document.getElementById('alertContainer');
            const alert = document.createElement('div');
            alert.className = 'alert alert-success alert-success-custom';
            
            const loader = document.createElement('div');
            loader.className = 'loader';
            
            const message = document.createElement('span');
            message.textContent = 'Treatments saved successfully!';
            
            alert.appendChild(loader);
            alert.appendChild(message);
            alertContainer.appendChild(alert);

            setTimeout(function () {
                alertContainer.removeChild(alert);
            }, 3000);
        }
    </script>
</body>

</html>
