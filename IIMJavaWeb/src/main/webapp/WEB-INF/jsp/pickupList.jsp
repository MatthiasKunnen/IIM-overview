<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
=======
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
>>>>>>> Stashed changes
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
        <jsp:useBean id="now" class="java.util.Date" />
        <p>Dit zijn de materialen die gereserveerd zijn voor <b><fmt:formatDate pattern="dd MMM yy" value="${date}" /></b></p>
        <table>
            <tr>
                <th>Aantal</th>
                <th>Materiaal</th>
                <th>Plaats</th>
                <th>Gereserveerd door</th>
            </tr>
            <c:forEach items="${reservationList}" var="reservation" varStatus="status">
                <c:forEach items="${reservation.getReservationDetails()}" var="detail" varStatus="status">
                    <tr>
                        <td>${detail.amount}</td> 
                        <td>${detail.getMaterial().getName()}</td>
                        <td>${detail.getMaterial().getPlaats()}</td>
                        <td><c:out value="${reservation.user.getFirstname()} ${reservation.user.getLastname()}"/></td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </table>
    </body>
</html>