<%-- 
    Document   : perfil
    Created on : 02-mar-2015, 8:42:05
    Author     : Mona
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="daos.UsuariosDAO"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
        <title>SIGAA | Inicio</title>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>

        <%
            //response.setHeader("Cache-Control", "no-cache");
            //response.setHeader("Cache-Control", "no-store");
            //response.setDateHeader("Expires", 0);
        %>
        <%
//            HttpSession miSesion = request.getSession(false);
  //          if (miSesion.getAttribute("usr") != null) {
    //            UsuariosDTO userdto = (UsuariosDTO) miSesion.getAttribute("usr");
      //          String menu = (String) miSesion.getAttribute("mp");
        %>
        
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>                        
                    </ul>
                    <ul id="bar"  style="float:left;">
                        <li><a href="perfil.jsp">Inicio</a></li>                        
                    </ul>

                    <ul id="bar"  style="float:left;">
                        <li><a href="../ofertas/filtro.jsp">Búsqueda</a></li>                        
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 94%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 360px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>

                                    </center>   
                                </div>
                            </div>    
                            <div class="submenu"  style="width: 15%; height: 400px; right: 75%;float: left;">
                                <div id="submenu">
                                    <div class="barraleft">
                                        <div class="panel-body">
                                            <%
                
                                                 //   out.println(menu);

                                                //} else {
                                                  //  response.sendRedirect("../index.jsp");
                                                //}
                                                //class="text-left"
                                            
                                                UsuariosDAO user = new UsuariosDAO();
                                                ArrayList<String> lista = user.validarUsuario("yova@hotmail.com", "yovanny");
                                                        
                                                for (String url : lista) {
                                                    if (!url.substring(url.length() - 4, url.length()).equals(".jsp")) {
                                                        out.println(url + "<br>");
                                                    } else {
                                            %>
                                            <a href="<%out.print(request.getContextPath() + "/" + url);%>">texto</a><br/>
                                            <%}}%>
                                                                               </div>   
                                    </div>
                                </div>
                            </div>
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
    </body>
</html>
