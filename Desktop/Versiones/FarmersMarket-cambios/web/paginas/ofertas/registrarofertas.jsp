<%-- 
    Document   : registrarofertas
    Created on : 10/12/2014, 10:20:06 PM
    Author     : krito
--%>

<%@page import="daos.Consultas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="daos.OfertasDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" errorPage="error.jsp">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>Farmers Market | Registrar Oferta</title>

        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");

                ProductosAsociadosUsuariosDAO padao = new ProductosAsociadosUsuariosDAO();
                ArrayList<ProductosAsociadosUsuariosDTO> productos = new ArrayList();
                productos = padao.listarProductosByUser(uregistrado.getIdUsuarios());
        %>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:left;">
                        <li><a href="../../index.jsp">Inicio</a></li>
                    </ul>						
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 360px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <div name="filtro" style="width: 460px;">
                                            <h1 style="text-align: center;">Registrar oferta</h1>
                                            <form action="../../co" name="regOferta">     
                                                <div class="form-group">
                                                    <label for ="txtProductoAsociado" class="col-sm-2 control-label">Nombre producto:</label>
                                                    <div class="col-sm-10">
                                                        <select name="txtProductoAsociado" class="form-control">
                                                                <% for (ProductosAsociadosUsuariosDTO pro : productos) {%>
                                                                <option value="<%if (pro != null) {
                                                                        out.print(pro.getIdProductosAsociadosUsuarios());
                                                                    }%>">
                                                                <%if (pro != null) {
                                                                        out.print(pro.getProducto().getNombre());
                                                                    }%></option>
                                                                <%
                                                                    }
                                                                %>
                                                        </select>
                                                    </div>
                                                </div><br><br><br>

                                                <div class="form-group">
                                                    <label for ="txtCantidad" class="col-sm-2 control-label">Cantidad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCantidad" id="txtCantidad" class="form-control" type="text" value=""/><br>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for ="txtPrecio" class="col-sm-2 control-label">Precio:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtPrecio" id="txtPrecio" class="form-control" type="text" value=""/><br>
                                                    </div>
                                                </div>

                                                <input name="txtId" id="txtId" type="hidden" value=""/><br>
                                                <input type="hidden" name="registrarOferta" id="registrarOferta" value=""/>
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" value="Ofertar" name="btnRegistrarOferta" class="btn btn-default">Registrar</button>
                                                    </div>
                                                </div>
                                            </form>     
                                        </div>
                                    </center>
                                </div>
                            </div>    
                            <div class="submenu"  style="width: 15%; height: 400px; right: 20%;float: left; ">
                                <div id="submenu">
                                    <div class="barraleft" >
                                        <div class="panel-body" id="menuStyle">
                                            <%
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
            <footer class="cnt" style="clear: both; "> 
                <nav>
                    <ul>
                        <li><a id="sena" href="http://www.sena.edu.co/">Sena</a></li>
                        <li>Stefhany Alfonso Rincón</li>
                            <li>Última actualización: 
                            <%Consultas c = new Consultas();
                            out.println(c.consultarFecha());%></li>
                        <li><a href="http://www.minagricultura.gov.co/">MinAgricultura</a></li>
                    </ul>
                </nav>
            </footer> 
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


