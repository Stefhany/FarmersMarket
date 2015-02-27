<%-- 
    Document   : reportepedidos
    Created on : 1/02/2015, 11:12:08 PM
    Author     : krito
--%>

<%@page import="java.util.Date"%>
<%@page import="dtos.PedidoDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.PedidosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
        <title>Farmers Market | Reporte Ofertas</title>
        <%
            PedidosDAO order = new PedidosDAO();
            LinkedList<PedidoDTO> orders;
            orders = (LinkedList<PedidoDTO>) order.consultarSolicitudesDistribuidor();
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr style="background-color: #FE9A2E; color: #FFF; border: #BC8D4B">
                    <th>Distribuidor</th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Fecha solicitada</th>
                </tr>
            </thead>
            <tbody>
                <%                    
            String reportePedidos = "Pedidos de Farmers Market" + new Date() + ".xls";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + reportePedidos + "\"");
                for (PedidoDTO ord : orders) {
                %>
                <tr>
                    <th><%out.write(ord.getUser().getNombres()+ " \t");%>
                    <td><%out.write(ord.getProducto().getNombre()+ " \t");%></td>
                    <td><%out.write(ord.getCantidadSolicitada() + " \t");%></td>
                    <td><%out.write(ord.getFechaSolicitada() + " \t");%></td>
                <%
                        out.write("\n");
                    }
                %>    
            </tbody>
        </table> 
    </body>
</html>
