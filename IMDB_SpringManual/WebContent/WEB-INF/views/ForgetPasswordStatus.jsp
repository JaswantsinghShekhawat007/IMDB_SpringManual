<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <style>
        .fa-times-circle{
            color: red;
        }
    </style>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />

        <link
          href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap"
          rel="stylesheet"
        />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
          href="https://fonts.googleapis.com/css2?family=Monoton&family=Montserrat:wght@500&display=swap"
          rel="stylesheet"
        />
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
    integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
    crossorigin="anonymous" />
    <title>Forget Password Status</title>
</head>
<body>
<%
String status=String.valueOf(request.getAttribute("status"));

if(status.equals("wrongotp"))
{
	%>
	<div class="d-flex justify-content-center align-items-center">
<div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-times-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">You Have Entered Wrong Otp please check </h3></div>
                <div class="d-flex justify-content-center mt-1"><a style="text-align: center;" href="signin">Sign In</a></div>
                
            </div>
          </div>
	</div>
	
	
	<%
}
else if(status.equals("updated"))
{
	%><div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" style="color:green;" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">Password Changed Successfully </h3> </div>
           <div class="d-flex justify-content-center mt-1"><a class="text-center" href="signin">Sign In</a>    </div>
            
            </div>
          </div><%
}
else
{
	%>	<div class="d-flex justify-content-center align-items-center">
<div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-times-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">Their is something wrong please try later</h3></div>
                <div class="d-flex justify-content-center mt-1"><h1><a style="text-align: center;" href="signin">Sign In</a></h1></div>
                
            </div>
          </div>
	</div><%
}
%>

</body>
</html>