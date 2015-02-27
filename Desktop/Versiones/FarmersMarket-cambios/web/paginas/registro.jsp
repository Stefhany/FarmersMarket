<%-- 
    Document   : registro
    Created on : 8/12/2014, 06:34:53 PM
    Author     : SEBAS
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" type="text/css" href="../dist/css/bootstrap.css">
        <title>Farmers Market | Registro Usuario</title>
    </head>
    <body>


        <h1 class="pacifico-masgrande">Regístrate a Farmers Market</h1>
        <br>

        <form name="registrarUsuario" action="captchaSubmit.jsp" method="get"> 
            <div class="form-group">
                    <label for="txtnombre">Nombres:</label>
                    <input type="text" id="txtnombre" name="txtnombre"  placeholder="Ingrese sus nombres" required>

                    <label for="txtapellido">Apellidos:</label>
                    <input type="text" id="txtapellido" name="txtpellido"  placeholder="Ingrese sus apellidos" required>

                    <label for="txtcedula">Cédula:</label>
                    <input type="text" name="txtcedula" id="txtcedula" placeholder="Ingrese su cédula" required>

                    <label for="txttelefono">Telefono:</label>
                    <input type="text" name="txttelefono" id="txttelefono" placeholder="Ingrese su telefono" required/>

                    <label for="txtdireccion">Dirección:</label>
                    <input type="text" name="txtdireccion" id="txtdireccion" placeholder="Ingrese su dirección" required />

                    <label for="txtcorreo">Correo:</label>
                    <input type="email" name="txtcorreo" id="txtcorreo"  placeholder="Ingrese su correo electrónico" required/>

                    <label for="txtcorreo">Confirmar correo:</label>
                    <input type="email" name="txtcorreo" id="txtcorreo"  placeholder="Ingrese su correo electrónico" required/>

                    <label for="txtclave">Contraseña:</label>
                    <input type="password" id="txtclave" name="txtclave"  placeholder="Contraseña" required>

                    <label for="txtconfirmar">Confirmar Contraseña:</label>
                    <input type="password" id="txtconfirmar" name="txtconfirmar"  placeholder="Repita su contraseña" required>

                    <label for="txtnotificacion">Notificaciones :</label>
                    <input type="checkbox" name="txtnotificacion" id="txtnotificacion" >

                    <label for="txtciudad">Ciudad:</label>
                    <input type="text" name="txtciudad"  id="txtciudad" placeholder="ciudad alojamiento" required >

                    <label for="txtfechanacimiento">Fecha de Nacimiento:</label>
                    <input type="date" id="txtfechanacimiento" name="txtfechanacimiento" required><br>

                    <label for="answer" class="col-sm-2 control-label"><img src="ocaptcha" /></label>
                    <div class="col-sm-10">
                        <input type="text" name="answer" id="answer" class="form-control input-lg" placeholder=" Ingrese los caracteres de la figura" required="true"><br>
                    </div>

                    <input type="hidden" name="rUsuario" id="rUsuario" value="" >
                    <input type="submit" value="Registrar" name="btnRegistrarUsuario" >
                </div>
        </form>


        <%
            if (request.getParameter("msg") != null) {

        %>
        <div class="confirmarOK"><%out.println(request.getParameter("mgs"));%></div>        

        <%
            }
            // si es null el objeto, es decir, no se ha creado aun, no mostramos nada
%>

    </body>
</html>
