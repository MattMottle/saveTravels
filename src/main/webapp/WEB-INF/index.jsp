<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Travels</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container"> 
		<h1>Save Travels</h1>
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th scope="col">Expense</th>
		      <th scope="col">Vendor</th>
		      <th scope="col">Amount</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="expense" items="${expenses}">
			    <tr>
			      <td><a href="http://localhost:8080/${expense.id}"><c:out value="${expense.name}"/></a></td>
			      <td><c:out value="${expense.vendor}"/></td>
			      <td>$<fmt:formatNumber type="number" minFractionDigits="2" value="${expense.amount}"/></td>
			      <td><a href="http://localhost:8080/${expense.id}/edit">Edit</a>  
			      <form action="/${expense.id}/delete" method="post">
			      	<input type="hidden" name="_method" value="delete" />
			      	<button class="delete">Delete</button>
			      </form></td>
			      
			    </tr>
			</c:forEach>
		  </tbody>
		</table>
		<h3>Add an Expense:</h3>
		<div class="form">
			<form:form action="/process" method="post" modelAttribute="expense">
				<div style="color: red;"><form:errors path="name"/></div>
				<div style="color: red;"><form:errors path="vendor"/></div>
				<div style="color: red;"><form:errors path="amount"/></div>
				<div style="color: red;"><form:errors path="description"/></div>
				<p>
			        <form:label path="name">Name:</form:label>
			        <form:input path="name"/>
			    </p>
			    <p>
			        <form:label path="vendor">Vendor:</form:label>
			        <form:input path="vendor"/>
			    </p>
			    <p>
			        <form:label path="amount">Amount: $</form:label>
			        <form:input type="number" step="0.01" path="amount"/>
			    </p>
			    <p>
			        <form:label path="description">Description:</form:label>
			        <form:textarea path="description"/>     
			    </p>    
			    <button class="button">Submit</button>
			</form:form>
		</div>   
	</div>
</body>
</html>