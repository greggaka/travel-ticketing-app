<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    	<link rel="stylesheet" type="text/css" href="/css/style.css"/>
    	<script src="/webjars/jquery/jquery.min.js"></script>
    	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/script.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Admin Dashboard</title>
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
		<div class="container">
			<div class="d-flex justify-content-between">
			    <h3>Flight Schedule</h3>
				<a href="/flights/new" class="btn btn-primary">+ Add a Route</a>			
			</div>
			<table class="table">
		    <thead>
		        <tr>
		            <th scope="col">Flight ID</th>
		            <th scope="col">Origin</th>
		            <th scope="col">Destination</th>
		            <th scope="col">Departure Date</th>
		            <th scope="col">Arrival Date</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allFlights}" var="flight">
		        <tr>
		        
		            <td><c:out value="${flight.id }" /></td>
		            <td><c:out value="${flight.origin }" /></td>
		            <td><c:out value="${flight.destination }" /></td>
		            <td><c:out value="${flight.departureDate}" /></td>
		            <td><c:out value="${flight.arrivalDate }" /></td>
		            <td class="d-flex">
		            	<a href="/flights/${flight.id }" class="btn btn-light">Flight Info</a>
		            	<a href="/flights/edit/${flight.id}" class="btn btn-outline-warning btn-success">Edit</a>
		            	<form action="/flights/delete/${flight.id }" method="post">
					    	<input type="hidden" value="delete" name="_method" />
					    	<input type="submit" value="Delete" class="btn btn-danger me-5" />
						</form> 	
		            </td>      	
		        
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		</div>
		    
		    
	    
	    
	</body>
</html>