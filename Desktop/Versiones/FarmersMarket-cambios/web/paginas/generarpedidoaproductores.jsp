<%-- 
    Document   : generarpedidoaproductores
    Created on : 21-feb-2015, 7:38:30
    Author     : Mona
--%>

<%@page import="daos.SolicitudDistribuidorDAO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Generar pedido</title>
        <%
            SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();
            SolicitudDistribuidorDAO solDao = new SolicitudDistribuidorDAO();
            solDto = solDao.byIdRequest(2);
        %>
    </head>
    <body>
        <form action="../cp" method="post" name="generarPedidoProductores">
            <input name="txtIdSolicitud" id="txtIdSolicitud" value="<%if (solDto != null) {
                    out.print(solDto.getIdSolicitud());
            }%>" type="hidden">
            <label for=txtDistribuidor">Nombre del Distribuidor:</label>
            <input name="Distribuidor" id="Distribuidor" value="<%if (solDto != null) {
                    out.print(solDto.getUser().getNombres());
            }%>" type="text" readonly="true">
            <br>
            <label for=txtNombreProducto">Nombre del Producto:</label>
            <input name="txtNombreProducto" id="txtNombreProducto" value="<%if (solDto != null) {
                    out.print(solDto.getProduct().getNombre());
                }%>" type="text" readonly="true">
            <br>
            <label for=txtCantidadSolicitada">Cantidad solicitada:</label>
            <input name="txtCantidadSolicitada" id="txtCantidadSolicitada" value="<%if (solDto != null) {
                    out.print(solDto.getCantidadSolicitada());
                }%>" type="text" readonly="true">
            <br>
            <label for=txtFechaSolicitada">Fecha solicitada por el distribuidor:</label>
            <input name="txtFechaSolicitada" id="txtFechaSolicitada" value="<%if (solDto != null) {
                    out.print(solDto.getFechaSolicitud());
                }%>" type="date" readonly="true">
            <br>
            <label for=txtFechaEntrega">Fecha de entrega por los productores:</label>
            <input name="txtFechaEntrega" id="txtFechaEntrega" value="" type="date">
            <br>
            <input name="generarPedido" id="generarPedido" type="hidden">
            <input name="btnGenerarPedido" id="btnGenerarPedido" value="Generar Pedido" type="submit">
            
        </form>
    </body>
</html>
