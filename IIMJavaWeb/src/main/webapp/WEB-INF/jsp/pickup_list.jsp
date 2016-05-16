<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Op te halen materialen</title>
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
    </head>
    <body>
        <!-- <%-- <spring:url value="/scripts/jquery-1.7.1.js" var="jquery_url" /> 
        <spring:url value="/scripts/jquery-ui-1.8.16.custom.min.js" var="jquery_ui_url" />          
        <spring:url value="/styles/custom-theme/jquery-ui-1.8.16.custom.css" var="jquery_ui_theme_css" />     

        <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_theme_css}"/>        
        <script src="${jquery_url}" type="text/javascript"><jsp:text/></script>
        <script src="${jquery_ui_url}" type="text/javascript"><jsp:text/></script>

        <script type="text/javascript">
            $(function () {
                $('#startDate').datepicker({
                    dateFormat: 'dd-mm-yy',
                    changeYear: true
                });
            });
        </script>
        <form:form modelAttribute="reservation" method="post" >
            <form:input path="startDate" size = "20"/>
            <form:errors path="startDate" cssClass="error"/>
            <input type="submit" align="center" value="Save"/>
        </form:form>--%>-->
        
        <p>De reserveringen met startdatum: ${date}</b></p>
        <table>
            <tr>
                <th>Gebruiker</th>
                <th>Materiaal</th>
                <th>Aantal</th>
            </tr>
            <c:forEach items="${reservationList}" var="entry" varStatus="status">
                <tr>
                    <c:if test="${status.index = 0}">
                        <td rowspan="${entry.Values.size()}">${entry.Key.getName()}</td>
                    </c:if>
                    <c:forEach items="${entry.Values}" var="detail">
                        <td>${detail.materialName}</td>
                        <td>${detail.amount}</td> 
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>