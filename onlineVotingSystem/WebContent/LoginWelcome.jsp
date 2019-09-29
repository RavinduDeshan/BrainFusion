<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sign Up</title>

  <!-- Bootstrap core CSS -->
  <link href="WelcomepageVdore/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/one-page-wonder.min.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><img src="HomeAssets/images/Career Master Vert.png" height="56px"><b></b></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            
          </li>
          <li class="nav-item">
           
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="masthead text-center text-white">
    <div class="masthead-content">
      <div class="container">
        <h1 class="masthead-heading mb-0">Career Master
        </h1>
        <h2 class="masthead-subheading mb-0">Login As</h2>
        <a href="JobHostLogin.jsp" class="btn btn-primary btn-xl rounded-pill mt-5" id="jobh" onmouseover="document.getElementById('extracon1').style.display = 'block';" onmouseout="document.getElementById('extracon1').style.display = 'none';">Job Host</a>
        <a href="UserLogin.jsp" class="btn btn-primary btn-xl rounded-pill mt-5" id="cs" onmouseover="document.getElementById('extracon2').style.display = 'block';" onmouseout="document.getElementById('extracon2').style.display = 'none';">Skill Seeker</a>
       
        
      </div>
      
      <br>
      <br>
      <br>
      <div id="extracon2" style="display: none;">If you are a  Career Seeker Log In Here</div>
      <div id="extracon1" style="display: none;">If you are a Job Host Company Login Here</div>
    </div>
    
    <br>
    <br>
    <br>
   
  </header>

  

  <!-- Footer -->
  <footer class="py-5 bg-black">
    <div class="container">
      <p class="m-0 text-center text-white small">Copyright &copy;2019 All Rights Reserved| Career Master</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="WelcomepageVdore/vendor/jquery/jquery.min.js"></script>
  <script src="WelcomepageVdore/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
