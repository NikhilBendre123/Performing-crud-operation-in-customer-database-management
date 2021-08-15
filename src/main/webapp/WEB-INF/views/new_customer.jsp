<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Customer</title>
</head>
<body>
<div align="center">
        <h2>New Customer</h2>
        <form action="save" method="post" modelAttribute="customer">
            <table border="0" cellpadding="5">
                <tr>
                    <td>Name: </td>
                    <td><input type="text" placeholder="enter your name" name="name" id="name"  path="name" /></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" placeholder="enter your E-mail" name="email" id="email"  path="email" /></td>
                </tr>
                 <tr>
                    <td>Number: </td>
                    <td><input type="number" placeholder="enter your number" name="number" id="number" path="number" /></td>
                </tr>
                 <tr>
                    <td>Aadhaar: </td>
                    <td><input type="number" placeholder="enter your aadhaar number" name="aadhaar" id="name" path="aadhaar" /></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><input type="text" placeholder="enter your address" name="address" id="address" path="address" /></td>
                </tr>    
                <tr>
                    <td colspan="2"><input type="submit" value="Save" onClick="return confirm('Are you sure you want to save?')" ></td>
                </tr>                    
            </table>
        </form>
    </div>

</body>
</html>