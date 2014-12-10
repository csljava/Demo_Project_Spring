<%-- 
    Document   : user
    Created on : Nov 30, 2014, 12:19:33 PM
    Author     : ATM HASAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${message}</title>
    </head>
    <body>
    <center>
        <h1>${message}</h1><br>
        <h2>All Employee Details</h2>
        <table border="1px">
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Date of Birth</th>
                <th>Email</th>
            </tr>
            <c:forEach items="${employees}" var="emp">
                <tr>
                    <td><c:out value="${emp.empId}"/></td>
                    <td><c:out value="${emp.name}"/></td>
                    <td><c:out value="${emp.dob}"/></td>
                    <td><c:out value="${emp.email}"/></td>
                </tr>
            </c:forEach>
        </table>
        <a href="index.htm">Logout</a>
    </center>
</body>
</html>
