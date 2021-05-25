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
    <title>Register</title>
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
            .container-fluid
            {
              padding-left: 0%;
            }
  
          </style>
<script language="Javascript" type="text/javascript">


function verifypassword() {
	 pw = document.frm.pswd.value;
	 cpw = document.frm.cnfpswd.value; 
	 if (pw != cpw) {
		 
		 alert("Password doesn't match..");
			return false;
	}
	 else{
		 return true;
	}
}


function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}



var http = createRequestObject();

function makeGetRequest() {
    email=document.frm.email.value;
    http.open('get', 'Regotpsend.jsp?email=' + email);
    if(email !=""){
    	document.getElementById("genotpbut").innerHTML = "Resend OTP";	
    }
    
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('genstat').innerHTML = response;
    }
}


var http1 = createRequestObject();

function makeGetRequest1() {
    userid=document.frm.userid.value;
    http1.open('get', 'usidemailcheck.jsp?userid=' + userid);
    http1.onreadystatechange = processResponse1;
    http1.send(null);
}

function processResponse1() {
    if(http1.readyState == 4){
        var response1 = http1.responseText;
        document.getElementById('usidstat').innerHTML = response1;
    }
}



var http2 = createRequestObject();

function makeGetRequest2() {
    email=document.frm.email.value;
    http2.open('get', 'usidemailcheck.jsp?email='+email);
    http2.onreadystatechange = processResponse2;
    http2.send(null);
}

function processResponse2() {
    if(http2.readyState == 4){
        var response2 = http2.responseText;
        document.getElementById('emailstat').innerHTML = response2;
    }
}


function setParameterDOB() {
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
var yyyy = today.getFullYear();
if(dd<10){
  dd='0'+dd
} 
if(mm<10){
  mm='0'+mm
} 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("dob").setAttribute("max", today);
}

</script>
</head>
<body>

<div class="container-fluid">
<div  class="float-right">
    <a class="brandname ml-md-5" href="/SpringMVCManual3Assignment/">IMDb</a>
</div>
  <div  class="side-form col col-10 col-md d-flex justify-content-center align-items-center">
    <form autocomplete="off" name="frm" method="post" action="adduser" onsubmit="return verifypassword()">
      <div class="form-row">
            <div class="form-group">
                <label for="userid">UserId</label>
                <input  type="text" name="userid" onblur="makeGetRequest1()" required="required" aria-describedby="emailHelp" class="form-control" id="userid" placeholder="UserId">
                <div id="usidstat"></div>
            </div>
            
             <div style="padding-left: 20px;" class="form-group">
            <label for="email">Email</label>
            <input  type="email" name="email" required="required" aria-describedby="emailHelp" onblur="makeGetRequest2()" class="form-control" id="email" placeholder="Email">
             <div id="emailstat"></div>
        </div>
       
        </div>
        <div class="form-group">
            <label for="name">Full Name</label>
            <input  type="text" name="name" required="required" class="form-control" id="name" placeholder="Full name">
        </div>


        <div class="form-group">
            <label for="otp">Enter OTP</label>
            <input  type="text" name="otp" required="required" aria-describedby="emailHelp" class="form-control" id="otp" placeholder="OTP">
            <div id="genstat"></div>
        </div>

        <div class="form-group">
            <label for="mobileno">Mobile Number</label>
            <input type="number" name="mobileno" required="required" class="form-control" id="mobileno" placeholder="Mobile Number">
        </div>
        <div class="form-group">
            <label for="dob">Date Of Birth</label>
            <input  type="date" id="dob" onclick="setParameterDOB()" name="dob" required="required" class="form-control"  placeholder="Mobile Number">
        </div>
        <div class="form-group">
            <label for="gender">Select Gender</label>
            <select class="form-control" name="gender" id="gender">
                <option value="male">Male</option>
                <option value="female">female</option>
                <option value="other">Other</option>
                
            </select>
          </div>
        <div class="form-group">
            <label for="secquestion">Security Questions</label>
            <select class="form-control" name="secquestion" id="secquestion">
                <option value="Who is your Childhood Friend?">Who is your Childhood Friend?</option>
                <option value="What primary school did you attend?">What primary school did you attend?</option>
                <option value="What is your grandmother's (on your mother's side) name?">What is your grandmother's (on your mother's side) name?</option>
                <option value="What was your childhood nickname?">What was your childhood nickname?</option>
            </select>
          </div>
          <div class="form-group">
            <label for="secans">Security Answer</label>
            <input type="text" name="secans" required="required" class="form-control" id="secans" placeholder="Security Question Answer">
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="pswd">Password</label>
                <input type="password" name="pswd" minlength="8" maxlength="15" class="form-control" id="pswd" placeholder="Password">
            </div>
            <div class="form-group col-md">
                <label for="cnfpswd">Confirm Password</label>
                <input  type="password" name="cnfpswd" minlength="8" maxlength="15" class="form-control" id="cnfpswd" placeholder="Confirm Password">
            </div>
            
        </div>
    
      
        
     <div class="row mb-2">
         <div class="col col-sm-3">
            <button type="submit" class="btn btn-primary mt-3">Register</button> 

         </div>
        </form>
        <button type="submit" id="genotpbut" class="btn btn-primary mt-3" onclick="makeGetRequest()">Generate OTP</button> 

  </div>



</div>


</div>
</body>
</html>