<%-- 
    Document   : updateVoters
    Created on : 19-May-2019, 00:17:50
    Author     : Prasad

<form action="UpdateServlet" method="POST">
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Voters Update Details</title>

    <link rel="icon" href="Add_Voters/images/Sign_Up.png" type="image/png">
    <!-- Font Icon -->
    <link rel="stylesheet" href="Add_Voters/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="Add_Voters/css/style_1.css">
    </head>
    <body>
       <div class="main">

       <div class="container">
            <form action="UpdateServlet" method="POST" class="appointment-form">
                <h2>Voters Update Details</h2>
                  <div class="form-group-1">
                       
                       <input type="text" name="votersNIC" id="votersNIC" placeholder="Voters NIC" maxlength="10" minlength="10" required />
                       <div class="container3" id="nicWarn" >
                       <p id="numWarn" style="color: red; display: none;">NIC must be in the format of 9 digits and a letter "V"/"X" last</p>
                         <p id="letWarn" style="color: red; display: none;">Last letter "X" means, you can not vote in Sri Lanka. So you can not proceed further</p>
                        </div>
                       <input type="text" name="votersFName" placeholder="Voters First  Name" required />
                       <input type="text" name="votersLName" placeholder="Voters Last Name" required />
                       <select name="votersSex">                            
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Gender" selected>Gender</option>
                        </select>
                       <select name="votersCivil_Status">                            
                            <option value="Unmarried">Unmarried</option>
                            <option value="Married">Married</option>
                            <option value="Voters Civil Status" selected>Voters Civil Status</option>
                        </select>                   
                       <input type="text" name="votersOccupation" placeholder="Voters Occupation" required />
                       <input type="date" name="votersBday" placeholder="Voters Date of Birth" required />
                                
               
                        <div class="form-submit">
                            <input  class="submit" type="reset" value="Rest Details">
                            &nbsp;&nbsp;<input  type="submit"  value="Update Details" name="submit" id="submit" class="submit" />
                            <a href="overview.jsp"><input class="submit" type="button" value="Back to Overview"></a></td>
                        </div>
                       
                </form>
        </div>

    </div>
           
            <script>
            var votersNIC = document.getElementById("votersNIC");

            var doneNIC = false;

            votersNIC.onfocus = function () {
                if (doneNIC == false) {
                    document.getElementById("numWarn").style.display = "block";
                } else {
                    document.getElementById("numWarn").style.display = "none";
                }
            }
            votersNIC.onkeyup = function () {

                if ((votersNIC.value).length == 10) {
                    if (votersNIC.value[9] === "V") {
                        document.getElementById("numWarn").style.display = "none";
                        document.getElementById("letWarn").style.display = "none";
                        doneNIC = true;
                    } else if (votersNIC.value[9] === "X") {
                        document.getElementById("letWarn").style.display = "block";
                        document.getElementById("numWarn").style.display = "none";
                    } else {
                        document.getElementById("numWarn").style.display = "block";
                        document.getElementById("letWarn").style.display = "none";
                    }
                } else {
                    if (typeof (votersNIC.value[(votersNIC.value).length]) == "number") {
                        document.getElementById("numWarn").style.display = "none";
                    } else {
                        document.getElementById("numWarn").style.display = "block";
                    }
                }
            }

            tel.onkeyup = function () {
                console.log(typeof ((tel.value[(tel.value).length])));
                if (typeof (tel.value) == "number") {
                    document.getElementById("intWarn").style.display = "none";
                } else {
                    document.getElementById("intWarn").style.display = "block";
                }
            }
        </script>
        <!-- JS -->
        <script src="Add_Voters/vendor/jquery/jquery.min.js"></script>
        <script src="Add_Voters/js/main.js"></script>
    </body>
</html>
