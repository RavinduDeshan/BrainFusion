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

    <!-- Custom Theme Style -->
    <link href="HomeAssets/build/css/custom.min.css" rel="stylesheet">
  </head>
  <nav class="navbar1 navbar1-expand-lg navbar1-dark ftco_navbar1 bg-dark ftco-navbar1-light" id="ftco-navbar1">
	    <div class="container-fluid px-md-4	">
          <link rel="stylesheet" href="css/mnk.css">
          
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
                  <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Home <!--span class="fa fa-chevron-down"></span--></a>
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
                <h3>Jobs <small>Listing</small></h3>
              </div>
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Oppurtunities</h2>
                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    

                    <!-- start project list -->
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 1%"></th>
                          <th style="width: 20%">Project Name</th>
                          <!-- <th style="width: 20%"></th> -->
                          <th>Number of Applications</th>
                          <th>Job Availability</th>
                          <th style="width: 20%">Your Participation</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td> </td>
                          <td>
                            <a>Front end developer</a>
                            <br />
                            <small>WSO2</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                            </div>
                            <small>57 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-success btn-xs"><i class="fa fa-bug"></i> Apply </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>QA Engineer</a>
                            <br />
                            <small>99X Technologies</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="47"></div>
                            </div>
                            <small>47 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Business Analyst</a>
                            <br />
                            <small>LSEG technologies</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="77"></div>
                            </div>
                            <small>77 Have Apllied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-danger btn-xs">Closed</button>
                          </td>
                          <td>
                           
                            <a href="#" class="btn btn-danger btn-xs"></i> Not Applied </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Data Analyst</a>
                            <br />
                            <small>Dialog Axiata</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                            </div>
                            <small>60 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>UI/UX design</a>
                            <br />
                            <small>CodeGen</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="12"></div>
                            </div>
                            <small>12 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-danger btn-xs">Closed</button>
                          </td>
                          <td>
                            
                            
                            <a href="#" class="btn btn-danger btn-xs"></i> Not Applied </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Full Stack Developer</a>
                            <br />
                            <small>99X Technologies</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="35"></div>
                            </div>
                            <small>35 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Graphic Designer</a>
                            <br />
                            <small>Dialog Axiata</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="87"></div>
                            </div>
                            <small>87 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-danger btn-xs">Closed</button>
                          </td>
                          <td>
                            
                            
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Network Architect</a>
                            <br />
                            <small>LSEG Technologies</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="77"></div>
                            </div>
                            <small>77 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-success btn-xs"></i> Apply </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td>
                            <a>Penetration tester</a>
                            <br />
                            <small>Dialog Axiata</small>
                          </td>
                          <!-- <td>
                            <ul class="list-inline">
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="HomeAssets/images/user.png" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td> -->
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="17"></div>
                            </div>
                            <small>17 Have applied</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Open</button>
                          </td>
                          <td>
                            
                            <a href="#" class="btn btn-success btn-xs"></i> Apply </a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
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
    <!-- bootstrap-progressbar -->
    <script src="HomeAssets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="HomeAssets/build/js/custom.min.js"></script>
  </body>
</html>