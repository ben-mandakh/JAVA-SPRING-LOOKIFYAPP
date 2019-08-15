<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<meta charset="ISO-8859-1">
	<title>Lookify!</title>
</head>
<div class="container">
<a style="float:right" href="/dashboard">Dashboard</a>
<h1>Add a New Song</h1>
<form:form action="/dashboard" method="post" modelAttribute="newSongObject">
    <p>
        <form:label path="title">Title</form:label>
        <form:errors path="title"/>
        <form:input class="form-control col-3" path="title"/>
    </p>
    <p>
        <form:label path="artist">Artist</form:label>
        <form:errors path="artist"/>
        <form:textarea class="form-control col-3" path="artist"/>
    </p>
    <p>
        <form:label path="rating">Rating(1-10)</form:label>
        <form:errors path="rating"/>
        <form:input class="form-control col-3" type="number" path="rating"/>
    </p>
      
    <input type="submit" value="Submit"/>
</form:form>
</div>