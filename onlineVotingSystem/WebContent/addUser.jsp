
<%@page import="com.onvs.service.ElectionService"%>
<%@ page import="com.onvs.util.DBConnection"%>
<%@ page import ="java.sql.Connection"%>
    
<%@ page import ="java.sql.ResultSet"%>
    
<%@ page import ="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
     
   
  
   <% 
   
   Connection con;
   con= DBConnection.getConnection();
   
   
   %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

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
                        <p>Sign Up<br><br>
                        </p>
                        <br>
                        
                    </div>
                </div>
                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form" action="AddUserServlet">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="first_name" class="required">Full name</label>
                                    <input type="text" name="full_name" id="first_name" />
                                </div>
                                <div class="form-input">
                                    <label for="last_name" class="required">Name with Initials</label>
                                    <input type="text" name="initial_name" id="last_name" />
                                </div>
                                <div class="form-input">
                                    <label for="last_name" class="required">NIC Number</label>
                                    <input type="text" name="nic" id="last_name" />
                                </div>
                                <div class="form-input">
                                    <label for="company" class="required">Password</label>
                                    <input type="text" name="password" id="password" />
                                </div>
                                
                                <div class="form-input">
                                    <label for="company" class="required">Confirm Password</label>
                                    <input type="text" name="conpassword" id="conpassword" />
                                </div>
                                
                               
                                
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="email" name="email" id="email" />
                                </div>
                                <div class="form-input">
                                    <label for="phone_number" class="required">Phone number</label>
                                    <input type="text" name="phone_number" id="phone_number" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-select">
                                
                                 <div class="form-input">
                                    <label for="company" class="required">Personal Address</label>
                                    <input type="text" name="address" id="address" />
                                </div>
                                
                                <div class="form-input">
                                    <label for="company" class="required">School</label>
                                    <input type="text" name="school" id="school" />
                                </div>
                                 <div class="form-input">
                                    <label for="company" class="required">University</label>
                                    <input type="text" name="uni" id="uni" />
                                </div>
                                
                                <div class="form-input">
                                    <label for="company" class="required">Short Description About You </label>
                                    <input type="text" name="note" id="note" />
                                </div>
                                    <%-- <div class="label-flex">
                                        <label for="meal_preference">Election</label>
                                        
                                      
                                       
                                    </div>
                                     <div class="select-list1">
                                        <select name="election"  class="select-css">
                                        <%
                                        
                                        
                                        	String query1 = "select * from Election";
                                        	Statement st1 = con.createStatement();
                                        	ResultSet rs1 = st1.executeQuery(query1);
                                        	
                                        	
                                        while (rs1.next()){
                                        	%>
                                        	
                                        	 <option value="<%=rs1.getString("electId")%>"><%=rs1.getString("electName")%></option>
                                             
                                    
                                      <%  } %>
                                       
                                         
                                            
                                        </select> 
                                    </div>--%> 
                                    
                                
                               </div>

                                <div class="form-select">
                                   <%-- <div class="label-flex">
                                        <label for="meal_preference">Party</label>
                                       
                                    </div>
                                      <div class="select-list2">
                                        <select name="party"  class="select-css">
                                          <%
                                        
                                        
                                        	String query2 = "select * from Party";
                                        	Statement st2 = con.createStatement();
                                        	ResultSet rs2 = st2.executeQuery(query2);
                                        	
                                        	
                                        while (rs2.next()){
                                        	%>
                                        	
                                        	 <option value="<%=rs2.getString("pId")%>"><%=rs2.getString("name")%></option>
                                             
                                    
                                      <%  } %> 
                                            
                                        </select>
                                    </div> --%>  
                                    
                                </div>

                                
                               
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="payment">Gender</label>
                                       
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
                                         <!--
                                        <div class="form-radio-item">
                                            <input type="radio" name="payment" id="demand">
                                            <label for="demand">Demand Draf</label>
                                            <span class="check"></span>
                                        </div>
                                         -->
                                    </div>
                                </div>
                               
                              
                               <!--
                                <div class="form-input">
                                    <label for="blank_name">Drawn on ( Bank Name)</label>
                                    <input type="text" name="blank_name" id="blank_name" />
                                </div>
                                <div class="form-input">
                                    <label for="payable">Payable at</label>
                                    <input type="text" name="payable" id="payable" />
                                </div>
                            </div>
                        </div>
                        
                        
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