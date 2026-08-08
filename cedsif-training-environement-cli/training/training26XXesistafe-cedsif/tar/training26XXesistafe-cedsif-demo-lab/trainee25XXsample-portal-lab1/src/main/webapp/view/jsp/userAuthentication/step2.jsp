<%-- 
    Document   : step1
    Created on : Aug 18, 2023, 10:19:25 AM
    Author     : shifu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="ce23XXshifu"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <ce23XXshifu:out value="Authentication and Authorization process ${status} to user "/> <i style="color: red; border: black"><ce23XXshifu:out value="${autheticatedUser}"/></i>
        <a href="" onclick="this"/><i style="color: black; border: black"></br>${action}</i>
    </body>
</html>
