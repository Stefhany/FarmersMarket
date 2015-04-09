<%-- 
    Document   : aplicaroferta
    Created on : 10/12/2014, 10:12:59 PM
    Author     : krito
--%>

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

            if (request.getParameter("idSolicitud") != null) {
                int id = Integer.parseInt(request.getParameter("idSolicitud"));
                SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();

                FacadeAportesProductores facadeAportes = new FacadeAportesProductores();

                solDto = facadeAportes.buscarIdAsociacion(id);
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
                                        <form action="../../../cp" method="post" name="aplicarPedidoAsociacion" align="center" class="form-horizontal">
                                            <input name="txtIdSolicitud" id="txtIdSolicitud" value="<%if (solDto != null) {
                                                    out.print(solDto.getIdSolicitud());
                                                }%>" type="hidden">
                                            <input name="txtIdAso" id="txtIdAso" value="<%if (solDto != null) {
                                                    out.print(solDto.getUser().getIdUsuarios());
                                                }%>" type="hidden">
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
                                                <label for=txtFechaSolicitada" class="col-sm-2 control-label">Fecha solicitada por la asociación:</label>
                                                <div class="col-sm-10">
                                                    <input name="txtFechaSolicitada" id="txtFechaSolicitada" value="<%if (solDto != null) {
                                                            out.print(solDto.getFechaEntregaInterna());
                                                        }%>" type="date" readonly="true" class="form-control">
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
                                                <label for=txtCantidadAportar" class="col-sm-2 control-label">Cantidad aportar:</label>
                                                <div class="col-sm-10">
                                                    <input name="txtCantidadAportar" id="txtCantidadAportar" value="" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label for=txtFechaEntrega" class="col-sm-2 control-label">Fecha entrega:</label>
                                                <div class="col-sm-10">
                                                    <input name="txtFechaEntrega" id="txtFechaEntrega" value="" type="date" class="form-control">
                                                </div>
                                            </div>
                                            <br>
                                            <input name="aplicarSolicitud" id="aplicarSolicitud" type="hidden">
                                            <div class="form-group">
                                                <div>
                                                    <button name="btnAplicarSolicitud" id="btnAplicarSolicitud" type="submit" class="btn btn-default">Aplicar Solicitud</button>
                                                </div>
                                            </div>
                                        </form>
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