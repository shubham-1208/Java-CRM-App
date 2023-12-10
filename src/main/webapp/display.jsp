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
  	<% List<Person> li = (List)request.getAttribute("list"); %>
    <table class="table table-striped table-hover table-bordered">
	  <thead class="table-dark">
	    <tr>
	      <th scope="col">Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">Phone</th>
	      <th scope="col">Address</th>
	      <th scope="col">State</th>
	      <th scope="col">Country</th>
	      <th scope="col">Pincode</th>
	      <th scope="col">Created At</th>
	      <th scope="col">ID</th>
	    </tr>
	  </thead>
	  <tbody>
		<%for (Person per: li){ %>
			<tr>
			<td><%=per.getFirstname()+" "+per.getLastname() %></td>
			<td><%=per.getEmail() %></td>
			<td><%=per.getPhoneno()%></td>
			<td><%=per.getAddress() %></td>
			<td><%=per.getState() %></td>
			<td><%=per.getCountry() %></td>
			<td><%=per.getPincode() %></td>
			<td><%=per.getTimestamp() %></td>
			<td><a href="record?id=<%=per.getId()%>"><%=per.getId() %></a></td>
			</tr>
		<%} %>
</table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>