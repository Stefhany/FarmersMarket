<%-- 
    Document   : myproducts
    Created on : 17-mar-2015, 19:49:53
    Author     : Mona
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO userdto = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");}
        %>
    </head>
    <body>
        
        <%
                //int idUsuario = userdto.getIdUsuarios();
                //int id = Integer.parseInt(request.getParameter("idProductor"));
                ProductosAsociadosUsuariosDAO padao = new ProductosAsociadosUsuariosDAO();
                ArrayList<ProductosAsociadosUsuariosDTO> productos = new ArrayList();
                //productos = padao.listarProductosByUser(3);
                //productos = padao.listarProductosByUser(userdto.getIdUsuarios());
                if (productos != null) { %>
                <h1>Ofertas</h1>
        <table border="1" id="results" class="table table-bordered" style="width:95%;">
            <thead>
                <tr>
                    <th>Tipo de producto</th>                   
                    <th>Nombre producto</th>
                    <th>Cantidad</th>
                    <th>Unidad</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (ProductosAsociadosUsuariosDTO pro : productos) {
                %>
                <tr>
                    <td><%=pro.getProducto().getIdProductos() %></td>
                   <!-- <td><%=//pro.getProducto().getCategoriaId().getNombre() %></td> -->
                    <td><%=pro.getProducto().getNombre()%></td>
                    <td><%=pro.getProducto().getUnidad() %></td>
                    
                    <td><a href="../Controlador?idProducto=<%=pro.getProducto().getIdProductos()%>"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar la oferta: <%=pro.getProducto().getNombre()%>" 
                                                                                         title="Elimianr la oferta de: <%=pro.getProducto().getNombre()%>" >
                        </a></td>
                </tr>
                <%
                    } %>
            </tbody>
        </table>
                <%
                }

        %>

        

    </body>
</html>
