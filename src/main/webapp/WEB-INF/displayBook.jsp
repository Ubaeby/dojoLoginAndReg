<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
<h1><c:out value="${books.title}"></c:out></h1>
<a href="/books">back to the shelves</a>
</div>


<c:if test="${users.id != books.user.id}">
<div>
	<p>
		<c:out value="${books.user.userName}"/> read <c:out value="${books.title}"/> by <c:out value="${books.author}"/>.
	</p>
	
	<p>Here are <c:out value="${books.user.userName}"/>'s thoughts:</p>
</div>
</c:if>

<c:if test="${users.id == books.user.id}">
	<p>
		You read <c:out value="${books.title}"/> by <c:out value="${books.author}"/>
	</p>
	<p>Here are your thoughts:</p>
</c:if>

<div>
	<p>
		<c:out value="${books.thoughts}"/>
	</p>
</div>



<c:if test="${users.id == books.user.id}">
	<form action="/books/${books.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form>
<a href="/books/${books.id}/edit">Edit</a>
</c:if>



</body>
</html>