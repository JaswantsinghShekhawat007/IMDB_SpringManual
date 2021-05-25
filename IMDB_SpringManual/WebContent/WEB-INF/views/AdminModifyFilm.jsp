<%@page import="com.sohamglobal.models.Films"%>
<%@page import="java.util.ArrayList"%>
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
	Films fm =(Films) request.getAttribute("film");
%>
<h2>Modify Film</h2>
Film Name: <%=fm.getFilmname() %>
<hr>
<form name="frm" autocomplete="off" method="post" action="adminmodifystatus">
Enter Platform: <input type="text" name="platform" value="<%=fm.getPlatform() %>"><br>
Enter Collection <input type="text" name="collection" value="<%=fm.getCollection() %>"><br>
<input type="hidden" name="filmid" value="<%=fm.getFilmid()%>">
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