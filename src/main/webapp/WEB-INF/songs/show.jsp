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
	
	<br><br>

<table class="table">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Artist</th>
            <th scope="col">Rating(1-10)</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><c:out value="${showSongObject.title}"/></td>
            <td><c:out value="${showSongObject.artist}"/></td>
            <td><c:out value="${showSongObject.rating}"/></td>
            <td>             
            <form action="/songs/${showSongObject.id}/delete" method="post">
            <input type="hidden" name="_method" value="delete" />
            <input class ="btn btn-warning" type="submit" value="delete" />   <!-- Delete button -->
            </form>
            </td>
        </tr>
    </tbody>
</table>
	
	</div>
		
</body>
</html>