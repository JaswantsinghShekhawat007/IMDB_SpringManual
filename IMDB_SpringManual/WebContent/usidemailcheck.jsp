<%@page import="com.sohamglobal.models.DBConnector"%>
<%@page import="java.sql.*"%>
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
String userid = request.getParameter("userid");
String email = request.getParameter("email"); 
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	if(email == null)
	{
	pst=con.prepareStatement("select * from userdata where userid=?;");
	pst.setString(1,userid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		%>
		<small id="emailHelp" class="form-text text-muted">This UserID already exist please change....</small>
		<%
		
	}
	}
	if(userid == null)
	{
		pst=con.prepareStatement("select * from userdata where email=?;");
		pst.setString(1,email);
		rs=pst.executeQuery();
		if(rs.next())
		{
			%>
			<small id="emailHelp" class="form-text text-muted">This Email already exist please change....</small>
			<%
			
		}
	}
	
	con.close();
}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>