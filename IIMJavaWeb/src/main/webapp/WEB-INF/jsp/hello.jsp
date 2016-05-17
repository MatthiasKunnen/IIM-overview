<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:_layout title="Home - IIM">
    <jsp:attribute name="body_area">
        <h1>Welkom ${username} op het IIM overzicht!</h1>


        <c:url var="currentlyLendOut" value="lists/lendOutMaterials.htm"/>
        <a class="home-link" href="${currentlyLendOut}">
            <div class="well hidden-xs">
                <h3>Bekijk de uitgeleende materialen</h3>
                <p>Hier vind u een lijst van de uitgeleende materialen</p>
            </div>
        </a>

        <c:url var="pickupUrl" value="lists/pickupList.htm"/>
        <a class="home-link" href="${pickupUrl}">
            <div class="well hidden-xs">
                <h3>Bekijk de gereserveerde materialen</h3>
                <p>Hier vind u een lijst van de gereserveerde materialen</p>
            </div>
        </a>
    </jsp:attribute>  
</t:_layout>