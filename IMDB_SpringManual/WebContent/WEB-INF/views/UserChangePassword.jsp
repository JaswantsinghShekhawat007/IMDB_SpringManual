<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
if(session.getAttribute("userid") != null)
{
%>

<form name="frm" autocomplete="off" method="post" action="userchangepasswordstatus" onsubmit="return verifypassword()">
Enter Current Password: <input type="password" name="currpswd" required="required"><br>
Enter New Password: <input type="password" name="newpswd" minlength="8" maxlength="15" required="required"> <br>
Enter Confirm New Password: <input type="password" name="cnfnewpswd" minlength="8" maxlength="15" required="required"><br>

<input type="submit" value="Submit">

</form>

<%
}
else
{
	response.sendRedirect("signin");
}
%>
</body>
</html>