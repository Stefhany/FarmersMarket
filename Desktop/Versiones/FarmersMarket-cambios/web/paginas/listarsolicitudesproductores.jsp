<%-- 
    Document   : listarsolicitudesproductores
    Created on : 21-feb-2015, 9:15:57
    Author     : Mona
--%>

<%@page import="daos.Consultas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.AportesProductoresDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGAA | Solicites a productores</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script type="text/javascript" src="../js/paging.js"></script>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                AportesProductoresDAO soldao = new AportesProductoresDAO();
                LinkedList<SolicitudDistribuidorDTO> solicitudes = new LinkedList();
                solicitudes = soldao.listarSolicitudesDeAsociacion();
        %>

        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este pedido?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="#">Cerrar sesión</a></li>
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
                            <div class="cuerpo" style="width: 85%; height: 360px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Mis solicitudes</h1>
                                        <table border="1" name="solicitudes" id="results" class="table table-bordered" style="width:90%;">
                                            <thead>
                                                <tr>                    
                                                    <th>Distribuidor</th>
                                                    <th>Nombre producto</th>
                                                    <th>Cantidad solicitada</th>
                                                    <th>Unidad</th>
                                                    <th>Fecha de entrega a asoción</th>
                                                    <th>Aportar</th>
                                                    <!--
                                                    <th>Eliminar</th>
                                                    <th>Modificar</th>-->
                                                </tr>                
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (SolicitudDistribuidorDTO ped : solicitudes) {
                                                %>
                                                <tr>
                                                    <td><%=ped.getUser().getNombres()%></td>
                                                    <td><%=ped.getProduct().getNombre()%></td>
                                                    <td><%=ped.getCantidadSolicitada()%></td>  
                                                    <td>Kilogramos</td>
                                                    <td><%=ped.getFechaEntregaInterna()%></td>
                                                    <td><a href="aplicarsolicitudasociacion.jsp?idSolicitud=<%=ped.getIdSolicitud()%>"><img src="../imagenes/order.png"
                                                                                                                                            whith="32" height="32" title="Generar pedido"
                                                                                                                                            alt="Generar pedido" align="center"/>
                                                        </a>
                                                    </td>
                                                    <!--
                                                    <td><a href="../cp?idSolicitud=<%=ped.getIdSolicitud()%>"><img src="../imagenes/eliminar.png"
                                                                                                                   whith="32" height="32" title="Eliminar solicitud"
                                                                                                                   alt="Eliminar solicitud"
                                                                                                                   onclick="return confirmar();"/>
                                                        </a>
                                                    </td>
                                                    <td><a href="modificarpedido.jsp?id=<%=ped.getIdSolicitud()%>"><img src="../imagenes/modificar.png"
                                                                                                                        whith="32" height="32" title="Modificar solicitud"
                                                                                                                        alt="Modificar solicitud"/>
                                                        </a>
                                                    </td> -->
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>


                                        <div style="cursor:pointer;" id="pageNavPosition"></div>
                                    </center>   
                                </div>

                            </div>    
                            <div class="submenu"  style="width: 15%; height:410px; right: 20%;float: left; ">

                                <div id="submenu">
                                    <div class="barraleft" >

                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                    out.println(menu);
                                                } else {
                                                    response.sendRedirect("../index.jsp");
                                                }
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
