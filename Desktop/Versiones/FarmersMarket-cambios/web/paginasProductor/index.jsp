<%-- 
    Document   : index
    Created on : 26-feb-2015, 20:22:30
    Author     : Mona
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido</h1>

        <%
        HttpSession miSesion=request.getSession(false);
        if(miSesion.getAttribute("usr")!=null){
            UsuariosDTO uregistrado = (UsuariosDTO)miSesion.getAttribute("usr");
            String menu = (String)miSesion.getAttribute("mp");

            out.print("Usuario : "+uregistrado.getNombres()+" "+uregistrado.getApellidos());
            out.println(menu);

        }else{
           response.sendRedirect("../index.jsp");
        }
        %>
    </body>
</html>
