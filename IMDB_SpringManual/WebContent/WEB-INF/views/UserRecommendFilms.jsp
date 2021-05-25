<%@page import="com.sohamglobal.models.Films"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script language="Javascript" type="text/javascript">


function verify() {
	 if (document.frm.category.value != "Category") {
		
		 return true;
	}
	 else{
		
		 alert("Please Select Anything...");
			return false;
	}
}

</script>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
	String userid=String.valueOf(session.getAttribute("userid"));
	ArrayList<Films> films = (ArrayList) request.getAttribute("films");
%>

<h2>Recommend Movies</h2>
<hr>
<form name="frm" autocomplete="off" method="post" action="userrecommendfilmlist" onsubmit="return verify()">

<br><br>
Select Category: <select name="category">
 							<option value="Category">Category</option>
                          	<%
                          	ArrayList<String> lst = new ArrayList<String>();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getCategory()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getCategory());
                          		%><option value="<%=films.get(i).getCategory()%>"><%=films.get(i).getCategory()%></option><%
                          		}
                          	}
                          	%>
</select>
<br><br>
<br>
<br>
<input style="margintop:20px" type="submit" value="Search" >
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