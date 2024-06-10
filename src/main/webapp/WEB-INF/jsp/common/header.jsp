<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"
	rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/aacfaa8406.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/form.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/table.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<style type="text/css">
#toast-container>.toast-success {
	background-color: green !important;
}

#toast-container>.toast-error {
	background-color: red !important;
}

.spti-savegirlsimg {
	border-radius: 5px;
	box-shadow: 0px 1px 2px black, 0px 0px 2px #00000061;
	margin-left: 22px;
	margin-top: 180px;
	position: absolute;
	bottom: 16px;
}
</style>
</head>

<body id="body-pd">
	<c:if test="${not empty successMessage || not empty errorMessage}">

		<script type="text/javascript">
		toastr.options = {
			    "positionClass": "toast-top-right",
			    "preventDuplicates": true, // Optional: Prevent duplicate notifications
			    "showDuration": "300", // Optional: Animation duration
			    "hideDuration": "1000", // Optional: Animation duration
			    "timeOut": "5000", // Optional: Time for which the notification is shown (in milliseconds)
			    "extendedTimeOut": "1000", // Optional: Time for which the notification is shown after being hovered over (in milliseconds)
			    "showEasing": "swing", // Optional: Animation easing
			    "hideEasing": "linear", // Optional: Animation easing
			    "showMethod": "fadeIn", // Optional: Show animation method
			    "hideMethod": "fadeOut", // Optional: Hide animation method
			    "progressBar": true, // Optional: Show progress bar
			    "onclick": null, // Optional: Function to execute when the notification is clicked
			    "onHidden": null, // Optional: Function to execute when the notification is hidden
			    "onShown": null // Optional: Function to execute when the notification is shown
			};

			// Set the success background color
			toastr.options.successBgColor = "#28a745";
			var successMessage = "${successMessage}";
	        if (successMessage) {
	            toastr.success(successMessage);
	        }
	
	        var errorMessage = "${errorMessage}";
	        if (errorMessage) {
	            toastr.error(errorMessage);
	        }		
        </script>

	</c:if>
	<header class="header " id="header">

		<nav class="navbar navbar-expand-lg py-0  w-100">
			<ul class="navbar-nav justify-content-end upperNavbar  me-1">
				<div class="creat-upperNavbar">
					<li class="nav-item ">
						<div class="header_toggle">
							<i class='bx bx-menu' id="header-toggle"></i>
						</div>
						<div class="header_toggle-mobile ">
							<i class='bx bx-menu' id="header-toggle"></i>
						</div>
					</li>

				</div>

				<div class="profile-upperNavbar">
					<c:choose>
						<c:when test="${sessionScope.role.equals('HR') }">
							<li style="left: 15px; position: absolute; margin-top: -10px;"><a
								href="/appointments/todays" class="nav_link" style="color:#dadbdd;"> <span
									class="nav_name menu"
									style="margin-right: 10px; color: black;">Today's
										appointments</span>
							</a></li>
						</c:when>
						<c:when test="${sessionScope.role.equals('Receptionist') }">
							<li style="left: 15px; position: absolute; margin-top: -10px;"><a
								href="/appointments/todays" class="nav_link" style="color:#dadbdd;"> <span
									class="nav_name menu" 
									style="margin-right: 10px; color: black;">Today's
										appointments</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li style="left: 15px; position: absolute; margin-top: -10px;"><a
							class="nav_link" href="/appointments/todays/for-doctor" style="color:#dadbdd;"> <span
									class="nav_name menu" 
									style="margin-right: 10px; color: black;">Today's
										appointments</span>
							</a></li>

							<li
								style="left: 15px; position: absolute; margin-top: -10px; left: 220px"><a
								href="/admissions/current-admissions" class="nav_link" style="color:#dadbdd;"> <span
									class="nav_name menu"
									style="margin-right: 10px; color: black;">Current
										Admissions</span>
							</a></li>
						</c:otherwise>
					</c:choose>

					<%-- <li><img alt=""
						style="width: 215px; height: 46px; margin-right: 50px;"
						src="${pageContext.request.contextPath}/images/13.jpg"></li> --%>

					<li class="nav-item dropdown notification "><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-regular fa-bell bell"></i><span>20</span>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown" >

							<li class="px-3 py-2 notification-top border-bottom ">All
								Notification</li>
							<li class=" mt-2 border-bottom">
								<div class="d-flex justify-content-between align-items-center">
									<div class="noti-title">Sachin Anuse is added to Veracity
										India</div>
									<i class="fa-solid fa-xmark noti-remove"></i>
								</div>
								<p>3 hour ago</p>
							</li>

							<li class=" mt-2 border-bottom">
								<div class="d-flex justify-content-between align-items-center">
									<div class="noti-title">Sachin Anuse is added to Veracity
										India</div>
									<i class="fa-solid fa-trash noti-remove"></i>
								</div>
								<p>22 Feb 2023</p>
							</li>


							<li class="px-3 py-2 notification-top text-center">Clear all
								Notifications</li>
						</ul></li>

					<li class="nav-item dropdown info-User-Profile"><a
						class="nav-link dropdown-toggle p-0 m-0  d-flex justify-content-start align-items-center"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa-solid fa-user"></i>
							<div class="my-0 p-0  ">
								<h6 class="m-0 p-0">${sessionScope.name}</h6>
								<p class="m-0 p-0">${sessionScope.role}</p>
							</div>

					</a>
						<ul class="dropdown-menu " aria-labelledby="navbarDropdown">
							<li><a href="#" tabindex="0" role="menuitem"
								class="dropdown-item"> <i
									class="bx bx-user font-size-16 align-middle ms-1"></i> Profile
							</a></li>
							<li><a href="#" role="menuitem" class="dropdown-item"> <i
									class="bx bx-user font-size-16 align-middle ms-1"></i> Change
									Password
							</a></li>
							<li><a style="pointer-events: none" href="" tabindex="0"
								role="menuitem" class="dropdown-item"> <i
									class="bx bx-lock-open font-size-16 align-middle me-1"></i>
									Lock Screen
							</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="/logout"> <i
									class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i><span>Logout</span>
							</a></li>
						</ul></li>
				</div>
			</ul>
		</nav>



	</header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div class="side-navbar">
				<button type="button" class="btn-close" aria-label="Close"></button>

				<a href="/cots/addCotForm" class="nav_link"> <img alt=""
					src="${pageContext.request.contextPath}/images/riyalityImg.png"
					style="width: 36px; height: 36px; margin-left: 0px;"> <span
					class="nav_name" style="font-size: 18px">riyality</span>
				</a>

				<%--  Anjali Hospital --%>
				<div class="nav_list">
					<ul style="padding: 5px !important;">
						<c:choose>
							<c:when test="${sessionScope.role.equals('HR') }">
								<a href="/dashboards/hr" class="nav_link" style="color:#dadbdd;"> <i
									class='bx bxs-dashboard'></i> <span class="nav_name menu">Dashboard</span></a>

								<li class=" nav-item dropdown" id="li-task"><a
									class="nav_link " data-bs-toggle="collapse"
									href="#multiCollapseExample4" role="button"
									aria-expanded="false" aria-controls="multiCollapseExample4"
									id="link-task"> <i class="fa fa-user-md" aria-hidden="true"></i>
										<span class="nav_name dropdownIcon menu" id="task-name-module">Doctors
									</span>
								</a>
									<ul class="collapse multi-collapse sub-menu mt-0 pt-0"
										id="multiCollapseExample4">
										<a href="/hrs/addDoctorForm" class="nav_link subMenulink">
											<span class="nav_name menu">Add Doctor</span>
										</a>
										<a href="/hrs/doctors" class="nav_link subMenulink"><span
											class="nav_name menu">All Doctors</span></a>
									</ul></li>

								<li class=" nav-item dropdown" id="li-task"><a
									class="nav_link " data-bs-toggle="collapse"
									href="#multiCollapseExample5" role="button"
									aria-expanded="false" aria-controls="multiCollapseExample5"
									id="link-task"> <i
										class="fa-solid fa-house-chimney-medical"></i> <span
										class="nav_name dropdownIcon menu" id="task-name-module">Wards
									</span>
								</a>
									<ul class="collapse multi-collapse sub-menu"
										id="multiCollapseExample5">
										<a href="/wards/addWardForm" class="nav_link subMenulink">
											<span class="nav_name menu">Add Ward</span>
										</a>
										<a href="/wards" class="nav_link subMenulink"> <span
											class="nav_name menu">All Wards</span>
										</a>
									</ul></li>
									
									
									
								

								<li class=" nav-item dropdown" id="li-task"><a
									class="nav_link " data-bs-toggle="collapse"
									href="#multiCollapseExample6" role="button"
									aria-expanded="false" aria-controls="multiCollapseExample6"
									id="link-task"> <i class="fa-solid fa-user-nurse"></i> <span
										class="nav_name dropdownIcon menu" id="task-name-module">Staff
									</span>
								</a>
									<ul class="collapse multi-collapse sub-menu"
										id="multiCollapseExample6">
										<li><a href="/hrs/addStaffForm"
											class="nav_link subMenulink "><span class="nav_name menu">Add Staff</span></a></li>
										<li><a href="/hrs/staffs" class="nav_link subMenulink">
												<span class="nav_name menu">All Staff</span>
										</a></li>
									</ul></li>

								<li><a href="/cots/addCotForm" class="nav_link"><i
										class="fa fa-bed" aria-hidden="true"></i> <span
										class="nav_name menu">Add Cot</span> </a></li>

							</c:when>

							<c:when test="${sessionScope.role.equals('Receptionist') }">
								<li><a href="/dashboards/hr" class="nav_link"> <i
										class='bx bxs-dashboard'></i> <span class="nav_name menu">Dashboard</span>
								</a></li>
								<li><a href="/appointments/appointmentForm"
									class="nav_link"> <i class="fa-regular fa-calendar-check"></i>
										<span class="nav_name menu">Appointment</span>
								</a></li>

								<li><a href="/patients/add-form" class="nav_link"> <i
										class="fa-solid fa-hospital-user" style="color: #030303;"></i><span
										class="nav_name menu">Add Patient</span>
								</a></li>
								<li><a href="/showPatients" class="nav_link"><i
										class="fa-solid fa-hospital-user" style="color: #030303;"></i>
										<span class="nav_name menu">All Patients</span> </a></li>
							
							</c:when>

							<c:when test="${sessionScope.role.equals('Doctor') }">
								<li><a href="/dashboards/hr" class="nav_link"> <i
										class='bx bxs-dashboard'></i> <span class="nav_name menu">Dashboard</span>
								</a></li>
								<li><a href="/patients/add-form" class="nav_link"> <i
										class="fa-solid fa-hospital-user"></i><span class="nav_name menu">Add
											Patient</span>
								</a></li>
								<li><a href="/patients" class="nav_link"><i
										class="fa-solid fa-hospital-user"></i> <span class="nav_name menu">All
											Patients</span> </a></li>
								</a>
								</li>
									<li><a href="/showPatients" class="nav_link"><i
										class="fa-solid fa-hospital-user" style="color: #030303;"></i>
										<span class="nav_name menu">Records </span> </a></li>
							</c:when>
						</c:choose>
					</ul>

				</div>
			</div>
			<!-- <img class="spti-savegirlsimg" src="/images/1.webp"
				alt="Girl in a jacket" width="180" height="110"> -->
	</div>
	</nav>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<!-- <script src="script.js"></script> -->

	<script>
            document.addEventListener( "DOMContentLoaded", function ( event ) {

                const showNavbar = ( toggleId, navId, bodyId, headerId ) => {
                    const toggle = document.getElementById( toggleId ),
                        nav = document.getElementById( navId ),
                        bodypd = document.getElementById( bodyId ),
                        headerpd = document.getElementById( headerId )

                    // Validate that all variables exist
                    if ( toggle && nav && bodypd && headerpd ) {
                        toggle.addEventListener( 'click', () => {
                            // show navbar
                            nav.classList.toggle( 'showNavbar' )
                            // change icon
                            toggle.classList.toggle( 'bx-x' )
                            // add padding to body
                            bodypd.classList.toggle( 'body-pd' )
                            // add padding to header
                            headerpd.classList.toggle( 'body-pd' );



                        } )
                    }
                }

                showNavbar( 'header-toggle', 'nav-bar', 'body-pd', 'header' )

                /*===== LINK ACTIVE =====*/
                const linkColor = document.querySelectorAll( '.nav_link' )

                function colorLink () {
                    if ( linkColor ) {
                        linkColor.forEach( l => l.classList.remove( 'active' ) )
                        this.classList.add( 'active' )
                    }
                }
                linkColor.forEach( l => l.addEventListener( 'click', colorLink ) )

                // Your code to run since DOM is loaded and ready
            } );

            let mobileMenu = document.querySelector( ".header_toggle-mobile" );
            mobileMenu.addEventListener( "click", () => {
                let mobileNav = document.querySelector( "#nav-bar" );
                let mobileLink = document.querySelectorAll( ".nav_link" )
                mobileLink.forEach( ( item ) => item.classList.add( 'mobile-link' ) )
                mobileNav.style.display = "block";
            } )

            let menuClose = document.querySelector( ".btn-close" );
            menuClose.addEventListener( "click", () => {
                let mobileNav = document.querySelector( "#nav-bar" );
                mobileNav.style.display = "none";
            } )



            function getAvailableSprint ( urlStr ) {
                $.ajax( {
                    type: "GET",
                    url: urlStr,
                    async: false,
                    success: function ( data ) {
                        let div = document.getElementById( 'start-sprint-popupBox' );
                        div.style.display = "block";
                        let ul = document.getElementById( 'start-sprint-ul' );
                        if ( data ) {
                            if ( data.length != 0 ) {
                                for ( let i = 0; i < data.length; i++ ) {
                                    let li = document.createElement( 'li' );
                                    li.setAttribute( 'class', 'list-group-item py-1 px-2' );
                                    let a = document.createElement( 'a' );
                                    a.setAttribute( 'href', '${pageContext.request.contextPath}/sprints/start-sprint/' + data[ i ].id );
                                    a.innerHTML = data[ i ].name + "<p>" + data[ i ].duration + "</p> ";
                                    li.appendChild( a );
                                    ul.appendChild( li );
                                }
                            } else {
                                let li = document.createElement( 'li' );
                                li.setAttribute( 'class', 'list-group-item py-1 px-2' );
                                let a = document.createElement( 'a' );
                                a.setAttribute( 'href', '#' );
                                a.innerHTML = "No sprint to start. create sprint first";
                                li.appendChild( a );
                                ul.appendChild( li );
                            }
                        } else {
                            let li = document.createElement( 'li' );
                            li.setAttribute( 'class', 'list-group-item py-1 px-2' );
                            let a = document.createElement( 'a' );
                            a.setAttribute( 'href', '#' );
                            a.innerHTML = "Current sprint is active. Please complete it before starting new One";
                            li.appendChild( a );
                            ul.appendChild( li );
                        }
                    }
                } );
            }

        </script>
</body>

</html>