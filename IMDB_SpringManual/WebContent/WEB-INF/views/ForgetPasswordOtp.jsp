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
    <title>Forget Password OTP</title>
<script language="Javascript" type="text/javascript">


function verifypassword() {
	 pw = document.frm.newpswd.value;
	 cpw = document.frm.cnfnewpswd.value; 
	 if (pw != cpw) {
		 
		 alert("Password doesn't match..");
			return false;
	}
	 else{
		 return true;
	}
}
</script>
</head>
<body>
<%
String status=String.valueOf(request.getAttribute("status"));
String userid=String.valueOf(request.getAttribute("userid"));
if(status.equals("notfound"))
{
	%>
	
	<div class="d-flex justify-content-center align-items-center">
<div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-times-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">You have entered Invalid details please check</h3></div>
                <div class="d-flex justify-content-center mt-1"><a style="text-align: center;" href="signin">Sign In</a></div>
                
            </div>
          </div>
	</div>
	
	<%
}
else
{
	%>
	
	
	
    <div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">OTP Check</h3>
            </div>
            <hr>


            <form name="frm" autocomplete="off" method="post" action="forgetpasswordstatus" onsubmit="return verifypassword()">
                
                <div class="form-group ml-2 mr-2">
                    <label for="otp">Enter OTP:</label>
                    <input   type="text" name="otp" minlength="6" maxlength="6" required="required" class="form-control" id="otp" placeholder="OTP">
                  </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="newpswd">Enter New Password:</label>
                    <input type="password" name="newpswd" minlength="8" maxlength="15" required="required" class="form-control" id="newpswd" placeholder="New Password">
                    </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="secans">Enter Confirm Password:</label>
                    <input type="password" name="cnfnewpswd" minlength="8" maxlength="15" required="required" class="form-control" id="secans" placeholder="Confirm Password:">
                </div>
                <input type="hidden" name="oriotp" value="<%=status%>"><%=status %>
				<input type="hidden" name="userid" value="<%=userid%>">
                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom ">Submit</button>
            </form>
        </div>
    </div>
           
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	<%
}
%>



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