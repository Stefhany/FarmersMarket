<%-- 
    Document   : login
    Created on : 02-mar-2015, 9:57:03
    Author     : Mona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <title>SIGAA | Ingresar</title>
    </head>
    <body>
        <div class="container">
            <div class="row" >
                <header >
                    <img src="../img/banner.png" alt="" class="col-xs-12">
                </header>
                <div class="col-xs-12">
                    <div class="nav"> 						
                        <ul id="bar" style="align:left;">
                            <li><a href="../index.jsp">Inicio  | </a></li>
                            <li><a href="#">Información   |</a></li>
                            <li><a href="#">Fotos     |</a></li>
                            <li><a href="registro.jsp">Registrarte     |</a></li>
                        </ul>
                    </div>
                    <center >
                        <div class="session" style="padding-right: 500px; ">
                            <div name="ingresarSigaa" style="width: 500px; text-align: center; margin-left: 320px; " class="col-md-12">
                                <img src="../img/userf.png" style="width: 120px; height: 160px; margin-top: 50px; ">
                                <form name="ingresarSigaa" action="../cip" method="post" class="form-horizontal" style="padding-top: 15px;">
                                    <div class="form-group">
                                        <label for="txtCorreo" class="col-sm-2 control-label">Correo:</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="txtCorreo" name="txtCorreo" value="" size="40" 
                                                   placeholder="Correo electronico" class="form-control"/>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label for="txtClave" class="col-sm-2 control-label">Contraseña:</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="txtClave" placeholder="Password" class="form-control" size="40" id="txtCorreo" />
                                            <br>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <button type="submit" value="Ingresar" name="btnIngresar" class="btn btn-default">Ingresar</button>
                                            <br>
                                        </div>
                                    </div>
                                    <div id="prueba" style="color: red">
                                        <%
                                            // muestro el resultado del error al loguearse
                                            if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }
                                        %>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </center></div>	

                <footer class="cnt" style="clear: both; ">
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
        </div>

    </body>
</html>
