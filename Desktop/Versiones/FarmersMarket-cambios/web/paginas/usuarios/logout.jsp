<%-- 
    Document   : logout
    Created on : 24-feb-2015, 0:52:18
    Author     : Mona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar Sesión</title>
    </head>
    <body>
        <h1>Salir</h1>
        
        <%
         
            HttpSession misesion = request.getSession(false);
            
            if (misesion.getAttribute("usuarioLogueado") == null) {
                response.sendRedirect("../../index.jsp?msg");

            } else {
                misesion.removeAttribute("usuarioLogueado");
                misesion.invalidate();
                 response.sendRedirect("login.jsp?msg= Sesion cerrada");
            }
        %>    
    </body>
</html>
