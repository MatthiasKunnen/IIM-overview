<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello</title>
    </head>
    <body>
        <h3>Message : ${message} </h3>	

        <form action="next.htm" method="post">
            <input type="submit" value="Next" />
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            
        </form>

    </body>
</html>