<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
	<h1>Edit Expense</h1>
		<div class="form">
				<form:form action="/expense/${expense.id}" method="post" modelAttribute="expense">
				 <input type="hidden" name="_method" value="put">
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
				        <form:label path="amount">Amount:</form:label>
				        <form:input type="number" step="0.01" path="amount"/>
				    </p>
				    <p>
				        <form:label path="description">Description:</form:label>
				        <form:textarea path="description"/>     
				    </p>    
				    <button class="button">Submit</button>
				</form:form>
			</div>
		<a href="http://localhost:8080/">Home</a>
		</div>  
</body>
</html>