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
		<h1>
			Welcome,
			<c:out value="${users.userName}"></c:out>
		</h1>
		<a href="/logout">logout</a>
	</div>

	<div>
		<p>Books from everyone's shelves:</p>
		<a href="books/new">Add a book to my shelf!</a>
		<a href="/bookmarket">Looking to borrow a book?</a>
	</div>

<table>
	<thead>
		<tr>
			<td>ID</td>
			<td>Title</td>
			<td>Author Name</td>
			<td>Posted By</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="b" items="${books}">
			<tr>
				<td> <c:out value="${b.id }"/> </td>
				<td> <a href="/books/${b.id}"><c:out value="${b.title }"/></a></td>
				<td> <c:out value="${b.author}"/> </td>
				<td> <c:out value="${b.user.userName}"/> </td>
			</tr>
		
		</c:forEach>
		
	</tbody>
	
</table>


</body>
</html>