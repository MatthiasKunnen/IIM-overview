<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Welkom - IIM</title>
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
    </head>
    <body>
        <h1>Welkom ${username} op het IIM overzicht!</h1>
        <div>  
            <h3>Acties</h3>

            <c:url var="pickupUrl" value="lists/pickupmaterials.htm"/>
            <form action="${pickupUrl}" method="get">
                <input class="button" type="submit" value="Wat moet maandag weg?" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>            
            </form>

            <c:url var="bringbackUrl" value="lists/bringbackmaterials.htm"/>
            <form action="${bringbackUrl}" method="get">
                <input class="button" type="submit" value="Wat moet vrijdag terug?" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>            
            </form>

            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input class="button" type="submit" value="Log uit" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>            
            </form>
        </div>
    </body>
</html>