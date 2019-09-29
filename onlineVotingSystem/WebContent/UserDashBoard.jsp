<%@page import="com.onvs.model.Job"%>
<%@page import="com.onvs.service.impl.JobServiceImpl"%>
<%@page import="com.onvs.model.User"%>
<%@page import="com.onvs.service.impl.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.onvs.util.DBConnection"%>
<%@ page import ="java.sql.Connection"%>
    
<%@ page import ="java.sql.ResultSet"%>
    
<%@ page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <%
      if(session.getAttribute("type") !="1") {
          response.sendRedirect("index.jsp");
      }
      
      %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="HomeAssets/images/favicon.ico" type="image/ico" />

    <title>Career Master</title>
     <!-- Bootstrap -->
     <link href="HomeAssets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
     <!-- Font Awesome -->
     <link href="HomeAssets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
     <!-- NProgress -->
     <link href="HomeAssets/vendors/nprogress/nprogress.css" rel="stylesheet">
     <!-- iCheck -->
     <link href="HomeAssets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
   
     <!-- bootstrap-progressbar -->
     <link href="HomeAssets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
     <!-- JQVMap -->
     <link href="HomeAssets/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
     <!-- bootstrap-daterangepicker -->
     <link href="HomeAssets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
     <link rel="stylesheet" href="HomeAssets/css/animate.css">  
    <link href="HomeAssets/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="HomeAssets/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="HomeAssets/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="HomeAssets/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="HomeAssets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">


     
     
     <!-- Custom Theme Style -->
     <link href="HomeAssets/build/css/custom.min.css" rel="stylesheet">

 
     <script src="HomeAssets/vendors/chart.js/dist/Chart.bundle.js"></script>
     <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 
    <style>
        canvas{
          -moz-user-select: none;
          -webkit-user-select: none;
          -ms-user-select: none;
        }
        #chartjs-tooltip {
      opacity: 1;
      position: absolute;
      background: rgba(0, 0, 0, .7);
      color: white;
      border-radius: 3px;
      -webkit-transition: all .1s ease;
      transition: all .1s ease;
      pointer-events: none;
      -webkit-transform: translate(-50%, 0);
      transform: translate(-50%, 0);
    }

    .chartjs-tooltip-key {
      display: inline-block;
      width: 10px;
      height: 10px;
    }
        </style>
    
  </head>
  <nav class="navbar1 navbar1-expand-lg navbar1-dark ftco_navbar1 bg-dark ftco-navbar1-light" id="ftco-navbar1">
	    <div class="container-fluid px-md-4	">
          <link rel="stylesheet" href="HomeAssets/css/mnk.css">
          
              <div class="divTable blueTable">
                  <div class="divTableBody">
                  <div class="divTableRow">
                  <div class="divTableCell"><a class="navbar1-brand" href="index.html"><img src="HomeAssets/images/Career Master.png" height="56px">Career Master</a>
                    <button class="navbar1-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="oi oi-menu"></span> Menu
                    </button>
                  </div>
                    
                    <div class="divTableCel2">
                      <div class="collapse navbar1-collapse" id="ftco-nav">
                        <ul class="navbar1-nav ml-auto">
                            <li class="nav-item "><a href="index.jsp" class="nav-link">Home</a></li>
                            <li class="nav-item"><a href="browseJobs.jsp" class="nav-link">Browse Jobs</a></li>
                            <li class="nav-item"><a href="candidates.jsp" class="nav-link">Experts</a></li>
                            <li class="nav-item"><a href="blog.jsp" class="nav-link">Blog</a></li>
                            <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
                          
              
                        </ul>
                      </div>
                      </div>
                    </div>
                  </div>	  
           </div>
        
      </div>
    </nav>
    <br><br>
  <body class="nav-md">
      <div class="container body">
      
          <div class="main_container">
            <div class="col-md-3 left_col">
              <div class="left_col scroll-view">
                <!--div class="navbar nav_title" style="border: 0;">
                  <a href="dashboard.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
                </div-->
    
                <div class="clearfix"></div>
                <%  String nic=(String) session.getAttribute( "Admin" ); 
		Connection cons;
		cons= DBConnection.getConnection();

		UserServiceImpl canserv1=new UserServiceImpl();
		   
		 User can = canserv1.getUserDetails(nic);


		JobServiceImpl canserv2=new JobServiceImpl();
		   
		int wso2= canserv2.getJobCount("WSO2@WSO2.com");
		int dialog= canserv2.getJobCount("dialog@dialog.lk");
		int codegen= canserv2.getJobCount("CodeGen@CodeGen.com");
		int x99= canserv2.getJobCount("99x@99x.com");
		int lseg= canserv2.getJobCount("LSEG@lk.LSEG.com");
		
		
		int tot = wso2+dialog+codegen+x99+lseg;
		float w,d,c,x,l;
		
		w=(wso2/(float)tot)*100;
		d=(dialog/(float)tot)*100;
		c=(codegen/(float)tot)*100;
		x=(x99/(float)tot)*100;
		l=(lseg/(float)tot)*100;
		
		
	
		
		%>
    
                <!-- menu profile quick info -->
                <div class="profile clearfix">
                  <div class="profile_pic">
                    <img src="HomeAssets/images/img.jpg" alt="..." class="img-circle profile_img">
                  </div>
                  <div class="profile_info">
                      <span>Welcome,</span>
                      <h2><%=can.getiName()%></h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->
    
                <br />
    
                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                  <div class="menu_section">
                    <h3>General</h3>
                    <ul class="nav side-menu">
                      <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Home <!--span class="fa fa-chevron-down"></span--></a>
                        <!--ul class="nav child_menu">
                          <li><a href="dashboard.html">Dashboard</a></li>
                          <li><a href="index2.html">Dashboard2</a></li>
                          <li><a href="index3.html">Dashboard3</a></li>
                        </ul-->
                      </li>
                      <li><a href="whatsnew.jsp"><i class="fa fa-user"></i> What's New </a>
                      </li>
                      <li><a><i class="fa fa-trophy"></i>Skills & Achievements <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="general_elements.jsp">Skills</a></li>
                          <li><a href="media_gallery.jsp">Achievements</a></li>
                          <!--li><a href="typography.html">Typography</a></li>
                          <li><a href="icons.html">Icons</a></li>
                          <li><a href="glyphicons.html">Glyphicons</a></li>
                          <li><a href="widgets.html">Widgets</a></li>
                          <li><a href="invoice.html">Invoice</a></li-->
                        </ul>
                      </li>
                      <li><a><i class="fa fa-file-text"></i> My CV <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="mycv.jsp">View CV</a></li>
                          <li><a>Edit CV</a></li>
                          
                          <!--li><a href="form_wizards.html">Form Wizard</a></li>
                          <li><a href="form_upload.html">Form Upload</a></li>
                          <li><a href="form_advanced.html">Advanced Components</a></li>
                          <li><a href="form_buttons.html">Form Buttons</a></li-->
                        </ul>
                      </li>
                      <li><a><i class="fa fa-user"></i> My Profile <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <!--li><a href="tables.html">Tables</a></li>
                          <li><a href="tables_dynamic.html">Table Dynamic</a></li-->
                            <li><a href="profile.jsp">Profile</a></li>
                            <li><a href="form.jsp">Edit Profile</a></li>
                            <li><a href="projects.jsp">My Jobs</a></li>
                            <li><a href="inbox.jsp">Inbox</a></li>
                           <li><a href="calendar.jsp">Calendar</a></li>
                        </ul>
                      </li>
                      <!--li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="chartjs.html">Chart JS</a></li>
                          <li><a href="chartjs2.html">Chart JS2</a></li>
                          <li><a href="morisjs.html">Moris JS</a></li>
                          <li><a href="echarts.html">ECharts</a></li>
                          <li><a href="other_charts.html">Other Charts</a></li>
                        </ul>
                      </li>
                      <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                          <li><a href="fixed_footer.html">Fixed Footer</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <div class="menu_section">
                    <h3>Live On</h3>
                    <ul class="nav side-menu">
                      <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="e_commerce.html">E-commerce</a></li>
                          
                          <li><a href="project_detail.html">Project Detail</a></li>
                          <li><a href="contacts.html">Contacts</a></li>
                          
                        </ul>
                      </li>
                      <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="page_403.html">403 Error</a></li>
                          <li><a href="page_404.html">404 Error</a></li>
                          <li><a href="page_500.html">500 Error</a></li>
                          <li><a href="plain_page.html">Plain Page</a></li>
                          <li><a href="login.html">Login Page</a></li>
                          <li><a href="pricing_tables.html">Pricing Tables</a></li>
                        </ul>
                      </li>
                      <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="#level1_1">Level One</a>
                            <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                              <ul class="nav child_menu">
                                <li class="sub_menu"><a href="level2.html">Level Two</a>
                                </li>
                                <li><a href="#level2_1">Level Two</a>
                                </li>
                                <li><a href="#level2_2">Level Two</a>
                                </li>
                              </ul>
                            </li>
                            <li><a href="#level1_2">Level One</a>
                            </li>
                        </ul>
                      </li>                  
                      <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                    </ul-->
                  </div>
    
                </div>
                <!-- /sidebar menu -->
    
                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small" fxFlex="value%" fxFlexAlign="w_center">
                  <a data-toggle="tooltip" data-placement="top" title="Settings">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                  </a>
                  <!--a data-toggle="tooltip" data-placement="top" title="FullScreen">
                    <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                  </a>
                  <a data-toggle="tooltip" data-placement="top" title="Lock">
                    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                  </a-->
                  <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html" >
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                  </a>
                </div>
                <!-- /menu footer buttons -->
              </div>
            </div>
    
            <!-- top navigation -->
            <div class="top_nav">
              <div class="nav_menu">
                <nav>
                  <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                  </div>
    
                  <ul class="nav navbar-nav navbar-right">
                    <li class="">
                      <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="HomeAssets/images/img.jpg" alt="">John Doe
                        <span class=" fa fa-angle-down"></span>
                      </a>
                      <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;"> Profile</a></li>
                        <li>
                          <a href="javascript:;">
                            <span class="badge bg-red pull-right">50%</span>
                            <span>Settings</span>
                          </a>
                        </li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                      </ul>
                    </li>
    
                    <li role="presentation" class="dropdown">
                      <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green">6</span>
                      </a>
                      <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        <li>
                          <a>
                            <span class="image"><img src="HomeAssets/images/img.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="HomeAssets/images/img.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="HomeAssets/images/img.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="HomeAssets/images/img.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <div class="text-center">
                            <a>
                              <strong>See All Alerts</strong>
                              <i class="fa fa-angle-right"></i>
                            </a>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
            <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="col-md-8 col-sm-4 col-xs-6 tile_stats_count" style="margin-left: 4%;">
          <top tiles>
          <div class="row tile_count">
            <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total registered fullstack developers</span>
              <div class="count">2737</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> From last Week</span>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> Total job openings</span>
              <div class="count">4535</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total registered upto-date developers</span>
              <div class="count green">1600</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>10% </i> From last Week</span>
            </div>
            <!--div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
              <div class="count">4,567</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
              <div class="count">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
              <div class="count">7,325</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div-->
          </div>
          </div>
          <!-- /top tiles -->

          <div class="row"> 
              <div class="col-md-7" >
                <div class="x_panel">

                  <div class="row x_title">
                      <div class="col-md-6">
                      <h3>Job postings </h3>
                      </div>
            
                  </div>
                  
                  <div style="width:100%;">
                      <canvas id="canvas"></canvas>
                  </div>
                  <br>
                  <br>
                <div style="margin-left: 4%">
                  <button id="addData">Add Timeline</button>
                  <button id="removeData">Reduce Timeline</button>
                </div>
                  <script>
                      var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                      var fe = [15,54,26,87,32,95,12,48,46,15,23,45];
                      var qa = [54,32,64,15,43,49,19,12,54,32,61,15];
                      var ba = [12,32,15,24,21,26,35,31,26,54,12,32];
                      var ui = [32,31,64,35,64,15,16,5,4,46,21,14];
                      var fs = [14,12,13,18,21,24,26,19,18,27,13,16];
                      var gd = [16,14,18,24,29,35,34,31,28,27,20,15];
                      var na = [32,31,22,24,45,26,31,15,18,19,16,14];
                      var pt = [32,15,45,65,23,15,45,21,18,14,5,16];
                      var randomScalingFactor = function() {
                          return Math.round(Math.random() * 50 * (Math.random() > 0.5 ? 1 : 1)) + 50;
                      };
                      var randomColorFactor = function() {
                          return Math.round(Math.random() * 255);
                      };
                      var randomColor = function(opacity) {
                          return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',' + (opacity || '.3') + ')';
                      };
              
                      var config = {
                          type: 'line',
                          data: {
                              labels: ["January", "February", "March", "April", "May", "June", "July"],
                              datasets: [{
                                  label: "Front End Developer",
                                  data: fe,
                                  fill: true,
                                  borderDash: [5, 5],
                              }, {
                                  label: "QA Engineer ",
                                  data: qa,
                              },{
                                  label: "Business Analyst ",
                                  data: ba,
                              },{
                                  label: "Data Analyst",
                                  data: ui,
                              },{
                                  label: "Full Stack Developer",
                                  data: fs,
                              },{
                                  label: "Graphic Designer",
                                  data: gd,
                              },{
                                  label: "Network Architect",
                                  data: na,
                              }]
                          },
                          options: {
                              responsive: true,
                              title:{
                                  display:true,
                                 /* text:"Chart.js Line Chart - X-Axis Filter"*/
                              },
                              scales: {
                                  xAxes: [{
                                      display: true,
                                      ticks: {
                                          userCallback: function(dataLabel, index) {
                                              return index % 2 === 0 ? dataLabel : '';
                                          }
                                      }
                                  }],
                                  yAxes: [{
                                      display: true,
                                      beginAtZero: false
                                  }]
                              }
                          }
                      };
              
                      $.each(config.data.datasets, function(i, dataset) {
                          dataset.borderColor = randomColor(0.4);
                          dataset.backgroundColor = randomColor(0.5);
                          dataset.pointBorderColor = randomColor(0.7);
                          dataset.pointBackgroundColor = randomColor(0.5);
                          dataset.pointBorderWidth = 1;
                      });
              
                      window.onload = function() {
                          var ctx = document.getElementById("canvas").getContext("2d");
                          window.myLine = new Chart(ctx, config);
                      };
              
                      $('#randomizeData').click(function() {
                          $.each(config.data.datasets, function(i, dataset) {
                              dataset.data = dataset.data.map(function() {
                                  return randomScalingFactor();
                              });
              
                          });
              
                          window.myLine.update();
                      });
              
                      $('#addDataset').click(function() {
                          var newDataset = {
                              label: 'Dataset ' + config.data.datasets.length,
                              borderColor: randomColor(0.4),
                              backgroundColor: randomColor(0.5),
                              pointBorderColor: randomColor(0.7),
                              pointBackgroundColor: randomColor(0.5),
                              pointBorderWidth: 1,
                              data: [],
                          };
              
                          for (var index = 0; index < config.data.labels.length; ++index) {
                              newDataset.data.push(randomScalingFactor());
                          }
              
                          config.data.datasets.push(newDataset);
                          window.myLine.update();
                      });
              
                      $('#addData').click(function() {
                          if (config.data.datasets.length > 0) {
                              var month = MONTHS[config.data.labels.length % MONTHS.length];
                              config.data.labels.push(month);
              
                              for (var index = 0; index < config.data.datasets.length; ++index) {
                                  config.data.datasets[index].data.push(randomScalingFactor());
                              }
              
                              window.myLine.update();
                          }
                      });
              
                      $('#removeDataset').click(function() {
                          config.data.datasets.splice(0, 1);
                          window.myLine.update();
                      });
              
                      $('#removeData').click(function() {
                          config.data.labels.splice(-1, 1); // remove the label first
              
                          config.data.datasets.forEach(function(dataset, datasetIndex) {
                              dataset.data.pop();
                          });
              
                          window.myLine.update();
                      });
                  </script>
                </div>
              </div>
                  
                  <div class="col-md-5 col-sm-4 col-xs-12">
                      <div class="x_panel" id="canvas">
                        <div class="x_title">
                          <h2>What's new <small>Read now</small></h2>
                          
                          <div class="clearfix"></div>
                        </div>
                        <div class="x_content" style="overflow: auto; box-sizing: border-box;max-height: 366px; overflow-y: scroll;">
                          <div class="dashboard-widget-content" >
              
                            <ul class="list-unstyled timeline widget">
                              <li>
                                <div class="block">
                                  <div class="block_content">
                                    <h2 class="title">
                                                      <a href="https://www.sitepoint.com/introduction-mean-stack/">An Introduction to the MEAN Stack</a>
                                                  </h2>
                                    <div class="byline">
                                      <span>Jay Raj</span> on <a>Sitepoint</a>
                                    </div>
                                    <p class="excerpt">The term MEAN stack refers to a collection of JavaScript based technologies used to develop web applications. MEAN is an acronym for MongoDB, ExpressJS, AngularJS and Node.js. From client to server to database, MEAN is full stac… <a href="https://www.sitepoint.com/introduction-mean-stack/">Read&nbsp;More</a>
                                    </p>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="block">
                                  <div class="block_content">
                                    <h2 class="title">
                                                      <a href="https://www.forbes.com/sites/cognitiveworld/2019/09/11/the-full-stack-data-scientist-myth-unicorn-or-new-normal/#1aebcbf62c60">The Full Stack Data Scientist: Myth, Unicorn, or New Normal?</a>
                                                  </h2>
                                    <div class="byline">
                                      <span>Nisha Talagala</span> on <a>Forbes</a>
                                    </div>
                                    <p class="excerpt">As AI proliferates and more and more industries try to beef up their data scientist teams, a new concept has been emerging - the “Full Stack Data Scientist”. What is this new role? What should an organization do about it?… <a href="https://www.forbes.com/sites/cognitiveworld/2019/09/11/the-full-stack-data-scientist-myth-unicorn-or-new-normal/#1aebcbf62c60">Read&nbsp;More</a>
                                    </p>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="block">
                                  <div class="block_content">
                                    <h2 class="title">
                                                      <a href="https://www.sitepoint.com/introduction-mean-stack/">An Introduction to the MEAN Stack</a>
                                                  </h2>
                                    <div class="byline">
                                      <span>Jay Raj</span> on <a>Sitepoint</a>
                                    </div>
                                    <p class="excerpt">The term MEAN stack refers to a collection of JavaScript based technologies used to develop web applications. MEAN is an acronym for MongoDB, ExpressJS, AngularJS and Node.js. From client to server to database, MEAN is full stac… <a href="https://www.sitepoint.com/introduction-mean-stack/">Read&nbsp;More</a>
                                    </p>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="block">
                                  <div class="block_content">
                                    <h2 class="title">
                                                      <a href="https://www.forbes.com/sites/cognitiveworld/2019/09/11/the-full-stack-data-scientist-myth-unicorn-or-new-normal/#1aebcbf62c60">The Full Stack Data Scientist: Myth, Unicorn, or New Normal?</a>
                                                  </h2>
                                    <div class="byline">
                                      <span>Nisha Talagala</span> on <a>Forbes</a>
                                    </div>
                                    <p class="excerpt">As AI proliferates and more and more industries try to beef up their data scientist teams, a new concept has been emerging - the “Full Stack Data Scientist”. What is this new role? What should an organization do about it?… <a href="https://www.forbes.com/sites/cognitiveworld/2019/09/11/the-full-stack-data-scientist-myth-unicorn-or-new-normal/#1aebcbf62c60">Read&nbsp;More</a>
                                    </p>
                                  </div>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
          <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Latest videos</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row" style="overflow-x: hidden;display: flex;overflow-y: auto;align-items:center;width: 100%;max-height: 332px;">
                    <div class="col-md-3">
                    <div><div data-courseid="362328" class="course-discovery-unit--card-margin--2TVw4 merchandising-course-card--card--2UfMa"><a href="https://www.udemy.com/course/aws-certified-solutions-architect-associate/" data-purpose="merchandising-course-card-body-362328" target="_self" class="merchandising-course-card--mask--2-b-d"><div class="merchandising-course-card--card-header--89z8L"><img class="merchandising-course-card--course-image--3G7Kh" alt="" width="240" height="135" src="https://i.udemycdn.com/course/240x135/362328_91f3_10.jpg" srcset="https://i.udemycdn.com/course/240x135/362328_91f3_10.jpg 1x, https://i.udemycdn.com/course/480x270/362328_91f3_10.jpg 2x"></div><div class="merchandising-course-card--card-body--3OpAH"><div><div class="merchandising-course-card--course-title--2Ob4m" data-purpose="course-card-title">AWS Certified Solutions Architect - Associate 2019</div><span class="course-badge--course-badge--1AN7r"><span data-purpose="badge" class="on-course-card badge badge-accented yellow"></span></span><span class="merchandising-course-card--instructor-titles--vXVfV" data-purpose="course-card-instructor-titles">Ryan Kroonenburg, Faye Ellis</span></div><div class="fx-jsb"><span data-purpose="details-rating" class="star-rating--details__rating--36AIt"><span class="star-rating--star-container--186zZ"><div aria-label="Rating: 4.5 out of 5, 147,717 reviews" data-purpose="star-rating-shell" class="star-rating-shell star-rating--star-rating--static--3wPvS star-rating--star-rating--tiny--2kjvX"><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 50%;"></span></div></div></span><span aria-hidden="true" class="star-rating--review__numbers-container--2euA-"><span class="star-rating--reviews__count--1Zo2k" data-purpose="course-card-review-count"></span></span></span></div><div class="merchandising-course-card--price-wrapper--1eeWg" data-purpose="course-card-price-wrapper"><div class="price-text-container price-text--base-price__container--Xwk8v price-text--reverse--1rh1B" data-purpose="price-text-container"><div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--medium--2clK9 price-text--semibold--DLyJV" data-purpose="course-price-text"><span class="sr-only"></span><span><span></span></span></div><div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--xsmall--nWcmv price-text--regular--2D_Ii" data-purpose="original-price-container"><div data-purpose="course-old-price-text"><span class="sr-only"></span><span><s><span></span></s></span></div></div></div></div></div></a></div></div>
                    </div>
                    <div class="col-md-3">
                    <div><div data-courseid="393306" class="course-discovery-unit--card-margin--2TVw4 merchandising-course-card--card--2UfMa"><a href="https://www.udemy.com/course/aws-certified-developer-associate/" data-purpose="merchandising-course-card-body-393306" target="_self" class="merchandising-course-card--mask--2-b-d"><div class="merchandising-course-card--card-header--89z8L"><img class="merchandising-course-card--course-image--3G7Kh" alt="" width="240" height="135" src="https://i.udemycdn.com/course/240x135/393306_f2a5_6.jpg" srcset="https://i.udemycdn.com/course/240x135/393306_f2a5_6.jpg 1x, https://i.udemycdn.com/course/480x270/393306_f2a5_6.jpg 2x"></div><div class="merchandising-course-card--card-body--3OpAH"><div><div class="merchandising-course-card--course-title--2Ob4m" data-purpose="course-card-title">AWS Certified Developer - Associate 2019</div><span class="course-badge--course-badge--1AN7r"><span data-purpose="badge" class="on-course-card badge badge-accented yellow"></span></span><span class="merchandising-course-card--instructor-titles--vXVfV" data-purpose="course-card-instructor-titles">Ryan Kroonenburg, Faye Ellis</span></div><div class="fx-jsb"><span data-purpose="details-rating" class="star-rating--details__rating--36AIt"><span class="star-rating--star-container--186zZ"><div aria-label="Rating: 4.3 out of 5, 31,105 reviews" data-purpose="star-rating-shell" class="star-rating-shell star-rating--star-rating--static--3wPvS star-rating--star-rating--tiny--2kjvX"><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 30%;"></span></div></div></span><span aria-hidden="true" class="star-rating--review__numbers-container--2euA-"><span class="star-rating--reviews__stats--3ANGp" data-purpose="course-card-star-rating"></span></span></span></div><div class="merchandising-course-card--price-wrapper--1eeWg" data-purpose="course-card-price-wrapper"><div class="price-text-container price-text--base-price__container--Xwk8v price-text--reverse--1rh1B" data-purpose="price-text-container"><div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--medium--2clK9 price-text--semibold--DLyJV" data-purpose="course-price-text"><span><span></span></span></div><div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--xsmall--nWcmv price-text--regular--2D_Ii" data-purpose="original-price-container"><div data-purpose="course-old-price-text"><span class="sr-only"></span><span><s></s></span></div></div></div></div></div></a></div></div>
                  </div>
                      
                    <div class="col-md-3">
                    <div><div data-courseid="950390" class="course-discovery-unit--card-margin--2TVw4 merchandising-course-card--card--2UfMa"><a href="https://www.udemy.com/course/machinelearning/" data-purpose="merchandising-course-card-body-950390" target="_self" class="merchandising-course-card--mask--2-b-d"><div class="merchandising-course-card--card-header--89z8L"><img class="merchandising-course-card--course-image--3G7Kh" alt="" width="240" height="135" src="https://i.udemycdn.com/course/240x135/950390_270f_3.jpg" srcset="https://i.udemycdn.com/course/240x135/950390_270f_3.jpg 1x, https://i.udemycdn.com/course/480x270/950390_270f_3.jpg 2x"></div><div class="merchandising-course-card--card-body--3OpAH"><div><div class="merchandising-course-card--course-title--2Ob4m" data-purpose="course-card-title">Machine Learning A-Z™: Hands-On Python &amp; R In Data Science</div><span class="course-badge--course-badge--1AN7r"><span data-purpose="badge" class="on-course-card badge badge-accented yellow"></span></span><span class="merchandising-course-card--instructor-titles--vXVfV" data-purpose="course-card-instructor-titles">Kirill Eremenko...</span></div><div class="fx-jsb"><span data-purpose="details-rating" class="star-rating--details__rating--36AIt"><span class="star-rating--star-container--186zZ"><div aria-label="Rating: 4.5 out of 5, 93,582 reviews" data-purpose="star-rating-shell" class="star-rating-shell star-rating--star-rating--static--3wPvS star-rating--star-rating--tiny--2kjvX"><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 50%;"></span></div></div></span><span aria-hidden="true" class="star-rating--review__numbers-container--2euA-"><span class="star-rating--reviews__stats--3ANGp" data-purpose="course-card-star-rating"></span></span></span></div><div class="merchandising-course-card--price-wrapper--1eeWg" data-purpose="course-card-price-wrapper"><div class="price-text-container price-text--base-price__container--Xwk8v price-text--reverse--1rh1B" data-purpose="price-text-container"><div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--medium--2clK9 price-text--semibold--DLyJV" data-purpose="course-price-text"><span></span></div><div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--xsmall--nWcmv price-text--regular--2D_Ii" data-purpose="original-price-container"><div data-purpose="course-old-price-text"><span><s></s></span></div></div></div></div></div></a></div></div>
                  </div>
                    
                    <div class="col-md-3">
                    <div><div data-courseid="903744" class="course-discovery-unit--card-margin--2TVw4 merchandising-course-card--card--2UfMa"><a href="https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/" data-purpose="merchandising-course-card-body-903744" target="_self" class="merchandising-course-card--mask--2-b-d"><div class="merchandising-course-card--card-header--89z8L"><img class="merchandising-course-card--course-image--3G7Kh" alt="" width="240" height="135" src="https://i.udemycdn.com/course/240x135/903744_8eb2.jpg" srcset="https://i.udemycdn.com/course/240x135/903744_8eb2.jpg 1x, https://i.udemycdn.com/course/480x270/903744_8eb2.jpg 2x"></div><div class="merchandising-course-card--card-body--3OpAH"><div><div class="merchandising-course-card--course-title--2Ob4m" data-purpose="course-card-title">Python for Data Science and Machine Learning Bootcamp</div><span class="merchandising-course-card--instructor-titles--vXVfV" data-purpose="course-card-instructor-titles">Jose Portilla</span></div><div class="fx-jsb"><span data-purpose="details-rating" class="star-rating--details__rating--36AIt"><span class="star-rating--star-container--186zZ"><div aria-label="Rating: 4.5 out of 5, 52,513 reviews" data-purpose="star-rating-shell" class="star-rating-shell star-rating--star-rating--static--3wPvS star-rating--star-rating--tiny--2kjvX"><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 50%;"></span></div></div></span><span aria-hidden="true" class="star-rating--review__numbers-container--2euA-"></span></span></div><div class="merchandising-course-card--price-wrapper--1eeWg" data-purpose="course-card-price-wrapper"><div class="price-text-container price-text--base-price__container--Xwk8v price-text--reverse--1rh1B" data-purpose="price-text-container"><div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--medium--2clK9 price-text--semibold--DLyJV" data-purpose="course-price-text"><span></span></div><div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--xsmall--nWcmv price-text--regular--2D_Ii" data-purpose="original-price-container"><div data-purpose="course-old-price-text"><span><s></s></span></div></div></div></div></div></a></div></div>
                  </div>
                  
                    <div class="col-md-3">
                    <div><div data-courseid="762616" class="course-discovery-unit--card-margin--2TVw4 merchandising-course-card--card--2UfMa"><a href="https://www.udemy.com/course/the-complete-sql-bootcamp/" data-purpose="merchandising-course-card-body-762616" target="_self" class="merchandising-course-card--mask--2-b-d"><div class="merchandising-course-card--card-header--89z8L"><img class="merchandising-course-card--course-image--3G7Kh" alt="" width="240" height="135" src="https://i.udemycdn.com/course/240x135/762616_7693_3.jpg" srcset="https://i.udemycdn.com/course/240x135/762616_7693_3.jpg 1x, https://i.udemycdn.com/course/480x270/762616_7693_3.jpg 2x"></div><div class="merchandising-course-card--card-body--3OpAH"><div><div class="merchandising-course-card--course-title--2Ob4m" data-purpose="course-card-title">The Complete SQL Bootcamp</div><span class="course-badge--course-badge--1AN7r"><span data-purpose="badge" class="on-course-card badge badge-accented yellow"></span></span><span class="merchandising-course-card--instructor-titles--vXVfV" data-purpose="course-card-instructor-titles">Jose Portilla</span></div><div class="fx-jsb"><span data-purpose="details-rating" class="star-rating--details__rating--36AIt"><span class="star-rating--star-container--186zZ"><div aria-label="Rating: 4.6 out of 5, 41,620 reviews" data-purpose="star-rating-shell" class="star-rating-shell star-rating--star-rating--static--3wPvS star-rating--star-rating--tiny--2kjvX"><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 100%;"></span></div><div><span class="star-rating--review-star--Z6Nqj star-rating--review-star--unfilled--1aZxo"></span><span class="star-rating--review-star--Z6Nqj star-rating--review-star--filled--2D0bO" style="width: 60%;"></span></div></div></span><span aria-hidden="true" class="star-rating--review__numbers-container--2euA-"></span></span></div><div class="merchandising-course-card--price-wrapper--1eeWg" data-purpose="course-card-price-wrapper"><div class="price-text-container price-text--base-price__container--Xwk8v price-text--reverse--1rh1B" data-purpose="price-text-container"><div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--medium--2clK9 price-text--semibold--DLyJV" data-purpose="course-price-text"><span></span></div><div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--xsmall--nWcmv price-text--regular--2D_Ii" data-purpose="original-price-container"><div data-purpose="course-old-price-text"><span><s></s></span></div></div></div></div></div></a></div></div>
                  </div>     

                  </div>
                  </div>
            </div> 
        </div>
          <div class="row">
                  <div class="col-md-6">
                    <div class="x_panel">
                  
                      <div class="x_title">
                        <h2>Top Comanies Hiring Now</h2>
                        <div class="clearfix"></div>
                      </div>
                      <h5><img src="HomeAssets/images/wso2.png" height="26px" width="60px"></h5>
                      <div class="progress">
                        <div class="progress-bar progress-bar-warning" data-transitiongoal="80"><font size="3px">80%</font></div>
                      </div>
                      <h5><img src="HomeAssets/images/dialog.png" height="26px" width="50px"></h5>
                      <div class="progress">
                        <div class="progress-bar progress-bar-danger" data-transitiongoal="60"><font size="3px">60%</font></div>
                      </div>
                      <h5><img src="HomeAssets/images/codegen.jpg" height="26px" width="86px"></h5>
                      <div class="progress">
                        <div class="progress-bar progress-bar-info" data-transitiongoal="65"><font size="3px">65%</font></div>
                      </div>
                      <h5><img src="HomeAssets/images/99x.png" height="26px" width="90px"></h5>
                      <div class="progress">
                        <div class="progress-bar progress-bar-danger" data-transitiongoal="76"><font size="3px">76%</font></div>
                      </div>
                      <h5><img src="HomeAssets/images/lseg.png" height="26px" width="100px"></h5>
                      <div class="progress">
                        <div class="progress-bar progress-bar-warning" data-transitiongoal="60"><font size="3px">60%</font></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12 col-xs-12">
                      <div class="x_panel">
                        <div class="x_title">
                          <h2>Find Jobs <small>In Sri Lanka</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                          <div class="dashboard-widget-content">
                            <div class="col-md-4 hidden-small">
                              <h2 class="line_30">From almost 1000 entries</h2>
    
                              <table class="countries_list">
                                <tbody>
                                  <tr>
                                    <td>Colombo</td>
                                    <td class="fs15 fw700 text-right">33%</td>
                                  </tr>
                                  <tr>
                                    <td>Nuwara Eliya</td>
                                    <td class="fs15 fw700 text-right">27%</td>
                                  </tr>
                                  <tr>
                                    <td>Matara</td>
                                    <td class="fs15 fw700 text-right">16%</td>
                                  </tr>
                                  <tr>
                                    <td>Galle</td>
                                    <td class="fs15 fw700 text-right">11%</td>
                                  </tr>
                                  <tr>
                                    <td>Hambantota</td>
                                    <td class="fs15 fw700 text-right">10%</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                            <!-- <div id="world-map-gdp" class="col-md-8 col-sm-12 col-xs-12" style="height:230px;"></div> -->
                            <img src="HomeAssets/images/lanka.png" style="width:auto;height:360px">
                          </div>
                        </div>
                      </div>
                    </div>
          <!--
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>App Versions</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <h4>App Usage across versions</h4>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>0.1.5.2</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>123k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>0.1.5.3</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>53k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>0.1.5.4</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>23k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>0.1.5.5</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>3k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>0.1.5.6</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>1k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                  <h2>Device Usage</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>Top 5</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <p class="">Device</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                          <p class="">Progress</p>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                          <tr>
                            <td>
                              <p><i class="fa fa-square blue"></i>IOS </p>
                            </td>
                            <td>30%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square green"></i>Android </p>
                            </td>
                            <td>10%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square purple"></i>Blackberry </p>
                            </td>
                            <td>20%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square aero"></i>Symbian </p>
                            </td>
                            <td>15%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square red"></i>Others </p>
                            </td>
                            <td>30%</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>


            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>Quick Settings</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">
                    <ul class="quick-list">
                      <li><i class="fa fa-calendar-o"></i><a href="#">Settings</a>
                      </li>
                      <li><i class="fa fa-bars"></i><a href="#">Subscription</a>
                      </li>
                      <li><i class="fa fa-bar-chart"></i><a href="#">Auto Renewal</a> </li>
                      <li><i class="fa fa-line-chart"></i><a href="#">Achievements</a>
                      </li>
                      <li><i class="fa fa-bar-chart"></i><a href="#">Auto Renewal</a> </li>
                      <li><i class="fa fa-line-chart"></i><a href="#">Achievements</a>
                      </li>
                      <li><i class="fa fa-area-chart"></i><a href="#">Logout</a>
                      </li>
                    </ul>

                    <div class="sidebar-widget">
                        <h4>Profile Completion</h4>
                        <canvas width="150" height="80" id="chart_gauge_01" class="" style="width: 160px; height: 100px;"></canvas>
                        <div class="goal-wrapper">
                          <span id="gauge-text" class="gauge-value pull-left">0</span>
                          <span class="gauge-value pull-left">%</span>
                          <span id="goal-text" class="goal-value pull-right">100%</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div-->


          
                <!-- Start to do list >
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List <small>Sample tasks</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                          </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                      <div class="">
                        <ul class="to_do">
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End to do list -->
                
                <!-- start of weather widget >
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Weather <small>Sessions</small></h2>
                      
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                      <div class="row">
                        <div class="col-sm-12">
                          <div class="temperature"><b>Monday</b>, 07:30 AM
                            <span>F</span>
                            <span><b>C</b></span>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="weather-icon">
                            <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <div class="weather-text">
                            <h2>Colombo <br><i>Partly Cloudy Day</i></h2>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="weather-text pull-right">
                          <h3 class="degrees">23</h3>
                        </div>
                      </div>

                      <div class="clearfix"></div>

                      <div class="row weather-days">
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Mon</h2>
                            <h3 class="degrees">25</h3>
                            <canvas id="clear-day" width="32" height="32"></canvas>
                            <h5>15 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Tue</h2>
                            <h3 class="degrees">25</h3>
                            <canvas height="32" width="32" id="rain"></canvas>
                            <h5>12 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Wed</h2>
                            <h3 class="degrees">27</h3>
                            <canvas height="32" width="32" id="snow"></canvas>
                            <h5>14 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Thu</h2>
                            <h3 class="degrees">28</h3>
                            <canvas height="32" width="32" id="sleet"></canvas>
                            <h5>15 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Fri</h2>
                            <h3 class="degrees">28</h3>
                            <canvas height="32" width="32" id="wind"></canvas>
                            <h5>11 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Sat</h2>
                            <h3 class="degrees">26</h3>
                            <canvas height="32" width="32" id="cloudy"></canvas>
                            <h5>10 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                      </div>
                    </div>
                  </div>

                </div>
                <!-- end of weather widget -->
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
  </div>

    <!-- jQuery -->
    <script src="HomeAssets/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="HomeAssets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="HomeAssets/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="HomeAssets/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="HomeAssets/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="HomeAssets/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="HomeAssets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="HomeAssets/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="HomeAssets/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="HomeAssets/vendors/Flot/jquery.flot.js"></script>
    <script src="HomeAssets/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="HomeAssets/vendors/Flot/jquery.flot.time.js"></script>
    <script src="HomeAssets/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="HomeAssets/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="HomeAssets/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="HomeAssets/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="HomeAssets/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="HomeAssets/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="HomeAssets/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="HomeAssets/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="HomeAssets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="HomeAssets/vendors/moment/min/moment.min.js"></script>
    <script src="HomeAssets/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!--E-charts-->
    <script src="HomeAssets/vendors/echarts/dist/echarts.min.js"></script>
    <script src="HomeAssets/vendors/echarts/map/js/world.js"></script>

    
    <!-- Custom Theme Scripts -->
    <script src="HomeAssets/build/js/custom.min.js"></script>
	
  </body>
</html>
