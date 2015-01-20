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
        <title>Lista ofertas</title>
        <!-- bootstrap 3.0.2-->
        <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
    </head>
    <body>
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
        <h1>Lista ofertas</h1>
        <table class="table table-striped" style="width:80%" name="table1">
            <thead>
                <tr>
                    <th>Tipo de producto</th>
                    <th>Nombre productor</th>
                    <th>Nombre producto</th>
                    <th>Cantidad</th>
                    <th>Unidad</th>
                    <th>Precio</th>
                    <th>Solicitar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (OfertasDTO ofer : offers) {
                %>
                <tr>
                    <td><%=ofer.getProducts().getCategoriaId().getNombre()%></td>
                    <td><%=ofer.getUser().getNombres()%></td>
                    <td><%=ofer.getProducts().getNombre()%></td>
                    <td><%=ofer.getCantidad()%></td>
                    <td><%=ofer.getProducts().getUnidad()%></td>
                    <td><%=ofer.getPrecio()%></td>
                    <td><a href="../Controlador?id=<%=ofer.getIdOfertas()%>"><img src="../imagenes/order.png" width="48" height="48" alt="Solicitar <%=ofer.getProducts().getNombre()%>" 
                                                                                  title="Solicitar el producto: <%=ofer.getProducts().getNombre()%>" onclick="window.open('solicitarpedido.jsp', 
                                                                                              'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')">
                        </a></td>  
                </tr>
                <%
                    }%>
            </tbody>
        </table>
        <%
            if (request.getParameter("msg") != null) {

        %>
        <div class="confirmarOK"><%=request.getParameter("msg")%></div>        

        <%
            }}
        %>
        
    </body>
</body>
</html>
