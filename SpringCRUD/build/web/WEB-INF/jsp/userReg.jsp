<%-- 
    Document   : reg
    Created on : Dec 1, 2014, 9:19:51 AM
    Author     : ATM HASAN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new User</title>
    </head>
    <body>
        <h3>User Registration Form</h3>
        <spring:nestedPath path="uform">
            <form:form method="post" commandName="users">
                Name: 
                <spring:bind path="uname">
                    <input type="text" name="${status.expression}" value="${status.value}" required="true">                        
                </spring:bind>
                Password: 
                <spring:bind path="pass">
                    <input type="password" name="${status.expression}" value="${status.value}" required="true">                        
                </spring:bind>
                Email: 
                <spring:bind path="email">
                    <input type="text" name="${status.expression}" value="${status.value}" required="true">                        
                </spring:bind>
                    <input type="submit" value="Register">
            </form:form>
            
        </spring:nestedPath>
    </body>
</html>