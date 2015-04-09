<%-- 
    Document   : filtro
    Created on : 26-feb-2015, 14:56:58
    Author     : Mona
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.Consultas"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Búsqueda</title>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="../usuarios/logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 520px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Consultar ofertas</h1>
                                        <div name="filtro" style="width: 500px;">
                                            <form name="filtro" action="../cc" class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="txtProductor" class="col-sm-2 control-label">Nombre Productor:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtProductor" id="txtProductor" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtProducto" class="col-sm-2 control-label">Nombre Producto:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtProducto" id="txtProducto" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtFecha" class="col-sm-2 control-label">Fecha ofertas:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtFecha" id="txtFecha" type="date" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" value="Consultar" name="consultar" class="btn btn-default">Consultar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </center>   
                                </div>

                            </div>    
                            <div class="submenu"  style="border: 1px solid #000; width: 15%; height: 520px; right: 20%;float: left; ">

                                <div id="submenu">
                                    <div class="barraleft" >

                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                HttpSession miSesion = request.getSession(false);
                                                if (miSesion.getAttribute("usr") != null) {
                                                    UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                                                    String menu = (String) miSesion.getAttribute("mp");

                                                    out.print("Usuario : " + uregistrado.getNombres());
                                                    out.println(menu);

                                                } else {
                                                    response.sendRedirect("../index.jsp");
                                                }
                                                //class="text-left"
                                            %>


                                        </div>   


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </center>
            </div>	 			
            <footer class="cnt"> Pie de Pagina </footer> 
        </div>  
        <script type="text/javascript">
            <!--
                    var pager = new Pager('results', 6);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            //--></script>
        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>

        </div>
    </body>
</html>
