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
                  <div class="divTableCell"><a class="navbar1-brand" href="index.jsp"><img src="HomeAssets/images/Career Master Vert.png" height="56px"></a>
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
              <a href="dashboard.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
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
                  <li><a href="UserDashBoard.jsp"><i class="fa fa-home"></i> Home <!--span class="fa fa-chevron-down"></span--></a>
                    <!--ul class="nav child_menu">
                      <li><a href="dashboard.jsp">Dashboard</a></li>
                      <li><a href="index2.jsp">Dashboard2</a></li>
                      <li><a href="index3.jsp">Dashboard3</a></li>
                    </ul-->
                  </li>
                  <li><a href="whatsnew.jsp"><i class="fa fa-user"></i> What's New </a>
                  </li>
                  <li><a><i class="fa fa-trophy"></i>Skills & Achievements <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.jsp">Skills</a></li>
                      
                      <!--li><a href="typography.jsp">Typography</a></li>
                      <li><a href="icons.jsp">Icons</a></li>
                      <li><a href="glyphicons.jsp">Glyphicons</a></li>
                      <li><a href="widgets.jsp">Widgets</a></li>
                      <li><a href="invoice.jsp">Invoice</a></li-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-file-text"></i> My CV <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="mycv.jsp">View CV</a></li>
                      <li><a>Edit CV</a></li>
                      
                      <!--li><a href="form_wizards.jsp">Form Wizard</a></li>
                      <li><a href="form_upload.jsp">Form Upload</a></li>
                      <li><a href="form_advanced.jsp">Advanced Components</a></li>
                      <li><a href="form_buttons.jsp">Form Buttons</a></li-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-user"></i> My Profile <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <!--li><a href="tables.jsp">Tables</a></li>
                      <li><a href="tables_dynamic.jsp">Table Dynamic</a></li-->
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="form.jsp">Edit Profile</a></li>
                        <li><a href="projects.jsp">My Jobs</a></li>
                        <li><a href="inbox.jsp">Inbox</a></li>
                       <li><a href="calendar.jsp">Calendar</a></li>
                    </ul>
                  </li>
                  <!--li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.jsp">Chart JS</a></li>
                      <li><a href="chartjs2.jsp">Chart JS2</a></li>
                      <li><a href="morisjs.jsp">Moris JS</a></li>
                      <li><a href="echarts.jsp">ECharts</a></li>
                      <li><a href="other_charts.jsp">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.jsp">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.jsp">Fixed Footer</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.jsp">E-commerce</a></li>
                      
                      <li><a href="project_detail.jsp">Project Detail</a></li>
                      <li><a href="contacts.jsp">Contacts</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.jsp">403 Error</a></li>
                      <li><a href="page_404.jsp">404 Error</a></li>
                      <li><a href="page_500.jsp">500 Error</a></li>
                      <li><a href="plain_page.jsp">Plain Page</a></li>
                      <li><a href="login.jsp">Login Page</a></li>
                      <li><a href="pricing_tables.jsp">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.jsp">Level Two</a>
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
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp" >
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
                    <li><a href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>My Skills </h3>
              </div>
            </div>
<br />
            
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_content">
                          <h4>Languages</h4>
                    <button type="button" class="btn btn-primary">C#</button>
<button type="button" class="btn btn-secondary">JAVA</button>
<button type="button" class="btn btn-success">Javascript</button>
<button type="button" class="btn btn-danger">.Net</button>
<button type="button" class="btn btn-warning">Python</button>
<button type="button" class="btn btn-info">MongoDB</button>
<button type="button" class="btn btn-light">HTML/CSS</button>
<button type="button" class="btn btn-dark">SQL</button>
                </div>
            </div>
            </div>
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_content">
                      <h4>Web Frameworks</h4>
                <button type="button" class="btn btn-primary">jQuery</button>
<button type="button" class="btn btn-secondary">React.js</button>
<button type="button" class="btn btn-success">Angular.js</button>
<button type="button" class="btn btn-danger">ASP.Net</button>
<button type="button" class="btn btn-warning">Express</button>
<button type="button" class="btn btn-info">Spring</button>
<button type="button" class="btn btn-light">Vue.js</button>
<button type="button" class="btn btn-dark">Django</button>
            </div>
        </div>
        </div>
            
            <div class="row">
              
            <div class="col-md-6" >
              <div class="x_panel">

                <div class="row x_title">
                    <div class="col-md-6">
                    <h3>Skill Popularity</h3>
                    </div>
                    <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                    <span>September 18, 2019 - September 24, 2019</span> <b class="caret"></b>
                    </div>
                    </div>
                
                </div>
                <canvas id="line-chart" width="800" height="450"></canvas>
                <script>
                new Chart(document.getElementById("line-chart"), {
  type: 'line',
  data: {
    labels: ["January","February","March","April","May","June","July","August","September","October"],
    datasets: [{ 
        data: [67.8,65,63,56,55,51,46,48,50,62],
        label: "JavaScript",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [63.5,61.2,59,54,52,53,51,49,47,30],
        label: "HTML/CSS",
        borderColor: "#8e5ea2",
        fill: false
      }, { 
        data: [54.4,55,52,49,46,43,39,34,33.2,30],
        label: "SQL",
        borderColor: "#3cba9f",
        fill: false
      }, { 
        data: [41.7,39,37,36,34,31,29.5,28.7,25,24.8],
        label: "Python",
        borderColor: "#e8c3b9",
        fill: false
      }, { 
        data: [41.1,39.8,37.5,36,34,32.1,31,28,26.4,26],
        label: "Java",
        borderColor: "#c45850",
        fill: false
      }, { 
        data: [36.6,34,31.2,29.5,28.7,26,25.8,24,23.8,23],
        label: "PowerShell",
        borderColor: "#c4e250",
        fill: false
      }, { 
        data: [31,30.5,29.3,27,26.8,26.4,25,24.6,24,23.7],
        label: "C#",
        borderColor: "#c465e0",
        fill: false
      }, { 
        data: [26.4,25,24.8,24.2,24,23.8,23.7,23.4,23,22.8],
        label: "PHP",
        borderColor: "#c7e940",
        fill: false
      }, { 
        data: [23.5,23,22.9,22.4,22,21.6,21.2,21,20.9,20.5],
        label: "C++",
        borderColor: "#c73e40",
        fill: false
      }, { 
        data: [21.2,21,20.9,20.5,20.2,20,19.8,19.4,19.2,19],
        label: "TypeScript",
        borderColor: "#ce3654",
        fill: false
      }, { 
        data: [20.6,20.2,20.1,20,20.4,19,19.6,19.8,20,20.4],
        label: "C",
        borderColor: "#c6e987",
        fill: false
      }, { 
        data: [8.4,8.5,8.1,8.2,8.6,8.3,8.7,8.1,8,7.9],
        label: "Ruby",
        borderColor: "#c635e9",
        fill: false
      }, { 
        data: [8.2,8.1,8.3,8.1,8,7.9,7.8,7.5,7.8,8],
        label: "Go",
        borderColor: "#ce5850",
        fill: false
      }
    ]
  },
  options: {
    title: {
      display: false,
      text: 'World population per region (in millions)'
    }
  }
});
                </script>
              </div>
            </div>
            <div class="col-md-6" >
                <div class="x_panel">
  
                  <div class="row x_title">
                      <div class="col-md-6">
                      <h3>Skill Popularity</h3>
                      </div>
                      <div class="col-md-6">
                      <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>September 18, 2019 - September 24, 2019</span> <b class="caret"></b>
                      </div>
                      </div>
                  
                  </div>
                  <canvas id="line-chart2" width="800" height="450"></canvas>
                  <script>
                  new Chart(document.getElementById("line-chart2"), {
    type: 'line',
    data: {
      labels: ["January","February","March","April","May","June","July","August","September","October"],
      datasets: [{ 
          data: [67.8,65,63,56,55,51,46,48,50,62],
          label: "JavaScript",
          borderColor: "#3e95cd",
          fill: false
        }, { 
          data: [63.5,61.2,59,54,52,53,51,49,47,30],
          label: "HTML/CSS",
          borderColor: "#8e5ea2",
          fill: false
        }, { 
          data: [54.4,55,52,49,46,43,39,34,33.2,30],
          label: "SQL",
          borderColor: "#3cba9f",
          fill: false
        }, { 
          data: [41.7,39,37,36,34,31,29.5,28.7,25,24.8],
          label: "Python",
          borderColor: "#e8c3b9",
          fill: false
        }, { 
          data: [41.1,39.8,37.5,36,34,32.1,31,28,26.4,26],
          label: "Java",
          borderColor: "#c45850",
          fill: false
        }, { 
          data: [36.6,34,31.2,29.5,28.7,26,25.8,24,23.8,23],
          label: "PowerShell",
          borderColor: "#c4e250",
          fill: false
        }, { 
          data: [31,30.5,29.3,27,26.8,26.4,25,24.6,24,23.7],
          label: "C#",
          borderColor: "#c465e0",
          fill: false
        }, { 
          data: [26.4,25,24.8,24.2,24,23.8,23.7,23.4,23,22.8],
          label: "PHP",
          borderColor: "#c7e940",
          fill: false
        }, { 
          data: [23.5,23,22.9,22.4,22,21.6,21.2,21,20.9,20.5],
          label: "C++",
          borderColor: "#c73e40",
          fill: false
        }, { 
          data: [21.2,21,20.9,20.5,20.2,20,19.8,19.4,19.2,19],
          label: "TypeScript",
          borderColor: "#ce3654",
          fill: false
        }, { 
          data: [20.6,20.2,20.1,20,20.4,19,19.6,19.8,20,20.4],
          label: "C",
          borderColor: "#c6e987",
          fill: false
        }, { 
          data: [8.4,8.5,8.1,8.2,8.6,8.3,8.7,8.1,8,7.9],
          label: "Ruby",
          borderColor: "#c635e9",
          fill: false
        }, { 
          data: [8.2,8.1,8.3,8.1,8,7.9,7.8,7.5,7.8,8],
          label: "Go",
          borderColor: "#ce5850",
          fill: false
        }
      ]
    },
    options: {
      title: {
        display: false,
        text: 'World population per region (in millions)'
      }
    }
  });
                  </script>
                </div>
              </div>
            
            <!-- <div class="col-md-6" >
                <div class="x_panel">
  
                  <div class="row x_title">
                      <div class="col-md-6">
                      <h3>Skill Popularity</h3>
                      </div>
                      <div class="col-md-6">
                      <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>September 18, 2019 - September 24, 2019</span> <b class="caret"></b>
                      </div>
                      </div>
                      <div id="container" style="width: 75%;">
                          <script src="HomeAssets/vendors/chart.js/dist/Chart.bundle.js"></script>
                          <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                          <canvas id="canvas"></canvas>
                      
                      <button id="randomizeData">Randomize Data</button>
                      <button id="addDataset">Add Dataset</button>
                      <button id="removeDataset">Remove Dataset</button>
                      <button id="addData">Add Data</button>
                      <button id="removeData">Remove Data</button>
                      <script>
                          var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                  
                          var randomScalingFactor = function() {
                              return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
                          };
                          var randomColorFactor = function() {
                              return Math.round(Math.random() * 255);
                          };
                          var randomColor = function() {
                              return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',.7)';
                          };
                  
                          var barChartData = {
                              labels: ["January", "February", "March", "April", "May", "June", "July"],
                              datasets: [{
                                  label: 'Dataset 1',
                                  backgroundColor: "rgba(220,220,220,0.5)",
                                  data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
                              }, {
                                  hidden: true,
                                  label: 'Dataset 2',
                                  backgroundColor: "rgba(151,187,205,0.5)",
                                  data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
                              }, {
                                  label: 'Dataset 3',
                                  backgroundColor: "rgba(151,187,205,0.5)",
                                  data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
                              }]
                  
                          };
                  
                          window.onload = function() {
                              var ctx = document.getElementById("canvas").getContext("2d");
                              window.myBar = new Chart(ctx, {
                                  type: 'bar',
                                  data: barChartData,
                                  options: {
                                      // Elements options apply to all of the options unless overridden in a dataset
                                      // In this case, we are setting the border of each bar to be 2px wide and green
                                      elements: {
                                          rectangle: {
                                              borderWidth: 2,
                                              borderColor: 'rgb(0, 255, 0)',
                                              borderSkipped: 'bottom'
                                          }
                                      },
                                      responsive: true,
                                      legend: {
                                          position: 'top',
                                      },
                                      title: {
                                          display: true,
                                          text: 'Chart.js Bar Chart'
                                      }
                                  }
                              });
                  
                          };
                  
                          $('#randomizeData').click(function() {
                              var zero = Math.random() < 0.2 ? true : false;
                              $.each(barChartData.datasets, function(i, dataset) {
                                  dataset.backgroundColor = randomColor();
                                  dataset.data = dataset.data.map(function() {
                                      return zero ? 0.0 : randomScalingFactor();
                                  });
                  
                              });
                              window.myBar.update();
                          });
                  
                          $('#addDataset').click(function() {
                              var newDataset = {
                                  label: 'Dataset ' + barChartData.datasets.length,
                                  backgroundColor: randomColor(),
                                  data: []
                              };
                  
                              for (var index = 0; index < barChartData.labels.length; ++index) {
                                  newDataset.data.push(randomScalingFactor());
                              }
                  
                              barChartData.datasets.push(newDataset);
                              window.myBar.update();
                          });
                  
                          $('#addData').click(function() {
                              if (barChartData.datasets.length > 0) {
                                  var month = MONTHS[barChartData.labels.length % MONTHS.length];
                                  barChartData.labels.push(month);
                  
                                  for (var index = 0; index < barChartData.datasets.length; ++index) {
                                      //window.myBar.addData(randomScalingFactor(), index);
                                      barChartData.datasets[index].data.push(randomScalingFactor());
                                  }
                  
                                  window.myBar.update();
                              }
                          });
                  
                          $('#removeDataset').click(function() {
                              barChartData.datasets.splice(0, 1);
                              window.myBar.update();
                          });
                  
                          $('#removeData').click(function() {
                              barChartData.labels.splice(-1, 1); // remove the label first
                  
                              barChartData.datasets.forEach(function(dataset, datasetIndex) {
                                  dataset.data.pop();
                              });
                  
                              window.myBar.update();
                          });
                      </script>
                      </div>
                  </div>
                </div>
              </div> -->
          </div>
          
            
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