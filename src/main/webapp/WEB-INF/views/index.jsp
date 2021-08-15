<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Manager</title>
</head>
<body>
	<div align="center">
    <h1>Customer Manager</h1>
    <form method="get" action="search">
        <input type="text" name="keyword" /> 
        <input type="submit" value="Search" />
    </form>
    <h2><a href="new">New Customer</a></h2>  
    <h3><a onClick="return confirm('Are you sure you want to delete all customer information?')" href="deleteall">Delete All </a></h3>
    
    <table border="1" cellpadding="5">
        <tr>
	            <th>ID</th>
	            <th>Name</th>
	            <th>E-mail</th>
	            <th>Number</th>
	            <th>Aadhaar</th>
	            <th>Address</th>
	            <th>Action</th>
        </tr>
        <c:forEach items="${listCustomer}" var="customer">
        <tr>
	           <td>${customer.id}</td>
	           <td>${customer.name}</td>
	           <td>${customer.email}</td>
	           <td>${customer.number}</td>
	           <td>${customer.aadhaar}</td>
	           <td>${customer.address}</td>
	        <td>
                <a onClick="return confirm('Are you sure you want to edit?')" href="/edit?id=${customer.id}">Edit</a>
                &nbsp;&nbsp;&nbsp;
                <a onClick="return confirm('Are you sure you want to delete?')" href="/delete?id=${customer.id}">Delete</a>
            </td>
        </tr>
        </c:forEach>
    </table>
    <div>&nbsp;</div>
    <div>
    	Total Items: ${totalItems} - Page${currentPage} of ${totalPages}
    	&nbsp; &nbsp;
    	<a th:if="${currentPage > 1}" th:href="@{'/page/1'}">First</a>
    	<span th:unless="${currentPage > 1}">First</span>
    	
    	<a th:if="${currentPage > 1}" th:href="@{'/page/' + ${currentPage - 1}}">Previous</a>
		<span th:unless="${currentPage > 1}">Previous</span>
		
		<span th:each="i: ${#numbers.sequence(1, totalPages)}">
    		<a th:if="${i != currentPage}" th:href="@{'/page/' + ${i}}">[[${i}]]</a>
    		<span th:unless="${i != currentPage}">[[${i}]]</span>
    		&nbsp;&nbsp;
		</span>
		
		<a th:if="${currentPage < totalPages}" th:href="@{'/page/' + ${currentPage + 1}}">Next</a>
		<span th:unless="${currentPage < totalPages}">Next</span>
		
		<a th:if="${currentPage < totalPages}" th:href="@{'/page/' + ${totalPages}}">Last</a>
		<span th:unless="${currentPage < totalPages}">Last</span>

    	
    </div>
    
</div> 
</body>
</html>