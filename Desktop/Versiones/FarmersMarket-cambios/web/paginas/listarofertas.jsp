<%-- 
    Document   : listarofertas
    Created on : 10/12/2014, 10:14:57 PM
    Author     : krito
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="daos.OfertasDAO"%>
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
        <title>Farmers Market | Ofertas</title>
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
                    <h2>Registrar producto</h2>
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
                            OfertasDAO ofdao = new OfertasDAO();
                            LinkedList<OfertasDTO> offers = new LinkedList();
                            offers = (LinkedList<OfertasDTO>) ofdao.consultarOfertas();
                        %>

                        <table class="table table-striped" style="width:80%" name="table1" border="1">
                            <thead>
                                <tr>
                                    <th>Nombre productor</th>
                                    <th>Tipo de producto</th>                   
                                    <th>Nombre producto</th>
                                    <th>Cantidad</th>
                                    <th>Unidad</th>
                                    <th>Precio</th>
                                    <th>Solicitar</th>
                                    <th>Modificar</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (OfertasDTO ofer : offers) {
                                %>
                                <tr>
                                    <td><%=ofer.getUser().getNombres()%></td> 
                                    <td><%=ofer.getProducts().getCategoriaId().getNombre()%></td>
                                    <td><%=ofer.getProducts().getNombre()%></td>
                                    <td><%=ofer.getCantidad()%></td>
                                    <td><%=ofer.getProducts().getUnidad()%></td>
                                    <td><%=ofer.getPrecio()%></td>
                                    <td><a href="listarofertas.jsp?idAplicar=<%=ofer.getIdOfertas()%>"><img src="../imagenes/order.png" width="32" height="32" alt="Solicitar <%=ofer.getProducts().getNombre()%>" 
                                                                                                            title="Solicitar el producto: <%=ofer.getProducts().getNombre()%>" onclick="window.open('solicitarpedido.jsp',
                                                                                                                            'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')">
                                        </a></td> 
                                    <td><a href="modificaroferta.jsp?id=<%=ofer.getIdOfertas()%>"><img src="../imagenes/modificar.png" width="32" height="32" alt="Modificar oferta <%=ofer.getProducts().getNombre()%>" 
                                                                                                       title="Modificar oferta: <%=ofer.getProducts().getNombre()%>">
                                        </a></td> 

                                    <td><a href="../Controlador?idOfertas=<%=ofer.getIdOfertas()%>"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar la oferta: <%=ofer.getProducts().getNombre()%>" 
                                                                                                         title="Elimianr la oferta de: <%=ofer.getProducts().getNombre()%>" onclick="return confirmar();">
                                        </a></td>
                                </tr>
                                <%
                                    }%>
                            </tbody>
                        </table>

                        <a href="reporteofertas.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel"></a>
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
