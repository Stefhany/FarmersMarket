<%-- 
    Document   : index
    Created on : 02-mar-2015, 8:35:28
    Author     : Mona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>SIGAA | Inicio</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="img/favicon.ico" type="image/x-ico"/>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <style>
            img {
                width: 100%;
                margin-top: -20px;	
            }
        </style>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body>
        <div class="container" >
            <div class="row" >
                <header >
                    <img src="img/banner.png" alt="" class="col-xs-12">
                </header>

                <!-- class="col-xs-12" -->
                <div class="col-xs-12">
                    <div class="nav"> 						
                        <ul id="bar" style="align:left;">
                            <li><a href="index.jsp">Inicio  | </a></li>
                            <li><a href="#">Información   |</a></li>
                            <li><a href="#">Fotos     |</a></li>
                            <li><a href="paginas/filtro.jsp">Búsqueda   |</a></li>
                            <li><a href="paginas/registro.jsp">Registrarte     |</a></li>
                            <li><a href="paginas/login.jsp">Iniciar sesión   |</a></li>
                        </ul>
                        
                    </div>
                    <center>
                        <div class="col-xs-12" style="margin-top: 20px; margin-bottom: 20px;">
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <img src="img/fotosindex/17.jpg" alt="..." class="img-responsive">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="img/fotosindex/18.jpg" alt="..." class="img-responsive">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="img/fotosindex/19.jpg" alt="..." class="img-responsive">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="img/fotosindex/20.jpg" alt="..." class="img-responsive">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
                                </div>
                                <!-- Controls -->
                                <a>  </a>
                                <a>  </a>
                            </div>
                        </div>	
                    </center>
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
        </div>
    </body>
</html>
