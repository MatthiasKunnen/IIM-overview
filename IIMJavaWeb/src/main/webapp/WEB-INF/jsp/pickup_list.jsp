<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Op te halen materialen</title>
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
    </head>
    <body>
        De reserveringen met startdatum:
        <form method="post" action="">
            <input type="datepicker" name="date" value="${date}" />
            <button type="submit">Vernieuw</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Gebruiker</th>
                    <th>Materiaal</th>
                    <th>Aantal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservationList}" var="entry" varStatus="status">
                    <c:forEach items="${entry.value}" var="detail" varStatus="detailStatus">
                        <tr>
                            <c:if test="${detailStatus.index == 0}">
                                <td rowspan="${fn:length(entry.value)}">${entry.key.name}</td>
                            </c:if>
                            <td>${detail.materialName}</td>
                            <td>${detail.amount}</td> 
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>