<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:_layout title="Home - IIM">
    <jsp:attribute name="body_area">
        <h1>Welkom ${username} op het IIM overzicht!</h1>
        <div>  
            <h3>Acties</h3>

            <c:url var="currentlyLendOut" value="lists/lendOutMaterials.htm"/>
            <form action="${currentlyLendOutUrl}" method="get">
                <input class="button" type="submit" value="Bekijken" />                          
            </form>

            <c:url var="pickupUrl" value="lists/pickupList.htm"/>
            <form action="${pickupUrl}" method="get">
                <input class="button" type="submit" value="Bekijken" />                            
            </form> 

            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input class="button" type="submit" value="Log uit" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>            
            </form>

    </jsp:attribute>  
</t:_layout>