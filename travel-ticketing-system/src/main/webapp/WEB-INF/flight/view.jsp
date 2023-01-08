<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/css/style.css"/>
        <script src="/webjars/jquery/jquery.min.js"></script>
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <title>View Name</title>
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
    		<h3>Flight Information</h3>
    		<a href="/" class="mt-auto">back to dashboard</a>
    	</div>
    	<div class="container d-flex">
    		<div class="me-5">
    			<h3>Origin: <c:out value="${flight.origin }" /></h3>
    			<h5>Departure Date: <c:out value="${flight.departureDate }"/></h5>    		
    		</div>
    		<div class="me-5">    		
    			<h1> -> </h1>
    		</div>
    		<div>
	    		<h3>Destination: <c:out value="${flight.destination }"/></h3>
    			<h5>Arrival Date: <c:out value="${flight.arrivalDate }"/></h5>	
    		</div>
    	</div>
    		<div class="container">
	    			<a href="/flights/edit/${flight.id }" class="btn btn-success">Edit</a> 		
    		</div>
    </body>
</html>