<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense</title>
<link rel="stylesheet" type="text/css" href="/css/expense.css">
</head>
<body>
	<div class="container">
		<h1><c:out value="${expense.name}"/></h1>
		<h3>Vendor: <c:out value="${expense.vendor}"/></h3>
		<h3>Amount: $<c:out value="${expense.amount}"/></h3>
		<h3>Description: <c:out value="${expense.description}"/></h3>
	</div>
</body>
</html>