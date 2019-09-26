<%@page import="com.onvs.servlet.EditUserServlet"%>


<%@ page import="com.onvs.util.DBConnection"%>
<%@ page import ="java.sql.Connection"%>
    
<%@ page import ="java.sql.ResultSet"%>
    
<%@ page import ="java.sql.Statement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>User Department| Admin Panel</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="A/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="A/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="A/css/style.min.css" rel="stylesheet">
  <style>


    .map-container{
overflow:hidden;
padding-bottom:56.25%;
position:relative;
height:0;
}
.map-container iframe{
left:0;
top:0;
height:100%;
width:100%;
position:absolute;
}

.Admintext{

padding:15% 0%;

}

.container-fluid{

padding:-55% 0%;

}

.btn-danger{
 padding: 10px 28px;
    font-size: 12px;
    border-radius: 10px;
    width:95%;
}

.btn-primary{
 padding: 10px 20px;
    font-size: 12px;
    border-radius: 10px;
    width:-60%;
    
}










.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
  font-size: 1em;
  padding: 10px;
  color: #fff;
  border: 2px solid #06D85F;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: #06D85F;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}


  </style>
</head>

<body class="grey lighten-3">



  <!--Main Navigation-->
  <header>

  
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">
      <div class="Admintext">
      <a >
        <h2><b>ADMIN PANEL</b></h2><br>
        <div class="subAdmintext">
          <h5>User Department</h5></div>
      </a>
    </div>
      <div class="list-group list-group-flush">
        <a href="AdminUser.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
        <a href="addUser.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-user mr-3"></i>Add Users</a>
        <a href="index.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-user mr-3"></i>Log Out</a>
        
      </div>

    </div>
    <!-- Sidebar -->

  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
      <div aria-placeholder="center"><h1><b>National Online Polling System</b></div>
      <!-- Heading -->
      <div class="card mb-4 wow fadeIn">

        <!--Card content-->
        <div class="card-body d-sm-flex justify-content-between">

          <h4 class="mb-2 mb-sm-0 pt-1">
           <b> User Manager </b>
            <span> </span>
            <span> </span>
          </h4>

          <form class="d-flex justify-content-center" method="get">
            <!-- Default input -->
            <input type="search" placeholder="Type your query" aria-label="Search" class="form-control" name="scontent">
            <button class="btn btn-primary btn-sm my-0 p" type="submit">
              <i class="fas fa-search"></i>
            </button>

          </form>

        </div>

      </div>






     <div class="SearchTable">
      <table class="table table-hover">
        <!-- Table head -->
        <thead class="blue-grey lighten-4">
          <tr>
            <th>User NIC</th>
            <th>User Name</th>
            <th>School</th>
            <th>Uni</th>
            <th>Action</th>
            
          </tr>
      </thead>
      <tbody>
      
       <%  Connection cons;
			cons= DBConnection.getConnection();
			String sqls="select NIC,i_name,School,Uni from User";
			Statement states= cons.createStatement();
			ResultSet results= states.executeQuery(sqls); %> 
			
			<%String scontent=request.getParameter("scontent");
			
			if(scontent==null){
			%>
				<% while (results.next()){ %>
			
			<tr>
				<td>
					<%=results.getString("NIC") %>
				</td>
				
				<td>
					<%=results.getString("i_name") %>
				</td>
				
				<td>
					<%=results.getString("School") %>
				</td>
				
				<td>
					<%=results.getString("Uni") %>
				</td>
				
				<td>
				
					<form action="SearchUserServlet" method="Post">
					
					<input type="hidden" name="editid" value="<%=results.getString("NIC") %>">
					
					 <!--  <a class="btn btn-primary" href="#popup1">More | Edit</a> -->
					<input type="submit" class="btn btn-primary" value="More | Edit">
					
					</form>
					
					<form action="DeleteUserServlet" method="post">
					
					<input type="hidden" name="deleteid" value="<%=results.getString("NIC") %>">
					<input type="submit" class="btn btn-danger" value="Remove">
					
					</form>
					
					</form>
				</td>	
			
			</tr>
      
      <%}}
      
      
      else{
    	  
    	  
    	  if(scontent!=null){
    	  
    		  sqls="select * from User where f_name like '%"+scontent+"%' or NIC like '%"+scontent+"%' or School like '%"+scontent+"%' or Uni like '%"+scontent+"%'" ;
    	  
    	  }
    	  else{
    		  
    		  sqls="select NIC,i_name,School,Uni from User";
    	  }
    	  
    	  results= states.executeQuery(sqls);
    	  
    	  while (results.next()){%>
    	  
    	  <tr>
				<td>
					<%=results.getString("NIC") %>
				</td>
				
				<td>
					<%=results.getString("i_name") %>
				</td>
				
				<td>
					<%=results.getString("School") %>
				</td>
				
				<td>
					<%=results.getString("Uni") %>
				</td>
				
				<td>
					<form action="SearchUserServlet" method="Post">
					
					<input type="hidden" name="editid" value="<%=results.getString("NIC") %>">
					
					<!-- <a class="btn btn-primary" href="#popup1">More | Edit</a> -->
					<input type="submit" class="btn btn-primary" value="More | Edit">
					</form>
					
					<form action="DeleteUserServlet" method="post">
					
					<input type="hidden" name="deleteid" value="<%=results.getString("NIC") %>">
					<input type="submit" class="btn btn-danger" value="Remove">
					
					</form>
					
				</td>	
			
			</tr>
    	  
     		<%}
     
    	  
    }%>
			
				
				
				
	
      </tbody>
      
      </table>
     </div>




<%-- 

      <!--Grid row-->

      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <div class="card-body">

              <!-- Table  -->
              <table class="table table-hover">
                <!-- Table head -->
                <thead class="blue-grey lighten-4">
                  <tr>
                    
                    <th>Uni</th>
                    <th>Uni Id</th>
                    <th>No of Users</th>
                  </tr>
                </thead>
                
                <tbody>
             <%  Connection con;
			con= DBConnection.getConnection();
			String sql="select p.pId, p.name,count(c.NIC) from Uni p, User c where c.Uni=p.pId  group by pId";
			Statement state= con.createStatement();
			ResultSet result= state.executeQuery(sql); %> 
			
			<% while (result.next()){ %>
                                        	
            
                                             
                  <tr>
                    
                    <td><%=result.getString("name")%></td>
                    <td><%=result.getString("pId")%></td>
                    <td><%=result.getString("count(c.NIC)")%></td>
                    
                  </tr>
                                    
                                      <%  } %>
                
               
                 
                </tbody>
                <!-- Table body -->
              </table>
              <!-- Table  -->

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <div class="card-body">

              <!-- Table  -->
              <table class="table table-hover">
                <!-- Table head -->
                <thead class="blue lighten-4">
                  <tr>
                    
                    <th>School</th>
                    <th>School Id</th>
                    <th>No of Users</th>
                  </tr>
                </thead>
                <!-- Table head -->

                <!-- Table body -->
                <tbody>
                  <%  Connection con2;
			con2= DBConnection.getConnection();
			String sql2="select e.electId, e.electName,count(c.NIC) from School e, User c where c.School=e.electId  group by electId";
			Statement state2= con2.createStatement();
			ResultSet result2= state2.executeQuery(sql2); %> 
			
			<% while (result2.next()){ %>
                                        	
            
                                             
                  <tr>
                    
                    <td><%=result2.getString("electName")%></td>
                    <td><%=result2.getString("electId")%></td>
                    <td><%=result2.getString("count(c.NIC)")%></td>
                    
                  </tr>
                                    
                                      <%} %>
                </tbody>
                <!-- Table body -->
              </table>
              <!-- Table  -->

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->

      --%>

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!--Section: Modals-->
            <section>

              <!-- Frame Modal Top Info-->
              <div class="modal fade top" id="frameModalTopInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Body-->
                    <div class="modal-body">
                      <div class="row d-flex justify-content-center align-items-center">

                        <p class="pt-3 pr-2">Lorem ipsum dolor sit amet, consectetur
                          adipisicing elit. Impedit nisi quo
                          provident fugiat reprehenderit nostrum quos..</p>

                        <a role="button" class="btn btn-info">Get it now
                          <i class="far fa-gem ml-1"></i>
                        </a>
                        <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                          thanks</a>
                      </div>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Frame Modal Bottom Success-->

              <!-- Frame Modal Bottom Success-->
              <div class="modal fade bottom" id="frameModalBottomSuccessDemo" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-frame modal-bottom modal-notify modal-success" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Body-->
                    <div class="modal-body">
                      <div class="row d-flex justify-content-center align-items-center">

                        <p class="pt-3 pr-2">Lorem ipsum dolor sit amet, consectetur
                          adipisicing elit. Impedit nisi quo
                          provident fugiat reprehenderit nostrum quos..</p>

                        <a role="button" class="btn btn-success">Get it now
                          <i class="far fa-gem ml-1"></i>
                        </a>
                        <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No, thanks</a>
                      </div>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Frame Modal Bottom Success-->

              <!-- Side Modal Top Right Success-->
              <div class="modal fade right" id="sideModalTRSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Success</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                          iusto nulla
                          aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                          eius
                          non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                        </p>
                      </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-success">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Side Modal Top Right Success-->

              <!-- Side Modal Top Left Info-->
              <div class="modal fade left" id="sideModalTLInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-side modal-top-left modal-notify modal-info" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Info</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                      <img src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg" alt="Material Design for Bootstrap - dashboard"
                        class="img-fluid">

                      <div class="text-center">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt
                          vero illo
                          error eveniet cum.
                        </p>
                      </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-info">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Side Modal Top Left Info-->

              <!-- Side Modal Bottom Right Danger-->
              <div class="modal fade right" id="sideModalBRDangerDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-danger" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading">Modal Danger</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                      <div class="row">
                        <div class="col-3">
                          <p></p>
                          <p class="text-center">
                            <i class="fas fa-shopping-cart fa-4x"></i>
                          </p>
                        </div>

                        <div class="col-9">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
                            molestiae
                            provident temporibus sunt earum.</p>
                          <h2>
                            <span class="badge">v52gs1</span>
                          </h2>
                        </div>
                      </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-danger">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Side Modal Bottom Right Danger-->

              <!-- Side Modal Bottom Left Warning-->
              <div class="modal fade left" id="sideModalBLWarningDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-side modal-bottom-left modal-notify modal-warning" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading">Modal Warning</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                      <div class="row">
                        <div class="col-3 text-center">
                          <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(1).jpg" alt="Michal Szymanski - founder of Material Design for Bootstrap"
                            class="img-fluid z-depth-1-half rounded-circle">
                          <div style="height: 10px"></div>
                          <p class="title mb-0">Jane</p>
                          <p class="text-muted " style="font-size: 13px">Consultant</p>
                        </div>

                        <div class="col-9">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
                            molestiae
                            provident temporibus sunt earum.</p>
                          <p class="card-text">
                            <strong>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit.</strong>
                          </p>
                        </div>
                      </div>


                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-warning">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Side Modal Bottom Left Warning-->

              <!--Modal Form Login with Avatar Demo-->
              <div class="modal fade" id="modalLoginAvatarDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
                  <!--Content-->
                  <div class="modal-content">

                    <!--Header-->
                    <div class="modal-header">
                      <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" class="rounded-circle img-responsive"
                        alt="Avatar photo">
                    </div>
                    <!--Body-->
                    <div class="modal-body text-center mb-1">

                      <h5 class="mt-1 mb-2">Maria Doe</h5>

                      <div class="md-form ml-0 mr-0">
                        <input type="password" type="text" id="form1" class="form-control ml-0">
                        <label for="form1" class="ml-0">Enter password</label>
                      </div>

                      <div class="text-center mt-4">
                        <button class="btn btn-cyan">Login
                          <i class="fas fa-sign-in-alt ml-1"></i>
                        </button>
                      </div>
                    </div>

                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!--Modal Form Login with Avatar Demo-->

              <!--Modal: Login / Register Form Demo-->
              <div class="modal fade" id="modalLRFormDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      ...
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--Modal: Login / Register Form Demo-->

              <!-- Central Modal Large Info-->
              <div class="modal fade" id="centralModalLGInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg modal-notify modal-info" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Info</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                          iusto nulla
                          aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                          eius
                          non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                        </p>
                      </div>
                      <img src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg" alt="Material Design for Bootstrap - dashboard"
                        class="img-fluid">

                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                      <a role="button" class="btn btn-info">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Central Modal Large Info-->

              <!-- Central Modal Fluid Success-->
              <div class="modal fade" id="centralModalFluidSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-fluid modal-notify modal-success" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Success</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                          iusto nulla
                          aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                          eius
                          non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                        </p>
                      </div>
                      <ul class="list-group z-depth-0">
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                      </ul>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                      <a role="button" class="btn btn-success">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Central Modal Fluid Success-->

              <!-- Full Height Modal Right Success Demo-->
              <div class="modal fade right" id="fluidModalRightSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-full-height modal-right modal-notify modal-success" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Success</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                          iusto nulla
                          aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                          eius
                          non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                        </p>
                      </div>
                      <ul class="list-group z-depth-0">
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                      </ul>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-success">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Full Height Modal Right Success Demo-->

              <!-- Full Height Modal Left Info Demo-->
              <div class="modal fade left" id="fluidModalLeftInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-full-height modal-left modal-notify modal-info" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Success</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                          iusto nulla
                          aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                          eius
                          non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                        </p>
                      </div>
                      <ul class="list-group z-depth-0">
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                      </ul>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                      <a role="button" class="btn btn-info">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Full Height Modal Right Info Demo-->

              <!-- Full Height Modal Top Warning Demo-->
              <div class="modal fade top" id="fluidModalTopWarningDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-full-height modal-top modal-notify modal-warning" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Warning</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                      </div>
                      <ul class="list-group z-depth-0">
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                      </ul>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                      <a role="button" class="btn btn-warning">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Full Height Modal Top Warning Demo-->

              <!-- Full Height Modal Bottom Danger Demo-->
              <div class="modal fade bottom" id="fluidModalBottomDangerDemo" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
                <div class="modal-dialog modal-full-height modal-bottom modal-notify modal-danger" role="document">
                  <!--Content-->
                  <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                      <p class="heading lead">Modal Danger</p>

                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                      </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                      <div class="text-center">
                        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                      </div>
                      <ul class="list-group z-depth-0">
                        <li class="list-group-item justify-content-between">
                          Cras justo odio
                          <span class="badge badge-primary badge-pill">14</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Dapibus ac facilisis in
                          <span class="badge badge-primary badge-pill">2</span>
                        </li>
                        <li class="list-group-item justify-content-between">
                          Morbi leo risus
                          <span class="badge badge-primary badge-pill">1</span>
                        </li>
                      </ul>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer">
                      <a role="button" class="btn btn-danger">Get it now
                        <i class="far fa-gem ml-1"></i>
                      </a>
                      <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No,
                        thanks</a>
                    </div>
                  </div>
                  <!--/.Content-->
                </div>
              </div>
              <!-- Full Height Modal Bottom Danger Demo-->

            </section>
            <!--Section: Modals-->

            

              

              
              </div>
              <!-- /.First row-->

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->

    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  <footer class="page-footer text-center font-small primary-color-dark darken-2 mt-4 wow fadeIn">

    
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2019 Copyright:
      <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> SLIIT </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="A/js/jquery-3.4.0.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="A/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="A/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="A/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();

  </script>

  <!-- Charts -->
  <script>
    // Line
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });

    //pie
    var ctxP = document.getElementById("pieChart").getContext('2d');
    var myPieChart = new Chart(ctxP, {
      type: 'pie',
      data: {
        labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
        datasets: [{
          data: [300, 50, 100, 40, 120],
          backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
          hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
        }]
      },
      options: {
        responsive: true,
        legend: false
      }
    });


    //line
    var ctxL = document.getElementById("lineChart").getContext('2d');
    var myLineChart = new Chart(ctxL, {
      type: 'line',
      data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "My First dataset",
            backgroundColor: [
              'rgba(105, 0, 132, .2)',
            ],
            borderColor: [
              'rgba(200, 99, 132, .7)',
            ],
            borderWidth: 2,
            data: [65, 59, 80, 81, 56, 55, 40]
          },
          {
            label: "My Second dataset",
            backgroundColor: [
              'rgba(0, 137, 132, .2)',
            ],
            borderColor: [
              'rgba(0, 10, 130, .7)',
            ],
            data: [28, 48, 40, 19, 86, 27, 90]
          }
        ]
      },
      options: {
        responsive: true
      }
    });


    //radar
    var ctxR = document.getElementById("radarChart").getContext('2d');
    var myRadarChart = new Chart(ctxR, {
      type: 'radar',
      data: {
        labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
        datasets: [{
          label: "My First dataset",
          data: [65, 59, 90, 81, 56, 55, 40],
          backgroundColor: [
            'rgba(105, 0, 132, .2)',
          ],
          borderColor: [
            'rgba(200, 99, 132, .7)',
          ],
          borderWidth: 2
        }, {
          label: "My Second dataset",
          data: [28, 48, 40, 19, 96, 27, 100],
          backgroundColor: [
            'rgba(0, 250, 220, .2)',
          ],
          borderColor: [
            'rgba(0, 213, 132, .7)',
          ],
          borderWidth: 2
        }]
      },
      options: {
        responsive: true
      }
    });

    //doughnut
    var ctxD = document.getElementById("doughnutChart").getContext('2d');
    var myLineChart = new Chart(ctxD, {
      type: 'doughnut',
      data: {
        labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
        datasets: [{
          data: [300, 50, 100, 40, 120],
          backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
          hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
        }]
      },
      options: {
        responsive: true
      }
    });

  </script>

  <!--Google Maps-->
  <script src="https://maps.google.com/maps/api/js"></script>
  <script>
    // Regular map
    function regular_map() {
      var var_location = new google.maps.LatLng(40.725118, -73.997699);

      var var_mapoptions = {
        center: var_location,
        zoom: 14
      };

      var var_map = new google.maps.Map(document.getElementById("map-container"),
        var_mapoptions);

      var var_marker = new google.maps.Marker({
        position: var_location,
        map: var_map,
        title: "New York"
      });
    }

    new Chart(document.getElementById("horizontalBar"), {
      "type": "horizontalBar",
      "data": {
        "labels": ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey"],
        "datasets": [{
          "label": "My First Dataset",
          "data": [22, 33, 55, 12, 86, 23, 14],
          "fill": false,
          "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
            "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
            "rgba(54, 162, 235, 0.2)",
            "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
          ],
          "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
            "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)",
            "rgb(201, 203, 207)"
          ],
          "borderWidth": 1
        }]
      },
      "options": {
        "scales": {
          "xAxes": [{
            "ticks": {
              "beginAtZero": true
            }
          }]
        }
      }
    });

  </script>
  
  
  
  <!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Modal Header</h2>
    </div>
    <div class="modal-body">
      <p>Some text in the Modal Body</p>
      <p>Some other text...</p>
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
  
  
  

  
</body>

</html>
