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
		<p>
			Hello,
			<c:out value="${users.userName}" />
			Welcome to..
		</p>

		<a href="/books">back to the shelves</a>
	</div>

	<h1>The Book Broker!</h1>

	<p>Available Books to Borrow</p>

	<table>
		<thead>
			<tr>
				<td>ID</td>
				<td>Title</td>
				<td>Author Name</td>
				<td>Actions</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${uBooks}">
				<tr>
					<td><c:out value="${b.id }" /></td>
					<td><a href="/books/${b.id}"><c:out value="${b.title }" /></a></td>
					<td><c:out value="${b.author}" /></td>
					<td><c:out value="${b.user.userName}"/></td>
					<c:if test="${users.id == b.user.id}">
						<td><a href="/books/${books.id}/edit">edit</a>
							<form action="/books/${books.id}" method="post">
								    <input type="hidden" name="_method" value="delete">
								    <input type="submit" value="Delete">
							</form>
						</td>
					</c:if>

					<c:if test="${users.id != b.user.id}">
						<td><a href="bookmarket/${b.id}">borrow</a></td>
					</c:if>

				</tr>

			</c:forEach>

		</tbody>

	</table>
	
	<p>Books I'm Borrowing...</p>
		<table>
			<thead>
				<tr>
					<td>ID</td>
					<td>Title</td>
					<td>Author Name</td>
					<td> Owner</td>
					<td>Actions</td>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var = "b" items="${bBooks}">
					<td><c:out value="${b.id }" /></td>
					<td><a href="/books/${b.id}"><c:out value="${b.title }" /></a></td>
					<td><c:out value="${b.author}" /></td>
					<td><c:out value="${b.user.userName}"/></td>
					<td><a href="/bookmarket/return/${b.id}">return</a></td>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>