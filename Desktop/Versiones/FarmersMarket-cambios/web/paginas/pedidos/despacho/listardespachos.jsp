<%-- 
    Document   : listardespachos
    Created on : 24-mar-2015, 11:42:46
    Author     : Mona
--%>

<%@page import="facade.FacadeDespachosPedidos"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.DespachosPedidosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGAA | Pedidos por despachar</title>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <script type="text/javascript" src="../../js/paging.js"></script>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        
        <%
            FacadeDespachosPedidos facadeDespachos = new FacadeDespachosPedidos();
            LinkedList<SolicitudDistribuidorDTO> despachos = new LinkedList();
            despachos = facadeDespachos.mostrarDespachosPendientes();
            
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
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
                                        <h1>Pedidos por despachar</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:95%;">
                                            <thead>
                                            <p>Datos del usuario para despachar pedido:</p>
                                            <tr>                    
                                                <th>Nombre del usuario</th>
                                                <th>Dirección</th>
                                                <th>Teléfono</th>
                                                <th>Nombre del producto</th>
                                                <th>Fecha solicitada</th>
                                                <th>Despachar</th>
                                            </tr>                
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (SolicitudDistribuidorDTO despa : despachos) {
                                                %>
                                                <tr>
                                                    <td><%=despa.getUser().getNombres()%></td>
                                                    <td><%=despa.getUser().getDireccion()%></td>
                                                    <td><%=despa.getUser().getTelefono()%></td>
                                                    <td><%=despa.getProduct().getNombre()%></td>
                                                    <td><%=despa.getFechaSolicitud()%></td>  
                                                    <td><a href="despacharpedido.jsp?idDespacho=<%=despa.getIdSolicitud()%>"><img src="../imagenes/5.png"
                                                                                                                                  whith="32" height="32" title="Despachar pedido"
                                                                                                                                  alt="Despachar pedido"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <%}%>
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
                <%
                    if (request.getParameter("msg") != null) {

                %>
                <div class="confirmarOK"><%=request.getParameter("msg")%></div>        

                <%
                    }
                    // si es null el objeto, es decir, no se ha creado aun, no mostramos nada   
%>
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

    </body>
</html>

