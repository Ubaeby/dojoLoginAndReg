<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Change your Entry</h1>
	<a href="/books">back to the shelves</a>	
	
		<form:form action="/books/${books.id}" method="post" modelAttribute="books">
		<input type="hidden" name="_method" value="put"/>
		<form:input type="hidden" path="user"/>
	<div>
		<form:errors path="title"/>
		<form:errors path="thoughts"/>
	</div>
	
	<div>
			<form:label path="title">Title:</form:label>
		<form:input path="title"/>
	</div>

	<div>
			<form:label path="author">Author:</form:label>
		<form:input path="author"/>
	</div>

	<div>
			<form:label path="thoughts">My Thoughts:</form:label>
		<form:textarea path="thoughts"/>
	</div>

		<button>Submit</button>
		
	</form:form>
</body>
</html>