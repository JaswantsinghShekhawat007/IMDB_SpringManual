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
	if(String.valueOf(request.getAttribute("film")).equals("deleted"))
	{
		%>Deleted SuccessFully...<%
	}
	else
	{
		%>Their is something wrong...<%
	}
%>
<a href="<%=request.getAttribute("homeurl")%>">Home</a>
<%
}
else
{
	response.sendRedirect("signin");
}
%>
</body>
</html>