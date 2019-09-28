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
    <title>Career Master</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

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
	      <a class="navbar-brand" href="index.jsp"><img src="HomeAssets/images/Career Master Vert.png" height="56px"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
	          
	          
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
    
    <div class="hero-wrap img" style="background-image: url(HomeAssets/images/bg_1.jpg);">
      <div class="overlay"></div>
      <div class="container">
      	<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
	        <div class="col-md-10 d-flex align-items-center ftco-animate">
	        	<div class="text text-center pt-5 mt-md-5">
	        	<img src="HomeAssets/images/Career Master Vert.png" style="heigth:auto; width:55%;">
	        		<p class="mb-4">Your Path To A Successful Career Begins Here</p>
	            <h1 class="mb-5">The Best Way to Keep Your Skills <br><b>Up to Date</b></h1>
							<div class="ftco-counter ftco-no-pt ftco-no-pb">
			        	<div class="row">
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-worldwide"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number" data-number="46">0</strong>
					                <span>Countries</span>
				                </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18 text-center">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-visitor"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number" data-number="450">0</strong>
					                <span>Companies</span>
					              </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18 text-center">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-resume"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number" data-number="80000">0</strong>
					                <span>Active Employees</span>
					              </div>
				              </div>
				            </div>
				          </div>
				        </div>
			        </div>
							<!-- <div class="ftco-search my-md-5">
								<div class="row">
			            <div class="col-md-12 nav-link-wrap">
				            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				              <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Find a Job</a>

				              <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Find a Candidate</a>

				            </div>
				          </div>
				          <div class="col-md-12 tab-wrap">
				            
				            <div class="tab-content p-4" id="v-pills-tabContent">

				              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
				              	<form action="#" class="search-job">
				              		<div class="row no-gutters">
				              			<div class="col-md mr-md-2">
				              				<div class="form-group">
					              				<div class="form-field">
					              					<div class="icon"><span class="icon-briefcase"></span></div>
									                <input type="text" class="form-control" placeholder="eg. Garphic. Web Developer">
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md mr-md-2">
				              				<div class="form-group">
				              					<div class="form-field">
					              					<div class="select-wrap">
							                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
							                      <select name="" id="" class="form-control">
							                      	<option value="">Category</option>
							                      	<option value="">Full Time</option>
							                        <option value="">Part Time</option>
							                        <option value="">Freelance</option>
							                        <option value="">Internship</option>
							                        <option value="">Temporary</option>
							                      </select>
							                    </div>
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md mr-md-2">
				              				<div class="form-group">
				              					<div class="form-field">
					              					<div class="icon"><span class="icon-map-marker"></span></div>
									                <input type="text" class="form-control" placeholder="Location">
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field">
								                	<button type="submit" class="form-control btn btn-primary">Search</button>
									              </div>
								              </div>
				              			</div>
				              		</div>
				              	</form>
				              </div>

				              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
				              	<form action="#" class="search-job">
				              		<div class="row">
				              			<div class="col-md">
				              				<div class="form-group">
					              				<div class="form-field">
					              					<div class="icon"><span class="icon-user"></span></div>
									                <input type="text" class="form-control" placeholder="eg. Adam Scott">
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field">
					              					<div class="select-wrap">
							                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
							                      <select name="" id="" class="form-control">
							                      	<option value="">Category</option>
							                      	<option value="">Full Time</option>
							                        <option value="">Part Time</option>
							                        <option value="">Freelance</option>
							                        <option value="">Internship</option>
							                        <option value="">Temporary</option>
							                      </select>
							                    </div>
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field">
					              					<div class="icon"><span class="icon-map-marker"></span></div>
									                <input type="text" class="form-control" placeholder="Location">
									              </div>
								              </div>
				              			</div>
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field">
									                <button type="submit" class="form-control btn btn-primary">Search</button>
									              </div>
								              </div>
				              			</div>
				              		</div>
				              	</form>
				              </div>
				            </div>
				          </div>
				        </div>
			        </div> -->
	          </div>
	        </div>
	    	</div>
      </div>
    </div>

    <section class="ftco-section ftco-no-pt ftco-no-pb" >
    	<div class="container" >
    		<div class="row" >
    			<div class="col-md-12" >
    				<div class="category-wrap">
    					<div class="row no-gutters" >
    						<div class="col-md-2">
    							<div class="top-category text-center no-border-left">
    								<h3><a href="#">Skills in <br>Demand</a></h3>
    								<span class="icon flaticon-contact"></span>
    								<p><span class="number">2002</span> <span>Vacancies</span></p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center active">
    								<h3><a href="#">Professional Skills Development </a></h3>
    								<span class="icon flaticon-mortarboard"></span>
    								<p><span class="number"></span> <span></span></p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center">
    								<h3><a href="#">Meet Industry Experts</a></h3>
    								<span class="icon flaticon-idea"></span>
    								<p><span class="number">1043</span> <span>Experts</span></p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center">
    								<h3><a href="#">Technology Trends Analysis</a></h3>
    								<span class="icon flaticon-contact"></span>
    								<p><span class="number"></span><br> <span> </span></p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center">
    								<h3><a href="#">Recruiement <br> Analysis</a></h3>
    								<span class="icon flaticon-contact"></span>
    								<p><span class="number"></span><br> <span> </span></p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center">
    								<h3><a href="#">Apply For <br>Jobs</a></h3>
    								<span class="icon flaticon-resume"></span>
    								<p><span class="number"></span><br> <span> </span></p>
    							</div>
    						</div>
    					
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section><br><br>
    
    <section class="ftco-section services-section">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-resume"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Hunt Skills</h3>
                <p>We guide you with you the best skills for field You are Interested In. You can easily monitor the trends of the technologies that you are interested through Career Master.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-team"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Career Aid</h3>
                <p>Career Master is the best platform to improve your professional skills. We support you with our professionals to smooth your career Experience with daily Career Aid updates.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-career"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Dream Career</h3>
                <p>Don't know how to choos the best career for you? Don't worry we got your back. Our Professionals will help you to find out the best career which suitable for you. </p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-employees"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Meet Expert </h3>
                <p>Career Master is a platform which connects you with the best Experts in different skills and technologies, who are capable to guide and help you to solve your problems.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
    
       

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Trending Skills</span>
            <h2 class="mb-0">Top Skills</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">HTML <br><span class="number">354</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Java <br><span class="number">143</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Java Scripts<br><span class="number">1100</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">MySQL<br><span class="number">100</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Android<br><span class="number">200</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">MongoDB<br><span class="number">300</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">PHP<br><span class="number">400</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">CSS<br><span class="number">100</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">C<br><span class="number">222</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">Spring Boot<br><span class="number">150</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Angular<br><span class="number">90</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">C++<br><span class="number">123</span> <span>Follows</span><i class="ion-ios-arrow-forward"></i></a></li>
        		
        		</ul>
        	</div>
        </div>
    	</div>
    </section>
    
     <section >

			<img src="HomeAssets/images/getStarted1.png" style="width:100%; heigth: auto;">
    </section>

    
    
    <section class="ftco-section" style="margin-top:-15%;">
    	<div class="container">
    		<div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Job Categories</span>
            <h2 class="mb-0">Top Jobs</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">Web Development <br><span class="number">354</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Graphic Designer <br><span class="number">143</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Multimedia <br><span class="number">100</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Advertising <br><span class="number">90</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">Education &amp; Training <br><span class="number">100</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">English <br><span class="number">200</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Social Media <br><span class="number">300</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Writing <br><span class="number">150</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">PHP Programming <br><span class="number">400</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Project Management <br><span class="number">100</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Finance Management <br><span class="number">222</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Office &amp; Admin <br><span class="number">123</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        		</ul>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<ul class="category text-center">
        			<li><a href="#">Web Designer <br><span class="number">324</span> <span>Open position</span></span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Customer Service <br><span class="number">564</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Marketing &amp; Sales <br><span class="number">234</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        			<li><a href="#">Software Development <br><span class="number">425</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
        		</ul>
        	</div>
        </div>
    	</div>
    </section>

		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 pr-lg-5">
						<div class="row justify-content-center pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		          	<span class="subheading">Recently Added Jobs</span>
		            <h2 class="mb-4">Featured Jobs Posts For This Week</h2>
		          </div>
		        </div>
						<div class="row">
					<%	
						Connection cons;
			cons= DBConnection.getConnection();
			String sqls="select * from job ";
			Statement states= cons.createStatement();
			ResultSet results= states.executeQuery(sqls); 
			int count =0;
			
			
			%> 
			
			
				
							
							
					<% while (results.next() && count<7){ %>
					<div class="col-md-12 ftco-animate">
		            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
		              <div class="one-third mb-4 mb-md-0">
		                <div class="job-post-item-header align-items-center">
		                	<span class="subadge"><%=results.getString("type") %></span>
		                  <h2 class="mr-3 text-black"><a><%=results.getString("title") %></a></h2>
		                  
		                  
		                </div>
		                <div class="job-post-item-body d-block d-md-flex">
		                  <div class="mr-3"><span class="icon-layers"></span> <a><%=results.getString("company") %></a></div>
		                  
		                </div>
		              </div>

		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
		              	<div>
			                
		                </div>
		                <form action="showJobServlet" method="post">                
		                <input type="hidden" name="jobcode" value="<%=results.getString("code") %>">
		                <input type="submit" class="btn btn-primary py-2" value="Apply Job">
		                </form>		
		              </div>
		            </div>
		          </div><!-- end -->
			
					 <%count++;}%>
		        </div>
		      </div>
		      <div class="col-lg-3 sidebar">
		        <div class="row justify-content-center pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">Top Recruitments</h2>
		          </div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="">
			        	<a href="#" class="company-wrap"><img src="HomeAssets/images/WSO2.png" class="img-fluid" alt="Colorlib Free Template"></a>
			        	<div class="text p-3">
			        		<h3><a href="#">WSO2</a></h3>
			        		<p><span class="number">500</span> <span>Open position</span></p>
			        	</div>
		        	</div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="">
			        	<a href="#" class="company-wrap"><img src="HomeAssets/images/99x.png" class="img-fluid" alt="Colorlib Free Template"></a>
			        	<div class="text p-3">
			        		<h3><a href="#">99x Technologies</a></h3>
			        		<p><span class="number">700</span> <span>Open position</span></p>
			        	</div>
			        </div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="">
			        	<a href="#" class="company-wrap"><img src="HomeAssets/images/codegen.jpg" class="img-fluid" alt="Colorlib Free Template"></a>
			        	<div class="text p-3">
			        		<h3><a href="#">CodeGen</a></h3>
			        		<p><span class="number">700</span> <span>Open position</span></p>
			        	</div>
			        </div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="">
			        	<a href="#" class="company-wrap"><img src="HomeAssets/images/dialog.png" class="img-fluid" alt="Colorlib Free Template"></a>
			        	<div class="text p-3">
			        		<h3><a href="#">Dialog Axiata</a></h3>
			        		<p><span class="number">700</span> <span>Open position</span></p>
			        	</div>
			        </div>
		        </div>
		      </div>
				</div>
			</div>
		</section>
		
		



    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-4">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Testimonial</span>
            <h2 class="mb-4">Happy Employees</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <p class="mb-4">Career Master is my life Savior. It Changed my life 360 degrees. Thans Career Master</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(HomeAssets/images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Nuwan Perera</p>
		                    <span class="position">Full Stack Developer</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <p class="mb-4">This is the coolest platform to Analyze new Technology Trends.Awsome</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(HomeAssets/images/person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Idunil Perera</p>
		                    <span class="position">Business Analyst</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <p class="mb-4">Love this platform. It Helped me a lot to solve Avenger level problems easily with experts</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(HomeAssets/images/person_3.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Rishi Mahelath</p>
		                    <span class="position">Software Engineer</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <p class="mb-4">Career Master helps a lot to choose the best platform for my new projects</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(HomeAssets/images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Developer</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <p class="mb-4">Simple UI. Lots of Usages. I recommend this platform for any career seeker</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(HomeAssets/images/person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Jerald Silva</p>
		                    <span class="position">Front End Developer</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
     <section >

			<img src="HomeAssets/images/getStarted2.png" style="width:100%; heigth: auto;">
    </section>

    <section class="ftco-section ftco-candidates bg-primary">
    	<div class="container">
    		<div class="row justify-content-center pb-3">
          <div class="col-md-10 heading-section heading-section-white text-center ftco-animate">
          	<span class="subheading">Experts</span>
            <h2 class="mb-4">Top Experts</h2>
          </div>
        </div>
    	</div>
    	<div class="container">
        <div class="row">
        	<div class="col-md-12 ftco-animate">
        		<div class="carousel-candidates owl-carousel">
        			<div class="item">
		        		<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_1.jpg);"></div>
		        			<h2>Dr Anil Perera</h2>
		        			<span class="position">AI Expert</span>
		        		</a>
        			</div>
        			<div class="item">
	        			<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_2.jpg);"></div>
		        			<h2>Prof Pujith Silva</h2>
		        			<span class="position">Financial Expert</span>
		        		</a>
	        		</div>
	        		<div class="item">
	        			<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_3.jpg);"></div>
		        			<h2>Dr Nimal Thilakasiri</h2>
		        			<span class="position">BlockChain Expert</span>
		        		</a>
	        		</div>
	        		<div class="item">
	        			<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_4.jpg);"></div>
		        			<h2>Dr A P Perera</h2>
		        			<span class="position">Marketing Expert</span>
		        		</a>
	        		</div>
	        		<div class="item">
	        			<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_5.jpg);"></div>
		        			<h2>Prof Nimali Siriwardana</h2>
		        			<span class="position">Business Expert</span>
		        		</a>
	        		</div>
	        		<div class="item">
	        			<a href="#" class="team text-center">
		        			<div class="img" style="background-image: url(HomeAssets/images/person_6.jpg);"></div>
		        			<h2>Dr Surendra Priyamal</h2>
		        			<span class="position">Full Stack Expert</span>
		        		</a>
	        		</div>
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Our Blog</span>
            <h2><span>Recent</span> Blog</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20" style="background-image: url('HomeAssets/images/image_1.jpg');">
              </a>
              <div class="text mt-3">
              	<div class="meta mb-2">
                  <div><a href="#">August 28, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">How to Be a good Team Player</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20" style="background-image: url('HomeAssets/images/image_2.jpg');">
              </a>
              <div class="text mt-3">
              	<div class="meta mb-2">
                  <div><a href="#">August 28, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Key Factors effects for a Full stack Developer</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20" style="background-image: url('HomeAssets/images/image_3.jpg');">
              </a>
              <div class="text mt-3">
              	<div class="meta mb-2">
                  <div><a href="#">August 28, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Will Hardware Plays a different Role in IT in near Future</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20" style="background-image: url('HomeAssets/images/image_4.jpg');">
              </a>
              <div class="text mt-3">
              	<div class="meta mb-2">
                  <div><a href="#">August 28, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Trending Coding Standards for every developer</a></h3>
              </div>
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
              <p>Our NewsLetter provides Career Master daily updates, discounts and all valuble things to make you a better Employee </p>
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