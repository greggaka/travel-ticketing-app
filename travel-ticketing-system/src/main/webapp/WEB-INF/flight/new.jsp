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
        <title>Add a Flight</title>
    </head>
    <body>
    	<div class="navbar container d-flex justify-content-between">
		<div>
			<h1>Odyssey Air</h1>
		</div>
		    <div>
				<p><c:out value="${currentUser.username}"></c:out></p>
		    	<form id="logoutForm" method="POST" action="/logout" class="text-end">
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        		<input type="submit" value="Logout!" />
	    		</form>
		    </div>
		</div>
		<div class="container">
		    <h2>Admin Dashboard</h2>
		</div>
		<br/>
    	<div class="container d-flex justify-content-between">
			<h3>Add a Flight</h3> 
			<a href="/" class="btn btn-primary">Back to Dashboard</a>   	
    	</div>
    	<form:form action = "/flights/new" modelAttribute="flight" method="post" class="container">
			<div class="form-group mb-3">
	            <form:label path="origin">Origin: </form:label>
	            <form:input type="text" path="origin" />
	            <br>
	            <form:errors path="origin" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="destination">Destination: </form:label>
	            <form:input type="text" path="destination" />
	            <br>
	            <form:errors path="destination" class="text-danger" />
       		</div>
       		
       		<div class="form-group mb-3">
	            <form:label path="departureDate">Departure Date: </form:label>
	            <form:input type="datetime-local" path="departureDate" />
	            <br>
	            <form:errors path="departureDate" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="arrivalDate">Arrival Date: </form:label>
	            <form:input type="datetime-local" path="arrivalDate" />
       		</div>
       		<input type="submit" value="Submit" class="btn btn-success">
		</form:form>
    </body>
</html>