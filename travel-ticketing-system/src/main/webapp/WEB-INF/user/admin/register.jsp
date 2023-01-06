<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/css/style.css"/>
        <script src="/webjars/jquery/jquery.min.js"></script>
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <title>Register New User</title>
    </head>
    <body>
		<h1>Register a New User</h1>
		
		<p><form:errors path="user.*"/></p>
		
		<form:form action="/registration" method="post" modelAttribute="user">
			<div>
				<form:label path="firstName">First Name:</form:label>
				<form:input path="firstName" type="text" />
			</div>
			<div>
				<form:label path="lastName">Last Name:</form:label>
				<form:input path="lastName" type="text" />
			</div>
			<div>
				<form:label path="username">Email:</form:label>
				<form:input path="username" type="text" />
			</div>
			<div>
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password" />
			</div>
			<div>
				<form:label path="confirm">Confirm Password:</form:label>
				<form:input path="confirm" type="password" />
			</div>
			<input type="submit" value="Register User" class="btn btn-primary"/>
		</form:form>
    </body>
</html>