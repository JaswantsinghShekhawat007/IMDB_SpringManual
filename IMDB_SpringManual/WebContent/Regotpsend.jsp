<%@page import="com.sohamglobal.models.sendemail"%>
<%@page import="com.sohamglobal.models.OtpGenerate"%>

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
try{
String email = request.getParameter("email");
if(email.length()>0)
{
char[] s= OtpGenerate.generateOTP();
String otp=String.valueOf(s);
sendemail eml= new sendemail("Crown Movies","Verify Email","OTP is "+otp,email);
%>

<input type="hidden" name="oriotp" value="<%=otp%>">
<small id="emailHelp" class="form-text text-muted">otp has been succesfully send to <%=email %> <%=otp%></small>
<%
}
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>