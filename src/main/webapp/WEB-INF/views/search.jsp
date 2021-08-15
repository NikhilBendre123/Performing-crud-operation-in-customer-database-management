<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
</head>
<body>
	<div align="center">
    <h1>Search Result</h1>
    
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
        <c:forEach items="${result}" var="customer">
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
</div> 
</body>
</html>