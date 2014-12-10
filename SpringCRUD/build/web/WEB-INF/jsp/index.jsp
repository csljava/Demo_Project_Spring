<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>

    <body>
        <h3>Login Form</h3>
        <h4>${message}</h4>
        <spring:nestedPath path="uname">
            <form:form method="post" commandName="users">
                <table>
                    <tr><td>User Name:</td> 
                        <td><spring:bind path="uname">
                                <input type="text" name="${status.expression}" value="${status.value}" required="true">                        
                            </spring:bind>
                        </td>
                    </tr>
                    <tr><td>Password: </td>
                        <td><spring:bind path="pass">
                                <input type="password" name="${status.expression}" value="${status.value}" required="true">                        
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login"></td>
                    </tr>
                    <tr><td></td>
                        <td><a href="userReg.htm">Click here</a> For Registration.</td>
                    </tr>
                    
                </table>
            </form:form>
        </spring:nestedPath>
   </body>
</html>
