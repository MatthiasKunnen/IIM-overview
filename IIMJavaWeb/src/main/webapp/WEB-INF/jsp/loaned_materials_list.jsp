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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <title>Uitgeleende materialen</title>
        
    </head>
    <body>

        <c:url var="currentlyLendOut" value="lendOutMaterials.htm"/>
        <form action="${currentlyLendOut}" method="get">
            <p>Date: <input type="text" id="datepicker" name="date" required="true" value="${date.day}-${date.month}-${date.year}"> <input class="button" type="submit" value="Pas aan" /></p>
        </form>

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

        <spring:url value="/scripts" var="scriptUrl"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="${scriptUrl}/date-picker.js"></script>
        
    </body>
</html>
