<%@ page isErrorPage="true" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta charset="ISO-8859-1">
	<title>Lookify!</title>
</head>
<body>
	<div class="container">
	<a style="float:right" href="/dashboard">Dashboard</a>
	<form style ="display:inline-block; margin-left:150px" action="/search/artist" method ="post">
		<input style ="display:inline-block" class="form-control col-8" type="text" name="artist" placeholder="Search by Artist">
		<input style ="display:inline-block" class="btn btn-primary" type="submit" value="Search">
	</form>
	
	<br><br>
<h2 >All Songs: </h2>
<table class="table">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Rating</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${songs}" var="song">
        <tr>
            <td><a href="/songs/${song.id}/show"> <c:out value="${song.title}"/> </a></td>
            <td><c:out value="${song.rating}"/></td>
            <td>             
            <form action="/songs/${song.id}/delete" method="post">
            <input type="hidden" name="_method" value="delete" />
            <input class ="btn btn-warning" type="submit" value="delete" />   <!-- Delete button -->
            </form>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>
	
	</div>
		
</body>
</html>