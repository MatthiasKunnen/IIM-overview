<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout title="Login - IIM">
    <jsp:attribute name="body_area">
        <div>
            <h2>Log in</h2>
            <div class="row">
                <div class="col-md-8">
                    <section id="loginForm">
                        <form action="<c:url value='/login' />" class="form-horizontal" method="post" role="form" >
                            <h4>Gebruik uw IIM account om in te loggen</h4>
                            <hr/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="username">Gebruikersnaam</label>
                                <div class="col-md-10">
                                    <input class="form-control" data-val="true" data-val-required="Het veld voor de gebruikersnaam is verplicht" id="username" name="username" type="text" value="" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="password">Wachtwoord</label>
                                <div class="col-md-10">
                                    <input class="form-control" data-val="true" data-val-required="Het wachtwoordveld is verplicht" id="password" name="password" type="password" autocomplete="off">
                                    <span class="field-validation-valid text-danger" data-valmsg-for="Password" data-valmsg-replace="true"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <input type="submit" value="Log in" class="btn btn-default">
                                </div>
                            </div>
                        </form>        
                    </section>
                </div>
            </div>
        </div>
    </jsp:attribute>
</t:_layout>