<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
        <title>Uitgeleende materialen</title>
    </head>
    <body>

        <table>
            <tr>
                <th>No.</th>
                <th colspan="3">Materiaal</th>                
            </tr>
            <c:forEach items="${materialDetails}" var="entry" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td colspan="3">${entry.key.name}</td>                    
                </tr>
                <c:forEach items="${entry.value}" var="item">
                    <tr class="detail">
                        <td colspan="2">${item.user.name}</td>
                        <td>${item.amount}</td>
                        <c:if test="${item.late}">
                            <td class="late">${item.endDate}</td>
                        </c:if>
                        <c:if test="${!item.late}">
                            <td>${item.endDate}</td>
                        </c:if>

                    </tr>
                </c:forEach>

            </c:forEach>

        </table>
    </body>
</html>
