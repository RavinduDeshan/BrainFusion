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

    <title>Career Master </title>

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
    <!-- PNotify -->
    <link href="HomeAssets/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="HomeAssets/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="HomeAssets/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="HomeAssets/build/css/custom.min.css" rel="stylesheet">
  </head>

  <nav class="navbar1 navbar1-expand-lg navbar1-dark ftco_navbar1 bg-dark ftco-navbar1-light" id="ftco-navbar1">
	    <div class="container-fluid px-md-4	">
          <link rel="stylesheet" href="HomeAssets/css/mnk.css">
          
              <div class="divTable blueTable">
                  <div class="divTableBody">
                  <div class="divTableRow">
                    <a class="navbar1-brand" href="index.jsp"><img src="HomeAssets/images/Career Master Vert.png" height="56px"></a>
                    <button class="navbar1-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="oi oi-menu"></span> Menu
                    </button>
                  </div>
                    
                  <div class="divTableCel2">
                      <div class="collapse navbar1-collapse" id="ftco-nav">
                        <ul class="navbar1-nav ml-auto">
                          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
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
  <body class="nav-md" style="position: fixed;">
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
                      <li><a href="dashboard.html"><i class="fa fa-home"></i> Home <!--span class="fa fa-chevron-down"></span--></a>
                        <!--ul class="nav child_menu">
                          <li><a href="dashboard.html">Dashboard</a></li>
                          <li><a href="index2.html">Dashboard2</a></li>
                          <li><a href="index3.html">Dashboard3</a></li>
                        </ul-->
                      </li>
                      <li><a href="whatsnew.html"><i class="fa fa-user"></i> What's New </a>
                      </li>
                      <li><a><i class="fa fa-trophy"></i>Skills & Achievements <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="general_elements.html">Skills</a></li>
                          <li><a href="media_gallery.html">Achievements</a></li>
                          <!--li><a href="typography.html">Typography</a></li>
                          <li><a href="icons.html">Icons</a></li>
                          <li><a href="glyphicons.html">Glyphicons</a></li>
                          <li><a href="widgets.html">Widgets</a></li>
                          <li><a href="invoice.html">Invoice</a></li-->
                        </ul>
                      </li>
                      <li><a><i class="fa fa-file-text"></i> My CV <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                          <li><a href="mycv.html">View CV</a></li>
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
                            <li><a href="profile.html">Profile</a></li>
                            <li><a href="form.html">Edit Profile</a></li>
                            <li><a href="projects.html">My Jobs</a></li>
                            <li><a href="inbox.html">Inbox</a></li>
                           <li><a href="calendar.html">Calendar</a></li>
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
        <div class="right_col" role="main" style="margin-left: 200px;">
          
            <!-- <div class="page-title">
              <div class="title_left">
                <h3>What's Trending</h3>
              </div>

              
            </div> -->

            <div class="">
            <div class="col-md-12" style="max-height: 600px; overflow-y: scroll;">
              <div class="x_panel">
                
                <div class="x_content">
<style>
  .social-icon {
    margin  : 20px 0;
    padding : 0;
    display : block;
    }

.social-icon li {
    display : inline-block;
    margin  : 0 2px;
    }

.social-icon li a {
    display       : block;
    font-size     : 12px;
    color         : #333333;
    width         : 34px;
    height        : 34px;
    line-height   : 33px;
    text-align    : center;
    border-radius : 2px;
    border        : 2px solid #eeeeee;
    }

.social-icon li a:hover {
    border-color : #cccccc;
    }
/* .progress-item {
    position : relative;
    }

.progress-item .progress-title {
    font-size     : 15px;
    font-weight   : 400;
    display       : inline-block;
    margin-bottom : 5px;
    }

.progress-item .progress {
    height        : 4px;
    box-shadow    : none;
    border-radius : 5px;
    }

.progress-item .progress-bar {
    background-color : #FFC107;
    box-shadow       : none;
    text-align       : right;
    }

.progress-item .progress-percent {
    font-size        : 10px;
    background-color : #313131;
    position         : absolute;
    top              : 5px;
    padding          : 0 8px;
    border-radius    : 3px;
    }

.progress-item .progress-percent::before {
    content      : "";
    position     : absolute;
    left         : 0;
    bottom       : -4px;
    border-top   : 6px solid #313131;
    border-right : 8px solid transparent;
    } */

/*-------------------
 * Portfolio
 *-------------------*/

.portfolio-item {
    position      : relative;
    display       : block;
    margin-bottom : 30px;
    }

.portfolio-item .portfolio-thumb img {
    height    : auto;
    display   : block;
    max-width : 100%;
    }

.portfolio-item .portfolio-info {
    position   : absolute;
    bottom     : 0;
    padding    : 30px 15px 5px;
    width      : 100%;
    background : -webkit-linear-gradient(
            top,
            transparent 0%,
            rgba(0, 0, 0, 0.5) 100%
    );
    }

.portfolio-item .portfolio-info h3 {
    margin      : 0;
    line-height : 1;
    color       : #ffffff;
    }

.portfolio-item .portfolio-info small {
    color : #ffffff;
    }

.portfolio-item:hover .portfolio-info {
    background : -webkit-linear-gradient(
            top,
            transparent 0%,
            #000 100%
    );
    }

/*-------------------
 * Content Item
 *-------------------*/

.content-item {
    margin-bottom : 40px;
    }

.content-item h3 {
    margin         : 0 0 10px;
    line-height    : 1;
    font-weight    : bold;
    text-transform : uppercase;
    }

.content-item h4 {
    margin      : 0;
    line-height : 1;
    }

.content-item small {
    color : #888888;
    }

/*-------------------
 * Contact
 *-------------------*/

.feedback-form {
    margin-top : 50px;
    }

/*-------------------
 * Form Style
 *-------------------*/
.form-control {
    height        : 50px;
    padding       : 0 20px;
    font-size     : 13px;
    line-height   : 50px;
    color         : #969595;
    border        : 1px solid #cccccc;
    border-radius : 0;
    box-shadow    : none;
    box-sizing    : border-box;
    }

.form-control:focus,
.form-control:active {
    box-shadow : none;
    }

/* --------------------------------------------
 *   Footer
 *---------------------------------------------- */

/* Copyright */

.footer {
    padding : 30px 50px;
    }

.footer .copyright-section {
    font-size : 13px;
    color     : #888888;

    }

.footer .copyright-section .copytext {
    font-weight : 400;
    display     : block;
    }

@media (max-width : 480px) {
    .footer {
        padding : 10px 20px;
        }
    }

    

/* ---------------------------------------------- /*
 * Preloader
/* ---------------------------------------------- */
#preloader {
    background : rgba(255, 255, 255,.8);
    bottom     : 0;
    left       : 0;
    position   : fixed;
    right      : 0;
    top        : 0;
    z-index    : 9999;
    }

#status,
.status-mes {
    background-image    : url(../img/preloader.svg);
    background-position : center;
    background-repeat   : no-repeat;
    height              : 200px;
    left                : 50%;
    margin              : -100px 0 0 -100px;
    position            : absolute;
    top                 : 50%;
    width               : 200px;
    }

.status-mes {
    background : none;
    left       : 0;
    margin     : 0;
    text-align : center;
    top        : 65%;
    }
    
    .columns-block {
    display                : -webkit-flex;
    display                : flex;
    -webkit-flex-direction : row;
    flex-direction         : row;
    margin                 : 60px auto;
    /* padding                : 0; */
    box-shadow             : 0 0 0 1px #eaeaea;
    }

.blocks {
    box-sizing : border-box;
    }

.left-col-block {
    overflow     : hidden;
    -webkit-flex : 1 0 0;
    flex         : 1 0 0;
    position     : relative;
    background   : rgba(255, 255, 255, .8);
    border-right : 1px solid #eaeaea;
    }

.right-col-block {
    -webkit-flex : 2 0 0;
    flex         : 2 0 0;
    position     : relative;
    background   : #ffffff;
    }

@media (max-width : 768px) {

    .columns-block {
        display    : block;
        margin     : 0;
        box-shadow : none;
        }

    .left-col-block {
        width    : 100%;
        position : relative;
        border   : 0;
        }

    .right-col-block {
        width      : 100%;
        position   : relative;
        box-shadow : none;
        }
    }

@media (min-width : 769px) and (max-width : 1024px) {
    .columns-block {
        margin-top    : 30px;
        margin-bottom : 30px;
        }
    }

    /*-------------------
 * Expertise
 *-------------------*/
.expertise-item {
    margin-bottom : 20px;
    }

.expertise-item h3 {
    margin-bottom : 5px;
    font-weight   : 700;
    }
    h1, h2, h3, h4, h5, h6 {
    margin : 0 0 15px;
    color  : #2b2b3d;
    }

h1 {
    font-size   : 26px;
    line-height : 1.8em;
    font-weight : 700;
    }

h2 {
    font-size   : 18px;
    line-height : 1.8em;
    font-weight : 700;
    }

h3 {
    font-size   : 16px;
    line-height : 1.8em;
    font-weight : 500;
    }

h4 {
    font-size   : 15px;
    line-height : 1.8em;
    font-weight : 500;
    }

h5 {
    font-size   : 15px;
    line-height : 1.5em;
    font-weight : 500;
    }

h6 {
    font-size   : 15px;
    line-height : 1.5em;
    }
    </style>

<div id="main-wrapper">
    
    <div class="columns-block container">
    <div class="left-col-block blocks" style="padding: 1.5%;">
        <header class="header theiaStickySidebar" >
            <div class="profile-img">
                <img src="HomeAssets/HTML/img/img-profile.jpg" class="img-responsive" alt=""/>
            </div>
            <div class="content">
                <h1>Leon Weiß</h1>
                <span class="lead">Marketing Consultant</span>
    
                <div class="about-text">
                    <p>
                        Credibly embrace visionary internal or "organic" sources and business benefits. Collaboratively
                        integrate efficient portals rather than customized customer service. Assertively deliver
                        frictionless services via leveraged interfaces. Conveniently evisculate accurate sources and
                        process-centric expertise.
                    </p>
    
                    <p>Energistically fabricate customized imperatives through cooperative catalysts for change.</p>
    
    
                    <p><img src="HomeAssets/HTML/img/Signature.png" alt="" class="img-responsive"/></p>
                </div>
    
    
                <ul class="social-icon">
                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-slack" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                </ul>
            </div>
    
        </header>
        <!-- .header-->
    </div>
    <!-- .left-col-block -->
    
    
    <div class="right-col-block blocks">
    <div class="theiaStickySidebar">
    <section class="expertise-wrapper section-wrapper gray-bg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2>Expertise</h2>
                    </div>
                </div>
            </div>
            <!-- .row -->
    
            <div class="row">
                <div class="col-md-6">
                    <div class="expertise-item">
                        <h3>Professionally drive</h3>
    
                        <p>
                            Synergistically strategize customer directed resources rather than principle.
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="expertise-item">
                        <h3>Seamlessly leverage </h3>
    
                        <p>
                            Quickly repurpose reliable customer service with orthogonal ideas. Competently.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="expertise-item">
                        <h3>Interactively incubate</h3>
    
                        <p>
                            Interactively myocardinate high standards in initiatives rather than next-generation.
                        </p>
                    </div>
                </div>
    
                <div class="col-md-6">
                    <div class="expertise-item">
                        <h3>Globally streamline</h3>
    
                        <p>
                            Dynamically initiate client-based convergence vis-a-vis performance based. </p>
                    </div>
                </div>
    
            </div>
    
    
        </div>
    </section>
    <!-- .expertise-wrapper -->
    
    <section class="section-wrapper skills-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2>Skills</h2>
                    </div>
                </div>
    
            </div>
            <div class="row">
                <div class="col-md-12">
                  
                         <h7>Marketing</h7>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" data-transitiongoal="25"></div>
                          </div>
                          <h7>Online Research</h7>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" data-transitiongoal="45"></div>
                          </div>
                          <h7>Organizational Skills</h7>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" data-transitiongoal="65"></div>
                          </div>
                          <h7>Communication Skills</h7>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" data-transitiongoal="95"></div>
                          </div>
                          <h7>Project Management</h7>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" data-transitiongoal="95"></div>
                          </div>
                      
                </div>
            </div>
            <!--.row -->
        </div>
        <!-- .container-fluid -->
    </section>
    <!-- .skills-wrapper -->
    
    <section class="section-wrapper section-experience gray-bg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title"><h2>Work Experience</h2></div>
                </div>
            </div>
            <!--.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="content-item">
                        <small>2015 - Present</small>
                        <h3>Head of market research</h3>
                        <h4>Computer & Motor Ltd.</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                    <div class="content-item">
                        <small>2012 - 2015</small>
                        <h3>Media Analyst</h3>
                        <h4>BizzNiss</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                    <div class="content-item">
                        <small>2010 - 2012</small>
                        <h3>Budget Administrator</h3>
                        <h4>Somsom LLC</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                </div>
            </div>
            <!--.row-->
        </div>
        <!-- .container-fluid -->
    
    </section>
    <!-- .section-experience -->
    
    <section class="section-wrapper section-education">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title"><h2>Education</h2></div>
                </div>
            </div>
            <!--.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="content-item">
                        <small>2010 - 2012</small>
                        <h3>MA Product Design</h3>
                        <h4>University of California</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                    <div class="content-item">
                        <small>2007 - 2010</small>
                        <h3>Business marketing course</h3>
                        <h4>Royal Academy of Business</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                    <div class="content-item">
                        <small>2002 - 2006</small>
                        <h3>BA (Hons) Design</h3>
                        <h4>University of Michigan</h4>
    
                        <p>United Kingdom, London</p>
                    </div>
                    <!-- .experience-item -->
                </div>
            </div>
            <!--.row-->
        </div>
        <!-- .container-fluid -->
    
    </section>
    <!-- .section-education -->
    
    <section class="section-wrapper section-interest gray-bg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2>Interest</h2>
                    </div>
                </div>
            </div>
            <!-- .row -->
    
            <div class="row">
                <div class="col-md-12">
                    <div class="content-item">
                        <h3>Books</h3>
    
                        <p>Proactively extend market-driven e-tailers rather than enterprise-wide supply chains.
                            Collaboratively embrace 24/7 processes rather than adaptive users. Seamlessly monetize
                            alternative e-business.</p>
                    </div>
                    <div class="content-item">
                        <h3>Sports</h3>
    
                        <p>Assertively grow optimal methodologies after viral technologies. Appropriately develop
                            frictionless technology for adaptive functionalities. Competently iterate functionalized
                            networks for best-of-breed services.</p>
    
                    </div>
                    <div class="content-item">
                        <h3>Art</h3>
    
                        <p>Dramatically utilize superior infomediaries whereas functional core competencies.
                            Enthusiastically repurpose synergistic vortals for customer directed portals. Interactively
                            pursue sustainable leadership via.</p>
                    </div>
                </div>
            </div>
            <!-- .row -->
    
        </div>
    </section>
    <!-- .section-publications -->
    
    <section class="section-wrapper portfolio-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2>Portfolio</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <a class="portfolio-item" href="#">
                        <div class="portfolio-thumb">
                            <img src="HomeAssets/HTML/img/portfolio-1.jpg" alt="">
                        </div>
    
                        <div class="portfolio-info">
                            <h3>Creative concepts</h3>
                            <small>domain.com</small>
                        </div>
                        <!-- portfolio-info -->
                    </a>
                    <!-- .portfolio-item -->
                </div>
                <div class="col-md-6">
                    <a class="portfolio-item" href="#">
                        <div class="portfolio-thumb">
                            <img src="HomeAssets/HTML/img/portfolio-2.jpg" alt="">
                        </div>
    
                        <div class="portfolio-info">
                            <h3>Customer focused</h3>
                            <small>domain.com</small>
                        </div>
                        <!-- portfolio-info -->
                    </a>
                    <!-- .portfolio-item -->
                </div>
                <div class="col-md-6">
                    <a class="portfolio-item" href="#">
                        <div class="portfolio-thumb">
                            <img src="HomeAssets/HTML/img/portfolio-3.jpg" alt="">
                        </div>
    
                        <div class="portfolio-info">
                            <h3>Management methodology</h3>
                            <small>domain.com</small>
                        </div>
                        <!-- portfolio-info -->
                    </a>
                    <!-- .portfolio-item -->
                </div>
                <div class="col-md-6">
                    <a class="portfolio-item" href="#">
                        <div class="portfolio-thumb">
                            <img src="HomeAssets/HTML/img/portfolio-4.jpg" alt="">
                        </div>
    
                        <div class="portfolio-info">
                            <h3>Market research</h3>
                            <small>domain.com</small>
                        </div>
                        <!-- portfolio-info -->
                    </a>
                    <!-- .portfolio-item -->
                </div>
    
            </div>
            <!-- /.row -->
        </div>
    </section>
    <!-- .portfolio -->
    
    <section class="section-contact section-wrapper gray-bg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2>Contact</h2>
                    </div>
                </div>
            </div>
            <!--.row-->
            <div class="row">
                <div class="col-md-12">
                    <address>
                        <strong>Address</strong><br>
                        1355 Market Street, Suite 900<br>
                        San Francisco, CA 94103
    
                    </address>
                    <address>
                        <strong>Phone Number</strong><br>
                        +61 3 8376 6284
                    </address>
    
                    <address>
                        <strong>Mobile Number</strong><br>
                        987 654 321
                    </address>
    
    
                    <address>
                        <strong>Email</strong><br>
                        <a href="mailto:#">coffee@amelie.me</a>
                    </address>
                </div>
            </div>
            <!--.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="feedback-form">
                        <h2>Get in touch</h2>
    
                        <form id="contactForm" action="sendemail.php" method="POST">
                            <div class="form-group">
                                <label for="InputName">Name</label>
                                <input type="text" name="name" required="" class="form-control" id="InputName"
                                       placeholder="Full Name">
                            </div>
                            <div class="form-group">
                                <label for="InputEmail">Email address</label>
                                <input type="email" name="email" required="" class="form-control" id="InputEmail"
                                       placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="InputSubject">Subject</label>
                                <input type="text" name="subject" class="form-control" id="InputSubject"
                                       placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Message</label>
                                <textarea class="form-control" rows="4" required="" name="message" id="message-text"
                                          placeholder="Write message"></textarea>
                            </div>
    
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <!-- .feedback-form -->
    
    
                </div>
            </div>
        </div>
        <!--.container-fluid-->
    </section>
    <!--.section-contact-->
    
    <!-- .footer -->
    </div>
    <!-- Sticky -->
    </div>
    <!-- .right-col-block -->
    </div>
    <!-- .columns-block -->
    </div>
    <!-- #main-wrapper -->
                </div>
          </div>
        </div>
        </div>
      </div> 
    
        <!-- /page content -->
        
        <!-- footer content -->
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
    <!-- ECharts -->
    <script src="HomeAssets/vendors/echarts/dist/echarts.min.js"></script>
     <!-- bootstrap-progressbar -->
     <script src="HomeAssets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="HomeAssets/build/js/custom.min.js"></script>
    <script src="HomeAssets/HTML/js/theia-sticky-sidebar.js"></script>
    <script src="HomeAssets/HTML/js/scripts.js"></script>
	
  </body>
</html>