<%-- 
    Document   : solicitudesadespachar
    Created on : 24-feb-2015, 13:45:52
    Author     : Mona
--%>

<%@page import="facade.FacadeDespachosPedidos"%>
<%@page import="daos.DespachosPedidosDAO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.SolicitudDistribuidorDAO"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <SCRIPT language="JavaScript" src="../../js/products.js"></SCRIPT>
        <title>SIGAA | Despachos</title>
        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este producto?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <%
            FacadeDespachosPedidos facadeDespachos = new FacadeDespachosPedidos();
            LinkedList<SolicitudDistribuidorDTO> despachos = new LinkedList();
            despachos = (LinkedList<SolicitudDistribuidorDTO>) facadeDespachos.mostrarDespachosPendientes();
        %>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <ul id="bar"  style="float:left;">
                        <li><a href="../../usuarios/perfil.jsp">Inicio</a></li>
                    </ul>
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="../../usuarios/logout.jsp">Cerrar sesión</a></li>
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
                                        <h1>Solicitudes a despachar</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:95%;">
                                            <thead>
                                                <tr>
                                                    <th>Nombre solicitante</th>             
                                                    <th>Nombre producto</th>
                                                    <th>Dirección</th>
                                                    <th>Teléfono</th>
                                                    <th>Fecha solicitada</th>
                                                    <th>Fecha solicitante</th>
                                                    <th>Despachar</th>
                                                    <th>Modificar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (SolicitudDistribuidorDTO solDto : despachos) {
                                                %>
                                                <tr>
                                                    <td><%=solDto.getUser().getNombres()%></td>                                    
                                                    <td><%=solDto.getProduct().getNombre()%></td>
                                                    <td><%=solDto.getUser().getDireccion()%></td>                                    
                                                    <td><%=solDto.getUser().getTelefono()%></td>
                                                    <td><%=solDto.getFechaEntregaInterna()%></td>
                                                    <td><%=solDto.getFechaSolicitud()%></td>
                                                    <td><a href="despacharpedido.jsp?idDespacho=<%=solDto.getIdSolicitud()%>"><img src="../imagenes/order.png" width="32" height="32" alt="Despachar pedido de : <%=solDto.getProduct().getNombre()%> " 
                                                                                                                                   title="Despachar el producto: <%=solDto.getProduct().getNombre()%>">
                                                        </a></td> 
                                                    <td><a href="modificardespacho.jsp?idDespacho=<%=solDto.getIdSolicitud()%>"><img src="../imagenes/modificar.png" width="32" height="32" alt="Modificar el despacho de : <%=solDto.getProduct().getNombre()%>" 
                                                                                                                                     title="Modificar despacho de: <%=solDto.getProduct().getNombre()%>">
                                                        </a></td> 
                                                </tr>
                                                <%
                                    }%>
                                            </tbody>
                                        </table>
                                        <div style="cursor:pointer;" id="pageNavPosition"></div>
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
