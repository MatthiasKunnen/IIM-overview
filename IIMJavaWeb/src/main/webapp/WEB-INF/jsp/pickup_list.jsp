<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout title="Op te halen materialen - IIM">
    <jsp:attribute name="body_area">
        <h1>De reserveringen met startdatum ${date}</h1>
        <form action="pickupList" class="form-inline search-function hijax" method="get">
            <div class="form-group">
                <label class="sr-only" for="datepicker">Datum:</label>
                <input id="datepicker" type="text" class="form-control" name="date" value="${date}" placeholder="Datum" required="required">
            </div>
            <input type="submit" class="btn btn-default" value="Vernieuw">
        </form>
        <table class="table">
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
                                <td rowspan="${fn:length(entry.value)}" class="text-center" style="vertical-align: middle;">${entry.key.name}</td>
                            </c:if>
                            <td>${detail.materialName}</td>
                            <td>${detail.amount}</td> 
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
        <spring:url value="/scripts" var="scriptUrl"/>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="${scriptUrl}/date-picker.js"></script>
    </jsp:attribute>
</t:_layout>
