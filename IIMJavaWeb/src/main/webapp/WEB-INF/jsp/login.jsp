<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <spring:url value="/css/style.css" var="urlCss"/>
        <link rel="stylesheet" href="${urlCss}" type="text/css" />
    </head>

    <body>
        <h1>IIM</h1>
        <div id="login-box">
            <h3>Log in</h3>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>
            <form name='loginForm' action="<c:url value='/login' />" method='POST'>
                <table>
                    <tr>
                        <td>Gebruikersnaam:</td>
                        <td><input type='text' name='username'></td>
                    </tr>
                    <tr>
                        <td>Wachtwoord:</td>
                        <td><input type='password' name='password' /></td>
                    </tr>
                    <tr>
                        <td colspan='2'>
                            <input class="button" name="submit" type="submit" value="Log in" />
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>

    </body>
</html>