<%@page import="com.sohamglobal.models.Films"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input[id="myInput"] {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[id="myInput"] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>

<script language="Javascript" type="text/javascript">


function verify() {
	 if (document.getElementById("myInput").value != "" || document.frm.actor.value != "Actor" || document.frm.category.value != "Category" || document.frm.director.value != "Director" || document.frm.language.value != "Language" || document.frm.actress.value != "Actress") {
		
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
	ArrayList<Films> films = (ArrayList) request.getAttribute("films");
%>
<h2>Search Movies</h2>

<form name="frm" autocomplete="off" method="post" action="userfindfilm" onsubmit="return verify()">
<div class="autocomplete" style="width:300px;">
Enter Film Name: <input id="myInput" type="text" name="filmname">
</div>
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

select Language: <select name="language" >
 							<option value="Language">Language</option>
 								<%
 								lst.clear();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getLanguage()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getLanguage());
                          		%><option value="<%=films.get(i).getLanguage()%>"><%=films.get(i).getLanguage()%></option><%
                          		}
                          	}
                               	%>
                          
</select>
<br><br>


select Director: <select name="director" >
 							<option value="Director">Director</option>
 								<%
 								lst.clear();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getDirector()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getDirector());
                          		%><option value="<%=films.get(i).getDirector()%>"><%=films.get(i).getDirector()%></option><%
                          		}
                          	}
                       
                               	%>
                          
</select>
<br><br>

select Actor: <select name="actor" >
 							<option value="Actor">Actor</option>
 								<%
 								lst.clear();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getActor()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getActor());
                          		%><option value="<%=films.get(i).getActor()%>"><%=films.get(i).getActor()%></option><%
                          		}
                          	}
                               	%>
                          
</select>
<br><br>

select Actress: <select name="actress" >
 							<option value="Actress">Actress</option>
 								<%
 								lst.clear();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getActress()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getActress());
                          		%><option value="<%=films.get(i).getActress()%>"><%=films.get(i).getActress()%></option><%
                          		}
                          	}
                               	%>
                          
</select>
<br><br>



<br>
<br>
<input style="margintop:20px" type="submit" value="Search" >
</form><hr>
<a href="userhome">Home</a>

<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      var j=0;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
        if(j<5)
        {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
          
          }
          j++
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}


var countries = [<% for (int i = 0; i < films.size(); i++) { %>"<%= films.get(i).getFilmname() %>"<%= i + 1 < films.size() ? ",":"" %><% } %>];
/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>




<%
}
else
{
	response.sendRedirect("signin");
}
%>
</body>
</html>