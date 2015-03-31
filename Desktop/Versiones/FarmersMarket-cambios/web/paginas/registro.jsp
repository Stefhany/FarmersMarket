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
        <meta charset="utf-8">
        <title>SIGAA | Inicio</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body>

        <header>
            <img src="../img/banner.png" alt="" class="col-xs-12">
        </header>
        <div class="col-xs-12" >
            <div class="nav"> 						
                <div class="nav"> 						
                        <ul id="bar" style="align:left;">
                            <li><a href="#">Inicio  | </a></li>
                            <li><a href="#">Información   |</a></li>
                            <li><a href="#">Fotos     |</a></li>
                            <li><a href="paginas/registro.jsp">Registrarte     |</a></li>
                            <li><a href="login.jsp">Iniciar sesión   |</a></li>
                        </ul>
                    </div>
            </div>	
        </div>
        <div class="container" style=" position:relative;
             height:250px;">
            <div name="registrarUsuario" style="width: 500px;  margin-top: 20px; margin-left: 320px;">
                <center>
                    <form class="form-horizontal" name="registrarUsuario" action="../Controlador" method="get">
                        <fieldset>
                            <legend style="text-align: center;">Registro de SIGAA</legend>
                        <div class="form-group">
                            <label for="txtnombre" class="col-sm-2 control-label">Nombres:</label>
                            <div class="col-sm-10">
                                <input type="text" id="txtnombre" name="txtnombre"  placeholder="Ingrese sus nombres" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtapellido" class="col-sm-2 control-label">Apellidos:</label>
                            <div class="col-sm-10">
                                <input type="text" id="txtapellido" name="txtpellido"  placeholder="Ingrese sus apellidos"
                                       required="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtcedula" class="col-sm-2 control-label">Cédula:</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtcedula" id="txtcedula" placeholder="Ingrese su cédula" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txttelefono" class="col-sm-2 control-label">Telefono:</label>
                            <div class="col-sm-10">
                                <input type="text" name="txttelefono" id="txttelefono" placeholder="Ingrese su telefono" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtdireccion" class="col-sm-2 control-label">Dirección:</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtdireccion" id="txtdireccion" placeholder="Ingrese su dirección" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtcorreo" class="col-sm-2 control-label">Correo:</label>
                            <div class="col-sm-10">
                                <input type="email" name="txtcorreo" id="txtcorreo"  placeholder="Ingrese su correo electrónico" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtcorreo" class="col-sm-2 control-label">Confirmar correo:</label>
                            <div class="col-sm-10">
                                <input type="email" name="txtcorreo" id="txtcorreo"  placeholder="Ingrese su correo electrónico" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtclave" class="col-sm-2 control-label">Contraseña:</label>
                            <div class="col-sm-10">
                                <input type="password" id="txtclave" name="txtclave" placeholder="Contraseña" 
                                       required="true" class="form-control"/>
                            </div> 
                        </div>

                        <div class="form-group">
                            <label for="txtconfirmar" class="col-sm-2 control-label">Confirmar Contraseña:</label>
                            <div class="col-sm-10">
                                <input type="password" id="txtconfirmar" name="txtconfirmar"  placeholder="Repita su contraseña" 
                                       required="true" class="form-control"/>
                            </div> 
                        </div>

                        <div class="form-group">
                            <label for="txtciudad" class="col-sm-2 control-label">Ciudad:</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtciudad" id="txtciudad" placeholder="Ingrese su ciudad" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="txtfechanacimiento" class="col-sm-2 control-label">Fecha de Nacimiento:</label>
                            <div class="col-sm-10">
                                <input type="date" id="txtfechanacimiento" name="txtfechanacimiento" 
                                       required="true" class="form-control"/>
                            </div>
                        </div>
                
            </div>
            </fieldset>
               <div style="width: 500px;  margin-top: 20px; margin-left: 320px; " >
            <label for="answer" class="col-sm-2 control-label"><img src="ocaptcha" /></label>
            <div class="col-sm-10">
                <input type="text" name="answer" id="answer" class="form-control input-lg" placeholder=" Ingrese los caracteres de la figura" required="true"><br>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label for="txtnotificacion">
                            <input type="checkbox" name="txtnotificacion" id="txtnotificacion"> Desea recibir notificaciones
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label for="txtTerminos">
                            <input type="checkbox"/><a href="terminos.jsp"> Leer términos y condiciones</a>
                        </label>
                        <div class="form-group" style="margin-left: 325px; margin-top: 10px;">
                <div>
                    <input type="hidden" name="rUsuario" id="rUsuario" value="" >
                    <button type="submit" value="Registrar" name="btnRegistrarUsuario" class="btn btn-default">Registrar</button>
                </div>
            </div>
                    </div>
                </div>
            </div>
            
        </div>
    </form>
</div>

<footer class="cnt" style="clear: both;">
    <nav>
        <ul>
            <li><a id="google" href="https://www.google.com.co">Google</a></li>
            <li><a id="facebook" href="https://www.facebook.com/">Facebook</a></li>
            <li><a id="twitter" href="https://twitter.com/">Twitter</a></li>
            <li><a id="instagram" href="http://instagram.com/">Instagram</a></li>
            <li><a id="winsports" href="http://www.minagricultura.gov.co/">MinAgricultura</a></li>
        </ul>
    </nav>
</footer>
</div>
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
