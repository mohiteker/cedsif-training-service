<%-- 
    Document   : chooseModule
    Created on : Apr 2, 2014, 3:33:36 PM
    Author     : Izilda Paz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; charset=ISO-8859-1; text/xml">
        <title>Select Module</title>

        <style type="text/css">
            th{
                text-align: left;
            }

            fieldset{
                width: 300px;
                margin-left: 500px;
                margin-top: 300px;
            }

            .resizeRow{
                width:50px;
            }

            table{
                width: 500px;
            }
            
            legend {
                background-color: lightsalmon;
                color: lightsalmon;
            }
        </style>
    </head>
    <body>
    <div id="module">
        <form action="${pageContext.request.servletContext.contextPath}/servlet/ChooseModule"  method="get">
            <fieldset>
                <legend>XXXXXX</legend>
                <table border="0px">
                    <tr>
                        <th>&nbsp;</th>
                        <th>
                            <select name="module">
                                <option value="selection"><c:out value="<<Selecione o Módulo>>"/></option>
                                <c:forEach items="${modules}" var="module">
                                    <option value="${module.id}">${module.description}</option>
                                </c:forEach>
                            </select>
                        </th>
                    </tr>
                    
                </table>
                
            </fieldset>

        </form>

    </div>

    <div id="submitbutton"></div>
</body>
</html>