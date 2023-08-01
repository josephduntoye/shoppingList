<%-- 
    Document   : register
    Created on : 21-Jul-2023, 6:57:37 AM
    Author     : king_wizard
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <c:if test="${empty sessionScope.username}">
            <form action="ShoppingList" method="post">
                Enter your username:<input type="text" name="username" id="username">
                <input type="hidden" name="action" value="register">
                <input type="submit" value="Register name">
            </form>
        </c:if>
    </body>
</html>
