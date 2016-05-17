<!DOCTYPE html>
<%@tag description="Default layout" pageEncoding="UTF-8"%>
<%@attribute name="title"%>
<%@attribute name="head_area" fragment="true" %>
<%@attribute name="body_area" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/" var="root"/>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${title}</title>
        <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${root}css/style.css" type="text/css" />
        <jsp:invoke fragment="head_area"/>     
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${root}welcome">IIM</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="${root}lists/lendOutMaterials.htm">Uitleningen</a></li>
                        <li><a href="${root}lists/pickupList">Ophalen</a></li>
                    </ul>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="user" property="principal" />
                        <form action="${root}logout" class="navbar-right" id="logoutForm" method="post">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#" onclick="return false;" title="Hallo ${user.username}">Hallo ${user.username}!</a>
                                </li>
                                <li><a href="javascript:document.getElementById('logoutForm').submit()">Afmelden</a></li>
                            </ul>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </sec:authorize>
                </div>
            </div>
        </div>
        <div class="container body-content">
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="alert alert-success">${msg}</div>
            </c:if>
            <jsp:invoke fragment="body_area"/>
            <hr>
            <footer class="text-center">
                <p>© 2016 - IIM</p>
            </footer>
        </div>
    </body>
</html>