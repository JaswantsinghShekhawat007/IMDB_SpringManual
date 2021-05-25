<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
    integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
    crossorigin="anonymous" />
    <title>Reset Password</title>
</head>

<body>
   
     


    <div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">Reset Password</h3>
            </div>
            <hr>


            <form name="frm" autocomplete="off" method="post" action="forgetpasswordotp">
                
                <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlFile1"> Enter Userid</label>
                    <input  type="text" name="userid" required="required" class="form-control" id="exampleFormControlFile1" placeholder="UserId">
                  </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlSelect1">Security Questions</label>
                    <select class="form-control" required="required" name="secquestion" id="exampleFormControlSelect1">
                        <option value="Who is your Childhood Friend?">Who is your Childhood Friend?</option>
                            <option value="What primary school did you attend?">What primary school did you attend?</option>
                            <option value="What is your grandmother's (on your mother's side) name?">What is your grandmother's (on your mother's side) name?</option>
                            <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                    </select>
                  </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="secans">Answer</label>
                    <input type="text" required="required" name="secans" class="form-control" id="secans" placeholder="Security Question Answer">
                </div>
                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom ">Check</button>
            </form>
        </div>
    </div>
           




  <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>
</html>