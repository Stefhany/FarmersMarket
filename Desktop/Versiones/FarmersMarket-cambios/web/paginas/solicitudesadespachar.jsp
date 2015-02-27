<%-- 
    Document   : solicitudesadespachar
    Created on : 24-feb-2015, 13:45:52
    Author     : Mona
--%>

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
        <title>Farmers Market | Despachos</title>
        <!-- bootstrap 3.0.2-->
        <link href="../styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> 

        <link href="../styles/style.css" rel="stylesheet" type="text/css" media="screen" />
        <!-- font Awesome -->
        <link href="../styles/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme style -->
        <link href="../styles/AdminLTE.css" rel="stylesheet" type="text/css" />

        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <script src="../js/additional-methods.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>

        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este producto?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <body>
        <div id="contenedor">
            <header>
                <nav>
                    <ul id="menus">
                        <li><a href="indexproductor.jsp" class="current">Inicio</a></li>
                        <li><a href="paginas/listarofertas.jsp">Mis ofertas</a></li>
                        <li><a href="paginasproductor/listarproductos.jsp">Mis producto</a></li>
                        <li><a href="paginasproductor/listarsolicitudes.jsp">Mis solicitudes</a></li>
                        <li><a href="paginasproductor/aplicarsolicitud.jsp">Aplicar a solicitudes</a></li>
                        <li><a href="paginasproductor/consultar.jsp"> Consultar <img src="images/buscar.png"></a></li>
                    </ul>
                </nav>


                <hgroup class="intro">
                    <h1 class="title">Farmert Market</h1>
                </hgroup>

                <hgroup class="logo">
                    <img src="images/logoFM.png">
                </hgroup>       

                <div class="Iniciar">
                    <a class="btn btn-success" href="paginas/logout.jsp" role="button" >Cerrar sesión</a>
                </div>
            </header>
            </br>
            </br>

            <div class="wrapper">
                <div class="border"></div>
                <article class="menu">
                    <div class="border3">
                    </div>
                    <h2>A despachar!!</h2>
                    <div class="left">
                        <%
                            HttpSession misesion = request.getSession(false);

                            if (misesion.getAttribute("usuarioLogueado") == null) {
                                response.sendRedirect("login.jsp?msg= Usuario desconocido");

                            } else {
                                UsuariosDTO userLogueado = new UsuariosDTO();
                                userLogueado = (UsuariosDTO) misesion.getAttribute("usuarioLogueado");
                        %>

                        <%
                            DespachosPedidosDAO despa= new DespachosPedidosDAO();
                            LinkedList<SolicitudDistribuidorDTO> despachos = new LinkedList();
                            despachos = (LinkedList<SolicitudDistribuidorDTO>) despa.mostrarDespachosPendientes();
                        %>

                        <table class="table table-striped" style="width:80%" name="table1" border="1" id="results">
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
                                    <td><%=solDto.getUser().getDireccion() %></td>                                    
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
                            <div id="pageNavPosition"></div>
                            <%
                                if (request.getParameter("msg") != null) {

                            %>
                        <div class="confirmarOK"><%=request.getParameter("msg")%></div>        

                        <%
                                }
                            }
                        %>
        </body>
    </body>
</html>
