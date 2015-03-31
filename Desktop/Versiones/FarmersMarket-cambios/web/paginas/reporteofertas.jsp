<%-- 
    Document   : reporteofertas
    Created on : 1/02/2015, 09:11:19 PM
    Author     : krito
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.OfertasDAO"%>
<%@page import="dtos.OfertasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
        <title>Farmers Market | Reporte Ofertas</title>
        <%
            OfertasDAO ofdao = new OfertasDAO();
            LinkedList<OfertasDTO> offers = new LinkedList();
            offers = (LinkedList<OfertasDTO>) ofdao.consultarOfertas();
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr style="background-color: #FE9A2E; color: #FFF; border: #BC8D4B">
                    <th>Tipo de producto</th>
                    <th>Nombre productor</th>
                    <th>Nombre producto</th>
                    <th>Cantidad</th>
                    <th>Unidad</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                <%                    
            String reporteOfertas = "Ofertas de Farmers Market" + new Date() + ".xls";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + reporteOfertas + "\"");
                for (OfertasDTO offer : offers) {
                %>
                <tr>
                    <th><%out.write(offer.getProducts().getCategoriaId().getNombre()+ " \t");%>
                    <td><%out.write(offer.getUser().getNombres()+ " \t");%></td>
                    <td><%out.write(offer.getProducts().getNombre() + " \t");%></td>
                    <td><%out.write(offer.getCantidad() + " \t");%></td>
                    <td><%out.write(offer.getProducts().getUnidad() + " \t");%></td>
                    <td><%out.write(offer.getPrecio() + " \t");%></td>
                <%
                    out.write("\n");
                    }
                %>    
            </tbody>
        </table> 
    </body>
</html>
