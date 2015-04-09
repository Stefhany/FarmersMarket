<%-- 
    Document   : aplicaroferta
    Created on : 10/12/2014, 10:12:59 PM
    Author     : krito
--%>

<%@page import="facade.FacadeOfertas"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="facade.FacadePedidoSobreOferta"%>
<%@page import="facade.FacadeAportesProductores"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.AportesProductoresDAO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.css"> 
    <link rel="icon" href="../../../img/favicon.ico" type="image/x-ico"/>
    
    <link rel="stylesheet" type="text/css" href="../../../css/style.css">
    <script type="text/javascript" src="../../../js/paging.js"></script>
    <script src="../../../js/jquery-1.11.2.min.js"></script>
    <script src="../../../js/funciones.js" type="text/javascript"></script>
    <script src="../../../js/bootstrap.js"></script>
    <script type="text/javascript" src="javascript/validacion.js"></script>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <title>SIGAA | Aplicar Solicitud</title>
    <%
        HttpSession miSesion = request.getSession(false);
        if (miSesion.getAttribute("usr") != null) {
            UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
            String menu = (String) miSesion.getAttribute("mp");

            if (request.getParameter("idOffer") != null) {
                int id = Integer.parseInt(request.getParameter("idSolicitud"));
                OfertasDTO offerdto = new OfertasDTO();

                FacadeOfertas facadeOffer = new FacadeOfertas();
                offerdto = facadeOffer.consultByOffer(id);
    %>

</head>
<body>
    <div class="container">
        <header>
            <img src="../../../img/banner.png" alt="" class="col-xs-12">
        </header>
        <div class="col-xs-12" >
            <div class="nav"> 						
                <ul id="bar"  style="float:right;">
                    <li><a href="../../usuarios/logout.jsp">Cerrar sesión</a></li>
                </ul>
                <ul id="bar"  style="float:left;">
                    <li><a href="../../usuarios/perfil.jsp">Inicio</a></li>
                </ul>
            </div>	
        </div>

        <div class="row">

            <center>    
                <div class="main" style="width: 96%;" >
                    <div class="row">
                        <div class="cuerpo" style="width: 85%; height: 555px; left: 25%;  float: right;">

                            <div class="derecha">
                                <center>
                                    <div name="aplicarPedidoAsociacion" style="width: 500px;">
                                        <form name="solicitarOferta" >
                                        
                                        <input type="hidden" name="txtIdDistribuidor" id="txtIdDistribuidor"
                                               value="4"/>


                                        <input name="txtIdOferta" id="txtIdOferta" type="hidden" 
                                               value="<%if (offerdto != null) {
                                                   out.print(offerdto.getIdOfertas());
                                                   }
                                               %>"/>
                                        <div class="form-group">
                                            <label for="txtNombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" name="txtNombreProducto" class="campo"  id="txtNombreProducto" 
                                                       value="<%if (offerdto != null) {
                                                                out.print(offerdto.getIdAso().getProducto().getNombre());
                                                           }
                                                       %>" readonly="true">
                                            </div>
                                        </div><br><br>
                                        <input type="hidden" name="idProducto" class="campo"  id="idProducto" 
                                               value="<%if (offerdto != null) {
                                               out.print(offerdto.getIdAso().getProducto().getIdProductos());
                                               }
                                               %>"><br>

                                        <div class="form-group">
                                            <label for="txtNombreProductor" class="col-sm-2 control-label">Nombre Productor: </label>
                                            <div class="col-sm-10">
                                                <input  class="form-control" type="text" name="txtNombreProductor" class="campo"  id="txtNombreProductor" 
                                                        value="<%if (offerdto != null) {
                                                            out.print(offerdto.getIdAso().getUsuario().getNombres());
                                                            }
                                                        %>" readonly="true">
                                            </div>
                                        </div>
                                        <input name="idProductor" class="campo"  id="idProductor" type="hidden"
                                               value="<%if (offerdto != null) {
                                                    out.print(offerdto.getIdAso().getUsuario().getIdUsuarios());
                                               }
                                               %>"><br><br>
                                        
                                        <div class="form-group">
                                            <label for="txtCantidadOfertada" class="col-sm-2 control-label">Cantidad ofertada: </label> 
                                            <div class="col-sm-10">
                                                <input type="text" id="txtCantidadOfertada" name="txtCantidadOfertada" 
                                                       value="<%if (offerdto != null) {
                                                           out.print(offerdto.getCantidad());
                                                           }
                                                       %>" readonly="true" class="form-control"><br>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCantidadSolicitada" class="col-sm-2 control-label">Cantidad solicitada: </label> 
                                            <div class="col-sm-10">
                                                <input type="text" id="txtCantidadSolicitada" name="txtCantidadSolicitada" 
                                                       required="true" class="form-control"><br>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUnidad" class="col-sm-2 control-label">Unidad: </label> 
                                            <div class="col-sm-10">
                                                <input value="Kilos" class="form-control" readonly="true"><br>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtFechaSolicitud" class="col-sm-2 control-label"> Fecha solicitud: </label>
                                            <div class="col-sm-10">
                                                <input type="date" id="txtFechaSolicitud" name="txtFechaSolicitud" 
                                                       onblur="javascript:validarSolicitud();" class="form-control"><br>
                                                <div id="result" class="mensajegError"></div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="solicitar" id="solicitar" value="solicitar" />

                                        <div class="form-group" style="text-align: center;">
                                            <div>
                                                <button type="submit" class="btn btn-default" value="Solicitar Pedido" 
                                                        id="btnSolicitar" name="btnSolicitar">Solicitar Pedido</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                            

                                    <%} else {
                                            {
                                                out.print("no llego nada");
                                            }
                                            out.print("no llego nada");
                                        }%>
                            </div>
                            </center>   
                        </div>

                    </div>    
                    <div class="submenu"  style="width: 15%; height: 520px; right: 20%;float: left; ">

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

<div class="style">
    <%
        if (request.getParameter("msg") != null) {
            out.print(request.getParameter("msg"));
        }
    %>

</div>
</body>
</html>