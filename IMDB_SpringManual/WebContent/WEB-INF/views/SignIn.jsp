<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Login Page</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/SpringMVCManual3Assignment/uploads/css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />

        <link
          href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap"
          rel="stylesheet"
        />
       


        <style>
          .form-control-lg
          {
            width: 500px;
          }
          .container-fluid
          {
            padding-left: 0%;
          }

        </style>
</head>
<body>
<div class="container-fluid" >
<div  class="float-right">
    <a class="brandname ml-md-5" href="/IMDB_SpringManual/">IMDb</a>
</div>
  <div class="side-form col col-10 col-md d-flex justify-content-center align-items-center">
    <form autocomplete="off" name="frm" method="post" action="check">
        <div class="form-group">
          <label for="uid">User ID</label>
          <input type="text" name="userid" required class="form-control form-control-lg"" id="uid" aria-describedby="emailHelp" placeholder="User ID">
          
        </div>
        <div class="form-group">
          <label for="psw">Password</label>
          <input type="password" name="pswd" required class="form-control form-control-lg"" id="psw" placeholder="Password">
        </div>
        <div class="form-group">
            <a href="forgetpassword">Forgot Password</a>
          </div>
          <div class="form-group">
            <a href="signup">Don't have a account?</a>
          </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>


  </div>



</div>

</body>
</html>