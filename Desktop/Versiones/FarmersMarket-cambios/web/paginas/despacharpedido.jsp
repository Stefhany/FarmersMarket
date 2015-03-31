<%-- 
    Document   : despacharpedido
    Created on : 29-ene-2015, 10:04:55
    Author     : Sena
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.DespachosPedidosDAO"%>
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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Despachar pedido</title>

        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO u = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");

                if (request.getParameter("idDespacho") != null) {
                    int idDespacho = Integer.parseInt(request.getParameter("idDespacho"));
                    SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();
                    DespachosPedidosDAO desDao = new DespachosPedidosDAO();
                    solDto = desDao.consultarSolicitud(idDespacho);

        %>

    </head>
    <body>
        <div class="container">
            <header>
                <img src="../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                    <ul id="bar"  style="float:left;">
                        <li><a href="perfil.jsp">Inicio</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">
                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 630px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Despachar pedidos</h1>
                                        <div name="despacharPedido" style="width: 500px;">
                                            <form name="despacharPedido" method="post" action="../cp" align="center" class="form-horizontal">
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <input name="txtSolicitud" id="txtSolicitud" type="hidden" required="true"
                                                               value="<%if (solDto != null) {
                                                                       out.println(solDto.getIdSolicitud());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <input name="txtUser" id="txtUser" type="hidden" required="true"
                                                               value="<%if (solDto != null) {
                                                                       out.println(solDto.getUser().getIdUsuarios());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>

                                                <br>
                                                <div class="form-group">
                                                    <label for="txtUser" class="col-sm-2 control-label">Nombre del usuario:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtUser" id="txtUser" type="text" required="true"
                                                               value="<%if (solDto != null) {
                                                                       out.println(solDto.getUser().getNombres());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtDireccion" class="col-sm-2 control-label">Dirección de entrega:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtDireccion" id="txtDireccion" type="text" required="true"
                                                               value="<%if (solDto != null) {
                                                                       out.println(solDto.getUser().getDireccion());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for="txtFechaSolicitada" class="col-sm-2 control-label">Fecha solicitada:</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" name="txtFechaSolicitada" id="txtFechaSolicitada" 
                                                               value="<%if (solDto != null) {
                                                                       out.print(solDto.getFechaSolicitud());
                                                                   }
                                                               %>" class="form-control" readonly="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtFechaEnvio" class="col-sm-2 control-label">Fecha de entrega:</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" name="txtFechaEnvio" id="txtFechaEnvio" 
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                                <br>
                                                <label style="text-align: right;">Observaciones:</label><br>
                                                <textarea class="form-control" name="txtObservacion" ></textarea>
                                                <br>
                                                <div class="form-group">
                                                    <input type="hidden" name="despacharPedido" id="despacharPedido" value="0"/>
                                                    <div class="col-sm-10">
                                                        <button type="submit" name="btnDespacharPedido" 
                                                                class="btn btn-default" id="btnDespacharPedido" value="Despachar pedido"/>Despachar pedido</button>
                                                    </div>
                                                </div>
                                            </form>
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
                                                    }
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
            <%
                if (request.getParameter("msg") != null) {

            %>
            <div class="confirmarOK"><%=request.getParameter("msg")%></div>        

            <%
                }
                // si es null el objeto, es decir, no se ha creado aun, no mostramos nada   
%>
        </div>  
    </body>
</html>
