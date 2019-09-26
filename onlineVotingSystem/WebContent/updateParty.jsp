
<%@page import="java.util.List"%>
<%@page import="com.onvs.model.Parties"%>
<%@page import="com.onvs.config.NewHibernateUtil"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Party Details</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <center>
        <h1>Edit Details</h1>
        <div class="container6">
            <%
                int id = (Integer) session.getAttribute("editID");

                List<Parties> parties = (List<Parties>) session.getAttribute("partiez");

                Parties currentParty = new Parties();
                for (Parties party : parties) {
                    if (party.getPid() == id) {
                        currentParty = party;
                    }
                }
            %>
            <table>
                <form action="UpdateServlet" method="POST">
                    <tr><td>
                            <label>Party Name</label>
                        </td>
                        <td>
                            :  <input class="textBox" type="text" name="partyName" value="<%=currentParty.getName()%>" required>
                        </td>
                    </tr>
                    <tr><td>
                            <label>Party Address</label>
                        </td>
                        <td>
                            :  <input class="textBox" type="text" name="partyAddress" value="<%=currentParty.getAddress()%>" required>
                        </td>
                    </tr>
                    <tr><td>
                            <label>Party President NIC</label>
                        </td>
                        <td>
                            :  <input class="textBox" type="text" name="nic" id="nic" value="<%=currentParty.getPresidentNic()%>" maxlength="10" minlength="10" required>
                        </td>
                    </tr>
                    <tr><td>
                            <label>Party Email</label>
                        </td>
                        <td>
                            :  <input class="textBox" type="email" name="partyMail" value="<%=currentParty.getEmail()%>" required>
                        </td>
                    </tr>
                    <tr><td>
                            <label>Party Telephone</label>
                        </td>
                        <td>
                            :  <input class="textBox" type="tel" name="partyTel" id="mob" value="<%=currentParty.getTel()%>" maxlength="10" minlength="10" required>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input  class="subBtn btn" type="submit" value="Save">
                            <input  class="clrBtn btn" type="reset" value="Clear">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href="overview.jsp"><input class="backOver" type="button" value="Back to Overview"></a></td>
                    </tr>
                </form>
            </table>
        </div>
        <div class="container3" id="nicWarn" >
            <p id="numWarn" style="color: red; display: none;">NIC must be in the format of 9 digits and a letter "V"/"X" last</p>
            <p id="letWarn" style="color: red; display: none;">Last letter "X" means, you can not vote in Sri Lanka. So you can not proceed further</p>
        </div>

        <script>
            var nic = document.getElementById("nic");

            var doneNIC = false;

            nic.onfocus = function () {
                if (doneNIC == false) {
                    document.getElementById("numWarn").style.display = "block";
                } else {
                    document.getElementById("numWarn").style.display = "none";
                }
            }
            nic.onkeyup = function () {

                if ((nic.value).length == 10) {
                    if (nic.value[9] === "V") {
                        document.getElementById("numWarn").style.display = "none";
                        document.getElementById("letWarn").style.display = "none";
                        doneNIC = true;
                    } else if (nic.value[9] === "X") {
                        document.getElementById("letWarn").style.display = "block";
                        document.getElementById("numWarn").style.display = "none";
                    } else {
                        document.getElementById("numWarn").style.display = "block";
                        document.getElementById("letWarn").style.display = "none";
                    }
                } else {
                    if (typeof (nic.value[(nic.value).length]) == "number") {
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
    </body>
</body>
</html>
