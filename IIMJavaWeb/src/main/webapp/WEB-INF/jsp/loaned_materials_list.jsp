<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <spring:url value="/css/style.css" var="urlCss"/>
        <title>Uitgeleende materialen</title>
    </head>
    <body>

        <table>
            <tr>
                <th>No.</th>
                <th colspan="2">Materiaal</th>
                <th>Aantal</th>
            </tr>
            <c:forEach items="${materialDetails.keySet}" var="material" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${material.name}</td>
                    <td>${material.amount}</td>
                </tr>
                <c:forEach items="$materialDetails[material]" var="detail">
                    <tr>
                        <td colspan="2">${detail.user.name}</td>
                        <td>${detail.amount}</td>
                        <c:if test="${detail.late}">
                            <td class="late">${detail.endDate}</td>
                        </c:if>
                        <c:if test="${!detail.late}">
                            <td>${detail.endDate}</td>
                        </c:if>

                    </tr>
                </c:forEach>

            </c:forEach>

        </table>
    </body>
</html>
