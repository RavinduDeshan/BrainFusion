<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.onvs.servlet.EditUserServlet"%>


<%@ page import="com.onvs.util.DBConnection"%>
<%@ page import ="java.sql.Connection"%>
    
<%@ page import ="java.sql.ResultSet"%>
    
<%@ page import ="java.sql.Statement"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Career Master Experts</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css/?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="HomeAssets/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="HomeAssets/css/animate.css">
    
    <link rel="stylesheet" href="HomeAssets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="HomeAssets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="HomeAssets/css/magnific-popup.css">

    <link rel="stylesheet" href="HomeAssets/css/aos.css">

    <link rel="stylesheet" href="HomeAssets/css/ionicons.min.css">

    <link rel="stylesheet" href="HomeAssets/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="HomeAssets/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="HomeAssets/css/flaticon.css">
    <link rel="stylesheet" href="HomeAssets/css/icomoon.css">
    <link rel="stylesheet" href="HomeAssets/css/style.css">
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid px-md-4	">
				<a class="navbar-brand" href="index.jsp"><img src="HomeAssets/images/Career Master.png" height="56px">Career Master</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
	          <%
	          String link,linkdash="index.jsp",visi="block",visil="block",visij="bloack",lo="none";
	          
	          if(session.getAttribute( "Admin" )==null){
	        	  
	        	  link="LoginWelcome.jsp";
	        	  visil="block";
	        	  lo="none";
	        	  
	        	  
	          }else{
	        	  
	        	  if(session.getAttribute( "type" )=="2"){
	        	  
	        		
	        	  linkdash="JobHostDashBoard.jsp";
	        	  link="addJob.jsp";
	        	  visi="block";
	        	  visil="none";
	        	  visij="none";
	        	  lo="block";
	        	  }
	        	  
	        	  else{
	        		  
	        		  linkdash="UserDashBoard.jsp";
	        		  link="LoginWelcome.jsp";
	        		  visi="none";
	        		  visil="none";
	        		  visij="block";
	        		  lo="block";
	        	  }
	          }
	          
	          
	          %>
	          <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
	          <li class="nav-item cta mr-md-1"><a href="<%=link %>" class="nav-link" style="display:<%=visi %>;">Post a Job</a></li>
			  <li class="nav-item cta cta-colored"><a href="browseJobs.jsp" class="nav-link" style="display:<%=visij %>;">Want a Job</a></li>
			  <li class="nav-item cta mr-md-2" style="margin-left: 4px;"><a href="LoginWelcome.jsp" class="nav-link" style="display:<%=visil %>;">Login</a></li>
			  <li class="nav-item cta mr-md-2" style="margin-left: 4px;"><a href="<%=linkdash %>" class="nav-link" style="display:<%=lo %>;">My Dashboard</a></li>
			  <li class="nav-item cta mr-md-2" ><a href="SignupWelcome.jsp" class="nav-link" style="display:<%=visil %>;">SignUp</a></li>
			  <li class="nav-item" style="margin-left: 4px;">
			  <form action="SignOutServlet" method="post"><input type="submit" value="LogOut" class="btn btn-danger" style="margin-top: 7px; display:<%=lo %>;"></form></li>

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url('HomeAssets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-12 ftco-animate text-center mb-5">
          	<p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Experts</span></p>
            <h1 class="mb-3 bread">Meet Experts</h1>
          </div>
        </div>
      </div>
    </div>

		<section class="ftco-section ftco-candidates ftco-candidates-2 bg-light">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-8 pr-lg-4">
    				<div class="row">
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_1.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">University of Colombo</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">AI Expert</span>
			        			<p class="mb-2">His Details</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_2.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">Western City, UK</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">Graduate</span>
			        			<p class="mb-2">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_3.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">Western City, UK</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">Graduate</span>
			        			<p class="mb-2">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_4.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">Western City, UK</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">Graduate</span>
			        			<p class="mb-2">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_5.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">Western City, UK</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">Graduate</span>
			        			<p class="mb-2">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    			<div class="col-md-12">
		    				<div class="team d-md-flex p-4 bg-white">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_6.jpg);"></div>
		        			<div class="text pl-md-4">
		        				<span class="location mb-0">Western City, UK</span>
		        				<h2>Danica Lewis</h2>
			        			<span class="position">Graduate</span>
			        			<p class="mb-2">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			        			<span class="seen">Last Activity 4 months ago</span>
			        			<p><a href="#" class="btn btn-primary">Appoint</a></p>
		        			</div>
		        		</div>
		    			</div>
		    		</div>
		    		<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		              </ul>
		            </div>
		          </div>
		        </div>
		    	</div>
		    	<div class="col-lg-4 sidebar">
		        <div class="sidebar-box bg-white p-4 ftco-animate">
		        	<h3 class="heading-sidebar">Browse Category</h3>
		        	<form action="#" class="search-form mb-3">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" placeholder="Search...">
                </div>
              </form>
		        	<form action="#" class="browse-form">
							  <label for="option-job-1"><input type="checkbox" id="option-job-1" name="vehicle" value="" checked> Website &amp; Software</label><br>
							  <label for="option-job-2"><input type="checkbox" id="option-job-2" name="vehicle" value=""> Education &amp; Training</label><br>
							  <label for="option-job-3"><input type="checkbox" id="option-job-3" name="vehicle" value=""> Graphics Design</label><br>
							  <label for="option-job-4"><input type="checkbox" id="option-job-4" name="vehicle" value=""> Accounting &amp; Finance</label><br>
							  <label for="option-job-5"><input type="checkbox" id="option-job-5" name="vehicle" value=""> Restaurant &amp; Food</label><br>
							  <label for="option-job-6"><input type="checkbox" id="option-job-6" name="vehicle" value=""> Health &amp; Hospital</label><br>
							</form>
		        </div>

		        <div class="sidebar-box bg-white p-4 ftco-animate">
		        	<h3 class="heading-sidebar">Select Location</h3>
		        	<form action="#" class="search-form mb-3">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" placeholder="Search...">
                </div>
              </form>
		        	<form action="#" class="browse-form">
							  <label for="option-location-1"><input type="checkbox" id="option-location-1" name="vehicle" value="" checked> Sydney, Australia</label><br>
							  <label for="option-location-2"><input type="checkbox" id="option-location-2" name="vehicle" value=""> New York, United States</label><br>
							  <label for="option-location-3"><input type="checkbox" id="option-location-3" name="vehicle" value=""> Tokyo, Japan</label><br>
							  <label for="option-location-4"><input type="checkbox" id="option-location-4" name="vehicle" value=""> Manila, Philippines</label><br>
							  <label for="option-location-5"><input type="checkbox" id="option-location-5" name="vehicle" value=""> Seoul, South Korea</label><br>
							  <label for="option-location-6"><input type="checkbox" id="option-location-6" name="vehicle" value=""> Western City, UK</label><br>
							</form>
		        </div>

		        <div class="sidebar-box bg-white p-4 ftco-animate">
		        	<h3 class="heading-sidebar">Job Type</h3>
		        	<form action="#" class="browse-form">
							  <label for="option-job-type-1"><input type="checkbox" id="option-job-type-1" name="vehicle" value="" checked> Partime</label><br>
							  <label for="option-job-type-2"><input type="checkbox" id="option-job-type-2" name="vehicle" value=""> Fulltime</label><br>
							  <label for="option-job-type-3"><input type="checkbox" id="option-job-type-3" name="vehicle" value=""> Intership</label><br>
							  <label for="option-job-type-4"><input type="checkbox" id="option-job-type-4" name="vehicle" value=""> Temporary</label><br>
							  <label for="option-job-type-5"><input type="checkbox" id="option-job-type-5" name="vehicle" value=""> Freelance</label><br>
							  <label for="option-job-type-6"><input type="checkbox" id="option-job-type-6" name="vehicle" value=""> Fixed</label><br>
							</form>
		        </div>
		      </div>
    		</div>
    	</div>
    </section>
		
		<section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-4 mb-4">
                <div class="col-md-12">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
        	<div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Career Master</h2>
              <p>Career Master is a Platform where </p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Job Host</h2>
              <ul class="list-unstyled">
               
                <li><a href="addJob.jsp" class="pb-1 d-block">Post a Job</a></li>
                
                <li><a href="JobHostDashBoard.jsp" class="pb-1 d-block">Dashboard</a></li>
                
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Career Seeker</h2>
              <ul class="list-unstyled">
                <li><a href="browseJobs.jsp" class="pb-1 d-block">Browse Jobs</a></li>
                
                <li><a href="UserDashBoard.jsp" class="pb-1 d-block">Dashboard</a></li>
                
                
                
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Account</h2>
              <ul class="list-unstyled">
                <li><a href="UserDashBoard.jsp" class="pb-1 d-block">My Account</a></li>
                <li><a href="LoginWelcome.jsp" class="pb-1 d-block">Log In</a></li>
                <li><a href="SignupWelcome.jsp" class="pb-1 d-block">Create Account</a></li>
                
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">No 23, High Level Road, Gamsaba Handiya,<br>Nugegoda, <br>Sri Lanka</span></li>
	                <li><span class="icon icon-phone"></span><span class="text">+94 071 4009 185</span></li>
	                <li><span class="icon icon-envelope"></span><span class="text">info@careermaster.com</span></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p>
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Career Master
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="HomeAssets/js/jquery.min.js"></script>
  <script src="HomeAssets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="HomeAssets/js/popper.min.js"></script>
  <script src="HomeAssets/js/bootstrap.min.js"></script>
  <script src="HomeAssets/js/jquery.easing.1.3.js"></script>
  <script src="HomeAssets/js/jquery.waypoints.min.js"></script>
  <script src="HomeAssets/js/jquery.stellar.min.js"></script>
  <script src="HomeAssets/js/owl.carousel.min.js"></script>
  <script src="HomeAssets/js/jquery.magnific-popup.min.js"></script>
  <script src="HomeAssets/js/aos.js"></script>
  <script src="HomeAssets/js/jquery.animateNumber.min.js"></script>
  <script src="HomeAssets/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="HomeAssets/js/google-map.js"></script>
  <script src="HomeAssets/js/main.js"></script>
    
  </body>
</html>