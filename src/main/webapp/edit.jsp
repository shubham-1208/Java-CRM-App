<%@page import="crm.dto.Person"%>
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
	          <a class="nav-link" href="signup.jsp">Sign Up</a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link" href="login.jsp">Login</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
  	<%String message = (String)request.getAttribute("message"); %>
      
      <%if(message!= null){ %>
      	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	      <%=message %>
	      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
      <%}else{%>
      	<div class="alert alert-warning alert-dismissible fade show" role="alert">
			<%="Welcome to Java CRM Sign Up Page" %>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
      <%} %>
      <br/>
  	
<%Person person = (Person)request.getAttribute("person"); %>
  	<div class="container">
  	<h1>Update</h1>
  	<br/>
    	<form method="post" action="edit">
    	<div class="mb-3">
		    <input type="number" class="form-control" name="id" placeholder="id" value="<%=person.getId()%>" readonly="readonly">
		  </div>
		  <div class="mb-3">
		    <input type="email" class="form-control" name="email" placeholder="Email"  value="<%=person.getEmail()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="firstname" placeholder="First Name"  value="<%=person.getFirstname()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="lastname" placeholder="Last Name"  value="<%=person.getLastname()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="number" class="form-control" name="phoneno" placeholder="Phone Number"  value="<%=person.getPhoneno()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="address" placeholder="Address"  value="<%=person.getAddress()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="state" placeholder="State"  value="<%=person.getState()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="country" placeholder="Country"  value="<%=person.getCountry()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="number" class="form-control" name="pincode" placeholder="Pincode" value="<%=person.getPincode()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="text" class="form-control" name="username" placeholder="Username" value="<%=person.getUsername()%>" required="required">
		  </div>
		  <div class="mb-3">
		    <input type="password" class="form-control" name="password" placeholder="Password" value="<%=person.getPassword()%>" required="required">
		  </div>
		  <br/>
		  <button type="submit" class="btn btn-secondary">Update</button>
		</form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>