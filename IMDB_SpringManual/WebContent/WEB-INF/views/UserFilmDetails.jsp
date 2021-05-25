<%@page import="com.sohamglobal.models.Reviews"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sohamglobal.models.LikeDislike"%>
<%@page import="com.sohamglobal.models.Films"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.fa {
  font-size: 50px;
  cursor: pointer;
  user-select: none;
}

.fa:hover {
  color: darkblue;
}
</style>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
	String userid=String.valueOf(session.getAttribute("userid"));
	Films film = (Films) request.getAttribute("film");
	ArrayList<Reviews> revlst = (ArrayList) request.getAttribute("reviews");
	LikeDislike ld = (LikeDislike) request.getAttribute("ld");
	String status=ld.getLikeDislike();
%>
Name: <%=film.getFilmname() %><br>
Language:  <%=film.getLanguage() %><br>
Country: <%=film.getCountry() %><br>
Category: <%=film.getCategory() %><br>
Release Year: <%=film.getRelyear() %><br>
Certificate: <%=film.getCertificate() %><br>
Director: <%=film.getDirector() %><br>
Actor: <%=film.getActor() %><br>
Actress: <%=film.getActress() %><br>
Music: <%=film.getMusic() %><br>
Platform: <%=film.getPlatform() %><br>
Budget: <%=film.getBudget() %><br>
Collection: <%=film.getCollection() %><br>
Description: <%=film.getDescription() %><br>
Trailer: <%=film.getYoutubetraillink() %><br>
<hr>
<i class="fa fa-thumbs-up" 
<%
if(status.equals("like"))
{
	%> style="color:blue;" onclick=" window.location.href = 'userlikedislike/<%=film.getFilmid()%>/delete';"<%
}
else
{
	%> onclick=" window.location.href = 'userlikedislike/<%=film.getFilmid()%>/like';"<%
}
%>
></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i  class="fa fa-thumbs-down"
<%
if(status.equals("dislike"))
{
	%> style="color:blue;" onclick=" window.location.href = 'userlikedislike/<%=film.getFilmid()%>/delete';"<%
}
else
{
	%> onclick=" window.location.href = 'userlikedislike/<%=film.getFilmid()%>/dislike';"<%
}
%>
></i><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ld.getSum() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ld.getCount()-ld.getSum() %>


<br>
<br>
<br>
<a href="<%=String.valueOf(request.getAttribute("homeurl"))%>">Home</a>
<br>
<br>
<br>
<hr>
<h2>Reviews</h2>	
<form name="frm" method="post" autocomplete="off" action="usersetreview/<%=film.getFilmid()%>">
Enter Detail Review: <input type="text" name="detailreview" required="required">
<input type="submit" value="Submit">
</form>
<br>
<br>
<br>
<%
if(revlst.size()>0)
{
	int i;
	Reviews rev;
	%>
	<table border="1" style="text-align:center">

	<tr>
	<th>Review ID</th>
	<th>FilmID</th>
	<th>UserId</th>
	<th>Detail Review</th>
	<th>Review Date</th>
	<th>Action</th>
	</tr>
	<%
	for(i=0;revlst.size()>i;i++)
	{
		rev= (Reviews) revlst.get(i);
	%>
	<tr>
	<td><%=rev.getReviewid() %></td>
	<td><%=rev.getFilmid() %></td>
	<td><%=rev.getUserid() %></td>
	<td><%=rev.getDetailreview() %></td>
	<td><%=rev.getReviewdate() %></td>
	<td>
	<%
	if(userid.equals(rev.getUserid()))
	{
		%><a href="userdeletereview/<%=rev.getReviewid()%>/<%=rev.getFilmid() %>">delete</a><%
	}
	%>
	</td>
	</tr>
	<%
	}
	%>

	</table>
<%	
}
else
{
	%>0 Reviews<%
}
%>



<%
}
else
{
	response.sendRedirect("signin");
}
%>
</body>
</html>