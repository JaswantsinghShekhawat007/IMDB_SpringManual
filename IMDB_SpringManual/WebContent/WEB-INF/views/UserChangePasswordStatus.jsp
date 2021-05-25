<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
	String status=String.valueOf(request.getAttribute("status"));
	if(status.equals("notfound"))
	{
		%>You have Entered Wrong Password<%
	}
	else if(status.equals("updated"))
	{
		%>Password Change Successfully<%
	}
	else
	{
		%>Their is something wrong please try later....<%
	}
%>
<a href="userhome">Home</a>

<%
}
else
{
	response.sendRedirect("signin");
}
%>
</body>
</html>