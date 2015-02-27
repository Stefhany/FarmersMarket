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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <title>Farmers Market | Iniciar sesión</title>
    </head>
    <body>
        <h1 class="pacifico-masgrande">Iniciar sesión</h1>
        <img class="imagen" src="../imagenes/logoFM.png" title="logo de Farmers Market">
        <form name="loguin"  method="POST" action="../Controlador">
            <label for="txtCorreo">Correo:</label>
            <input type="text" id="txtCorreo" name="txtCorreo" 
                   placeholder="Ingrese su correo" required>

            <label for="txtClave">Clave:</label>
            <input type="password" id="txtClave" name="txtClave" 
                   placeholder="Ingrese su clave" required>

            <br>
            <label><a class="quitarlink pacifico" href="registro.jsp">Regístrate!</a></label>
            <div class="col-md-4">
            <input type="hidden" name="ingresarSistema" id="ingresarSistema" value="oo" >
            <input class="btn btn-success" type="submit" value="Ingresar" name="btnIngresarSistema" id="btnIngresarSistema"/>
        </form> 
            </div>
        
        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>

        </div>
    </body>
</html>
