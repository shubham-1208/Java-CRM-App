<%@page import="crm.dto.Person"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Java CRM App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.jsp">Java CRM</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

	         <li class="nav-item">
	          <a class="nav-link" href="login.jsp">Logout</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
  	<div class="container">
	  	<br/>
	  	<% Person per = (Person)request.getAttribute("person"); %>
	    <div class="card">
		  <div class="card-header">
		    <strong><%=per.getFirstname()+" "+per.getLastname() %></strong>
		  </div>
		  <div class="card-body">
		    <p class="card-text">
			<strong>Email:</strong>	<%=per.getEmail() %><br/>
			<strong>Phone:</strong>	<%=per.getPhoneno()%><br/>
			<strong>Address:</strong>	<%=per.getAddress() %><br/>
			<strong>State:</strong>	<%=per.getState() %><br/>
			<strong>Country:</strong>	<%=per.getCountry() %><br/>
			<strong>Pincode:</strong>	<%=per.getPincode() %><br/>
			<strong>Created At:</strong>	<%=per.getTimestamp() %><br/>
			<strong>Id:</strong><%=per.getId()%><br/>
			</p>
		  </div>
		</div>
	  	</br>
	  	<a href="login" class="btn btn-secondary">Go back</a>
	  	<a href="delete?id=<%=per.getId()%>" class="btn btn-danger">Delete</a>
	  	<a href="update?id=<%=per.getId()%>" class="btn btn-secondary">Update</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>