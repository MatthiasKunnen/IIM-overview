<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:_layout title="Uitgeleende materialen - IIM">
    <jsp:attribute name="body_area">

        <h1>Gewenste datum</h1>
        <form action="lendOutMaterials" class="form-inline search-function hijax" method="get">
            <div class="form-group">
                <label class="sr-only" for="datepicker">Datum:</label>
                <input type="text" class="form-control datepicker" name="date" value="${date}" placeholder="Datum" required="required">
            </div>
            <input type="submit" class="btn btn-default" value="Vernieuw">
        </form>

        <table class="table">
            <thead>
                <tr>
                    <th>Materiaal</th>
                    <th>Gebruiker</th>
                    <th>Aantal</th>
                    <th>Terugbrengdatum</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${materialDetails}" var="entry" varStatus="status">
                    <c:forEach items="${entry.value}" var="item" varStatus="itemStatus">
                        <tr>
                            <c:if test="${itemStatus.index == 0}">
                                <td rowspan="${fn:length(entry.value)}" class="text-center" style="vertical-align: middle;">${entry.key.name}</td>
                            </c:if>
                            <td>${item.user.name}</td>
                            <td>${item.amount}</td>
                            <td <c:if test="${item.late}"> class="late"</c:if>>${item.endDate}</td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>

        <spring:url value="/scripts" var="scriptUrl"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="${scriptUrl}/date-picker.js"></script>
        <script src="${scriptUrl}/datepicker-nl-BE.js"></script>
    </jsp:attribute>

</t:_layout>