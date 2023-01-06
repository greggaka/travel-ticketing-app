<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional //EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/css/style.css"/>
        <script src="/webjars/jquery/jquery.min.js"></script>
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
	    <c:if test="${logoutMessage != null}">
	        <c:out value="${logoutMessage}"></c:out>
	    </c:if>
		<h1>Login</h1>
		<c:if test="${errorMessage != null}">
        	<c:out value="${errorMessage}"></c:out>
   		</c:if>
		<form method="POST" action="/login">
			<p>
				<label for="username">Email: </label>
				<input type="text" id="username" name="username" />
			</p>
			<p>
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" />
			</p>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="submit" value="Login"/>
		</form>
    </body>
</html>