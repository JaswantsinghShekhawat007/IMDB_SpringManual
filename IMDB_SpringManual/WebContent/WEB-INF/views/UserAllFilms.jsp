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
%>
<h2>Films</h2>
<hr>
<%
int i;
ArrayList<Films> films = (ArrayList) request.getAttribute("films");
if(films.size()>0)
{
	Films fm;
%>

<table border="1" style="text-align:center">

<tr>
<th>Poster</th>
<th>FilmID</th>
<th>Film Name</th>
<th>Category</th>
<th>Release Year</th>
<th>Director</th>
<th>Actor</th>
<th>Actress</th>
<th>Platform</th>
<th>Collection</th>
<th>Youtube Trailer Embedded link</th>
<th>Action</th>
</tr>
<%
for(i=0;films.size()>i;i++)
{
	fm=films.get(i);
%>
<tr>
<td><img src="/SpringMVCManual3Assignment/uploads/<%=fm.getFilmid() %>.jpg" width="70px" height="70px" /></td>
<td><%=fm.getFilmid() %></td>
<td><%=fm.getFilmname() %></td>
<td><%=fm.getCategory() %></td>
<td><%=fm.getRelyear() %></td>
<td><%=fm.getDirector() %></td>
<td><%=fm.getActor() %></td>
<td><%=fm.getActress() %></td>
<td><%=fm.getPlatform() %></td>
<td><%=fm.getCollection() %></td>
<td><%=fm.getYoutubetraillink() %></td>
<td><a href="userfilmdetails/<%=fm.getFilmid()%>">Show More</a></td>
</tr>
<%
}
%>

</table>

<%
}
else
{
	%>No Movie present in DataBase<%
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