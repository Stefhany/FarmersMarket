<%-- 
    Document   : loginFinal
    Created on : 26-feb-2015, 18:57:04
    Author     : Mona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Iniciar sesión</title>
    </head>
    <body>
        <h1>Iniciar sesión</h1>
        <form name="ingresarFM" action="../cu" method="get">
            
            <label for="txtCorreo">Correo:</label>
            <input type="text" id="txtCorreo" name="txtCorreo" value="" size="40" placeholder="Correo electronico"/>
            <br>            
            <label for="txtClave">Clave:</label>
            <input type="password" name="txtClave" placeholder="Clave" value="" size="40" />
            <br>
            <input type="hidden" name="ingresar" id="ingresar"/>
            <br>
            <input type="submit" value="Ingresar" name="btnIngresar" id="btnIngresar"/>
            <br>
            
            <div id="prueba" style="color: red">
                <%
                    // muestro el resultado del error al loguearse
                    if (request.getParameter("msg") != null) {
                        out.println(request.getParameter("msg"));
                    }

                %>   
            </div>
        </form>
    </body>
</html>
