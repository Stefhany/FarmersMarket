<%-- 
    Document   : generarpedidoaproductores
    Created on : 21-feb-2015, 7:38:30
    Author     : Mona
--%>

<%@page import="facade.FacadeSolicitudDistribuidor"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.SolicitudDistribuidorDAO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../../css/style.css">
        <link rel="icon" href="../../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../../js/jquery-1.11.2.min.js"></script>
        <script src="../../../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Generar pedido</title>
        <%
            if (request.getParameter("id") != null) {

                int id = Integer.parseInt(request.getParameter("id"));
                SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();

                FacadeSolicitudDistribuidor facadeSolicitud = new FacadeSolicitudDistribuidor();
                solDto = facadeSolicitud.byIdRequest(id);

                if (solDto != null) {

        %>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav">
                    
                    <ul id="bar"  style="float:left;">
                        <li><a href="../../usuarios/perfil.jsp">Inicio</a></li>
                    </ul>

                    <ul id="bar"  style="float:right;">
                        <li><a href="../../usuarioslogout.jsp">Cerrar sesión</a></li>
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
                                        <div name="despacharPedido" style="width: 500px;">
                                            <form action="../../../cp" method="post" name="generarPedidoProductores" class="form-horizontal">
                                                <input name="txtIdSolicitud" id="txtIdSolicitud" value="<%if (solDto != null) {
                    out.print(solDto.getIdSolicitud());
                }%>" type="hidden">

                                                <div class="form-group">
                                                    <label for=txtDistribuidor" class="col-sm-2 control-label">Nombre del Distribuidor:</label>
                                                    <div class="col-sm-10">
                                                        <input name="Distribuidor" id="Distribuidor" value="<%if (solDto != null) {
                    out.print(solDto.getUser().getNombres());
                }%>" type="text" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtNombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtNombreProducto" id="txtNombreProducto" value="<%if (solDto != null) {
                                                                out.print(solDto.getProduct().getNombre());
                                                            }%>" type="text" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtCantidadSolicitada" class="col-sm-2 control-label">Cantidad solicitada:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCantidadSolicitada" id="txtCantidadSolicitada" value="<%if (solDto != null) {
                                                                out.print(solDto.getCantidadSolicitada());
                                                            }%>" type="text" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtFechaSolicitada" class="col-sm-2 control-label">Fecha solicitada por el distribuidor:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtFechaSolicitada" id="txtFechaSolicitada" value="<%if (solDto != null) {
                                                                out.print(solDto.getFechaSolicitud());
                                                            }%>" type="date" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtFechaEntrega" class="col-sm-2 control-label">Fecha de entrega por los productores:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtFechaEntrega" id="txtFechaEntrega" value="" type="date" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <input name="generarPedido" id="generarPedido" type="hidden">
                                                <div class="form-group">
                                                    <div>
                                                        <button name="btnGenerarPedido" id="btnGenerarPedido" 
                                                                class="btn btn-default" value="Generar Pedido" type="submit">Generar pedido</button>
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

        <div class="style">
            <%
                        if (request.getParameter("msg") != null) {
                            out.print(request.getParameter("msg"));
                        }
                    }
                }


            %>

        </div>
    </body>
</html>
