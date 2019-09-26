
<%@page import="com.onvs.service.impl.JobHostServiceImpl"%>
<%@page import="com.onvs.model.JobHost"%>

<%@ page import="com.onvs.util.DBConnection"%>
<%@ page import ="java.sql.Connection"%>
    
<%@ page import ="java.sql.ResultSet"%>
    
<%@ page import ="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
     
   
  
   <% 
   
   Connection con;
   con= DBConnection.getConnection();
   String email=(String) session.getAttribute( "Admin" );
   
   JobHostServiceImpl canserv1=new JobHostServiceImpl();
   
   JobHost can = canserv1.getJobHostDetails(email);
   
   
   %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post Job</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="C/vendor/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/cstyle.css">
    
    <style>
    
  .redbtn {
 background-color: #FF0000;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.5;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.redbtn:hover {opacity: 1}


.select-css {
    display: block;
    font-size: 16px;
    font-family: sans-serif;
    font-weight: 700;
    color: #444;
    line-height: 1.3;
    padding: .6em 1.4em .5em .8em;
    width: 100%;
    max-width: 100%; 
    box-sizing: border-box;
    margin: 0;
    border: 1px solid #aaa;
    box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
    border-radius: .5em;
    -moz-appearance: none;
    -webkit-appearance: none;
    appearance: none;
    background-color: #fff;
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
      linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
    background-repeat: no-repeat, repeat;
    background-position: right .7em top 50%, 0 0;
    background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
    display: none;
}
.select-css:hover {
    border-color: #888;
}
.select-css:focus {
    border-color: #aaa;
    box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
    box-shadow: 0 0 0 3px -moz-mac-focusring;
    color: #222; 
    outline: none;
}
.select-css option {
    font-weight:normal;
}




        .button-success,
        .button-error,
        .button-warning,
        .button-secondary {
            color: white;
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }

        .button-success {
            background: rgb(28, 184, 65); /* this is a green */
        }

        .button-error {
            background: rgb(202, 60, 60); /* this is a maroon */
        }

        .button-warning {
            background: rgb(223, 117, 20); /* this is an orange */
        }
.button-secondary {
            background: rgb(66, 184, 221); /* this is a light blue */
        }



</style>
    
</head>
<body>

    <div class="main">

        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="images/form-img.jpg" alt="register image">
                    <div class="signup-img-content">
                        <h2>Career Master </h2>
                        <p>Post Job<br><br>
                        </p>
                        <a  class="button-warning pure-button" href="JobHostDashBoard.jsp">Go Back To Dashboard</a>
                        <br>
                        
                    </div>
                </div>
                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form" action="AddJobServlet">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="first_name" class="required">Job Title</label>
                                    <input type="text" name="title" id="cname" />
                                </div>
                                
                                <div class="form-input">
                                    <label for="first_name" class="required">Job Code</label>
                                    <input type="text" name="code" id="cname" />
                                </div>
                               
                                
                                                                
                                <div class="form-input">
                                    <label for="email" class="required">Contact Email</label>
                                    <input type="text" name="email" id="email" />
                                </div>
                                <div class="form-input">
                                    <label for="phone_number" class="required">Phone number</label>
                                    <input type="text" name="phone_number" id="phone_number" />
                                </div>
                                <div class="form-input">
                                    <label for="company" >WebSite Link</label>
                                    <input type="text" name="web" id="web" />
                                </div>
                                
                               
                                  <div class="label-flex">
                                        <label for="meal_preference">Job Type</label>
                                        
                                      
                                       
                                    </div>
                                    <div class="select-list1">
                                        <select name="jobType"  class="select-css">
                                     
                                        	 <option value="Full Time">Full Time</option>
                                        	 <option value="Part Time">Part Time</option>
                                        	 <option value="Freelance">Freelance</option>
                                        	 <option value="Internship">Internship</option>
                                        	  <option value="Termporary">Termporary</option>
       
                                       
                                            
                                        </select>
                                    </div> 
                                <br>
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="payment">Gender Requirement</label>
                                       
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="cash" checked value="Male">
                                            <label for="cash">Male</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="cheque" value="Female">
                                            <label for="cheque">Female</label>
                                            <span class="check"></span>
                                        </div>
                                        
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="demand" value="both">
                                            <label for="demand">Both</label>
                                            <span class="check"></span>
                                        </div>
                                        
                                    </div>
                                </div>
                                
                            </div>
                             <div class="form-group">
                                <div class="form-select">
                                
                                
                                
                                
                               
                                
                                <div class="form-input">
                                    <label for="company" class="required">Description About The Job</label>
                                     <textarea name="note" class="form-control" id="exampleFormControlTextarea1" rows="20" cols="52"></textarea>
                                </div>
                                
                   
                                
                                Click <a href="updateJobHost.jsp">here</a> to Edit Company Details.(This Entry May not Entered)
                                
                                <
                                
                               
                                   <div class="form-input">
                                    <label for="email" class="required" >Company Name</label>
                                    <input type="text" readonly name="cname" id="email" value="<%=can.getCompanyName() %>"/>
                                    <input type="hidden" name="cemail" value="<%=email%>">
                                </div>
                                
                                 <div class="form-input">
                                    <label for="company" class="required" >Company Description</label>
                                     <textarea readonly name="cnote" class="form-control" id="exampleFormControlTextarea1" rows="10" cols="52"><%=can.getNote() %></textarea>
                                </div>
                      
                                
                               </div>

                               

                                
                              
                                
                               
                              
                            
                            </div>
                        </div>
                        
                       <!-- 
                        <div class="donate-us">
                            <label>Donate us</label>
                            <div class="price_slider ui-slider ui-slider-horizontal">
                                <div id="slider-margin"></div>
                                <span class="donate-value" id="value-lower"></span>
                            </div>
                        </div>
                        -->
                        <div class="form-submit">
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
                        </div>
                        
                        <a class="navbar-brand" href="index.jsp"><b>Go back to Home</b> </a>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="C/vendor/jquery/jquery.min.js"></script>
    <script src="C/vendor/nouislider/nouislider.min.js"></script>
    <script src="C/vendor/wnumb/wNumb.js"></script>
    <script src="C/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="C/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="js/cmain.js"></script>
    
    <script>
    
    var password = document.getElementById("password")
    , confirm_password = document.getElementById("conpassword");

  function validatePassword(){
    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
      confirm_password.setCustomValidity('');
    }
  }

  password.onchange = validatePassword;
  confirm_password.onkeyup = validatePassword;
    
    
    </script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>