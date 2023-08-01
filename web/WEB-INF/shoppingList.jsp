<%-- 
    Document   : shoppingList
    Created on : 21-Jul-2023, 6:57:54 AM
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
            <p>You must register your username first.</p>
            <a href="register.jsp">Register</a>
        </c:if>
        <c:if test="${not empty sessionScope.username}">
            <p>Welcome, ${sessionScope.username}</p><a href="/ShoppingList?action=logout" >Logout</a>
            <form action="ShoppingList" method="post">
                <label for="item">Add item to shopping list: </label>
                <input type="text" name="item" id="item">
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add">
            </form>
            <h2>List:</h2>
            <c:if test="${empty sessionScope.shoppingList}">
                <p>No items in the shopping list.</p>
            </c:if>
            <c:if test="${not empty sessionScope.shoppingList}">
                <ul>
                    <c:forEach var="item" items="${sessionScope.shoppingList}">
                        <li>
                            <input type="radio" name="item" value="${item}">
                            ${item}
                        </li>
                    </c:forEach>
                </ul>
                <form action="ShoppingList" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="submit" value="Delete">
                </form>
            </c:if>
        </c:if>
    </body>
</html>
