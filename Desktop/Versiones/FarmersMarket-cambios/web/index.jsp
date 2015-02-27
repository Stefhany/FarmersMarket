<%-- 
    Document   : index
    Created on : 10/12/2014, 10:22:50 PM
    Author     : krito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Farmers Market</title>
        <!-- bootstrap 3.0.2-->
        <!-- <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> -->


        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />

        <link href="styles/base.css" rel="stylesheet" type="text/css" media="screen" />

        <link href="images/favicon.ico" rel="icon" type="image/x-ico" />

        <!-- Bootstrap -->
        <!-- <script src="js/bootstrap.min.js" type="text/javascript"></script> -->

        <script type="text/javascript" src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>

        <script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#pikame").PikaChoose();
            });
        </script>
    </head>
</head>

<body>
    <header>
    </header>
    <div id="contenedor">
        <header>

            <hgroup class="intro">
                <h1 class="title">Farmers Market </h1>
            </hgroup>
            <hgroup class="logo">
                <img src="images/logoFM.png">
            </hgroup>

            <div class="Iniciar">
                <a class="btn btn-success" href="paginas/login.jsp" role="button" >Iniciar sesion</a>
            </div>

        </header>
        <div class="wrapper">
            <div class="pikachoose">
                <ul id="pikame">
                    <li><a href=""><img src="images/home/17.jpg" alt=" verduras" /></a></li>
                    <li><a href=""><img src="images/home/18.jpg" alt="" /></a></li>
                    <li><a href=""><img src="images/home/19.jpg" alt="" /></a></li>
                    <li><a href=""><img src="images/home/20.jpg" alt="" /></a></li>
                </ul>
            </div>

            <div class="clear"></div>
            <div class="border"></div>
            <div class="imagen-conten">
                <h3>Super Mercados</h3>
                <img src="images/home/15.jpg" width="300" alt="verduras" />
                <p>Este sistema de informacion estara disponibel para todos tipo de vendedores, distribuidores y clientes</p>
            </div>
            <div class="imagen-conten">
                <h3>Plazas de mercado</h3>
                <img src="images/home/14.jpg" width="300" alt="" />
                <p>Este sistema de informacion estara disponibel para todos tipo de vendedores, distribuidores y clientes</p>
            </div>
            <div class="imagen-conten">
                <h3>Tiendas de barrio</h3>
                <img src="images/home/13.jpg" width="300" alt="" />
                <p>Este sistema de informacion estara disponibel para todos tipo de vendedores, distribuidores y clientes</p>
            </div>
            <div class="border2"></div>
            <br />
            <aside id="pricing-table" class="clear">
                <div class="plan">
                    <h3>Papa<span>$1.200</span></h3>
                    <a class="button" href="">Order Now</a>
                    <ul>
                        <li><strong style="text-transform:uppercase">ultimo precion</strong> 1.100</li>
                        <li><strong style="text-transform:uppercase">penultimo precion</strong> 1.000</li>
                        <li><strong style="text-transform:uppercase">precio anterior</strong> 1.200</li>
                        <li><strong style="text-transform:uppercase">precio anterior</strong> 800</li>
                    </ul>
                </div>
                <div class="plan">
                    <h3>Apio<span>$600</span></h3>
                    <a class="button" href="">Order Now</a>
                    <ul>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                    </ul>
                </div>
                <div class="plan">
                    <h3>Yuca<span>$900</span></h3>
                    <a class="button" href="">Order Now</a>
                    <ul>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                        <li><strong style="text-transform:uppercase">lorem Ipsum</strong> Dolor Sit Amet</li>
                    </ul>
                </div>
            </aside>
        </div>
        <footer>
            <div class="border"></div>
            <div class="footer-widget">
                <h4>Some Title</h4>
                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. </p>
            </div>
            <div class="footer-widget">
                <h4>From The Blog</h4>
                <ul class="blog">
                    <li><a href="#">Lorem Ipsum Dolor</a><br/>
                        Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                    <li><a href="#">Praesent Et Eros</a><br/>
                        Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                    <li><a href="#">Suspendisse In Neque</a><br/>
                        Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                    <li><a href="#">Suspendisse In Neque</a><br/>
                        Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                </ul>
            </div>
            <div class="footer-widget">
                <h4>We Are Social!</h4>
                <div id="social"> <a href="http://twitter.com/priteshgupta" class="s3d twitter" target="_blank"> Twitter <span class="icons twitter"></span> </a> <a href="http://www.facebook.com/priteshgupta" class="s3d facebook" target="_blank"> Facebook <span class="icons facebook"></span> </a> <a href="http://forrst.com/people/priteshgupta" class="s3d forrst" target="_blank"> Forrst <span class="icons forrst"></span> </a> <a href="http://www.flickr.com/photos/priteshgupta" class="s3d flickr" target="_blank"> Flickr <span class="icons flickr"></span> </a> <a href="#" class="s3d designmoo" target="_blank"> Designmoo <span class="icons designmoo"></span> </a> </div>
            </div>
            <div class="border2"></div>
            <br />
            <span class="copyright"><span class="left"><br />
                    &copy;© Copyright 2014 - Todos los derechos reservados - <a href="#">Farmers Market</a></span><span class="right"><br />
                    Diseña por <a href="http://www.priteshgupta.com">Stefhany Alfonso - Sebastian Mondragon</a><br />
                    <br>
                    <br />
                </span></span></footer>
    </div>
</body>
</html>
<%if (request.getParameter("msg") != null) {

%>
<div class="confirmarOK"><%=request.getParameter("msg")%></div>        

<%
    }
%>
</body>
</html>
