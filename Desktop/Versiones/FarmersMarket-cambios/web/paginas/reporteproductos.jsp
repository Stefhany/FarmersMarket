<%-- 
    Document   : reporteproductos.jsp
    Created on : 1/02/2015, 04:02:49 AM
    Author     : krito
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="daos.ProductoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.ProductoDTO"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
        <title>Farmers Market | Reporte Usuarios</title>
        <%
            ProductoDAO prodao = new ProductoDAO();
            LinkedList<ProductoDTO> productos = new LinkedList<ProductoDTO>();
            productos = (LinkedList<ProductoDTO>) prodao.listarAllProductos();
        %>   
    </head>
    <body>
        <table border="1">
            <thead>
                <tr style="background-color: #FE9A2E; color: #FFF; border: #BC8D4B">
                    <th>Id Producto</th>
                    <th>Tipo de producto</th>
                    <th>Nombre</th>
                    <th>Unidad</th>
                </tr>
            </thead>
            <tbody>
                <%                    
            String reporteProductos = "Productos de Farmers market" + new Date() + ".xls";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + reporteProductos + "\"");
                for (ProductoDTO pro : productos) {
                %>
                <tr>
                    <th><%out.write(pro.getIdProductos()+ " \t");%>
                    <td><%out.write(pro.getCategoriaId().getNombre()+ " \t");%></td>
                    <td><%out.write(pro.getNombre() + " \t");%></td>
                    <td><%out.write(pro.getUnidad() + " \t");%></td>
                <%

                        out.write("\n");
                    }
                %>    
            </tbody>
        </table> 
    </body>
</html>
