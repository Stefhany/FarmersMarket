<%-- 
    Document   : login
    Created on : 18-dic-2014, 9:38:02
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar</title>
    </head>
    <body>
        <h1 class="pacifico-masgrande">Entrar Farmers Market</h1>
        <form name="loguin"  method="POST" action="../Controlador">
            <label for="txtCorreo">Correo:</label>
            <input type="text" id="txtCorreo" name="txtCorreo" value='yova@hotmail.com'
                   placeholder="Ingrese su correo" required>

            <label for="txtClave">Clave:</label>
            <input type="password" id="txtClave" name="txtClave" value='yovanny'
                   placeholder="Ingrese su clave" required>

            <br>
            <label><a class="quitarlink pacifico" href="paginas/registro.jsp">Regístrate!</a></label>

            <input type="hidden" name="ingresarSistema" id="ingresarSistema" value="oo" >
            <input type="submit" value="Ingresar" name="btnIngresarSistema" id="btnIngresarSistema"/>
        </form> 
        <div class="style3">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>

        </div>
    </body>
</html>
