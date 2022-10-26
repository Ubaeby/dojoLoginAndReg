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

	<h1>Welcome, <c:out value="${user.userName}"></c:out></h1>

<p>This is your dashboard. Nothing to see here yet.</p>

<a href="/logout">logout</a>

</body>
</html>