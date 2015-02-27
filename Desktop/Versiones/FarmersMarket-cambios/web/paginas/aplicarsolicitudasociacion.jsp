<%-- 
    Document   : aplicaroferta
    Created on : 10/12/2014, 10:12:59 PM
    Author     : krito
--%>

<%@page import="daos.AportesProductoresDAO"%>
<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicar Solicitud</title>
        <%
            SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();
            AportesProductoresDAO aporDao = new AportesProductoresDAO();
            solDto = aporDao.byIdForAssociation(3);
        %>
    </head>
    <body>
        <form action="../cp" method="post" name="aplicarPedidoAsociacion" align="center">
            <input name="txtIdSolicitud" id="txtIdSolicitud" value="<%if (solDto != null) {
                    out.print(solDto.getIdSolicitud());
            }%>" type="hidden">
            <input name="txtIdAso" id="txtIdAso" value="<%if (solDto != null) {
                    out.print(solDto.getUser().getIdUsuarios());
            }%>" type="hidden">
            <br>
            <label for=txtNombreProducto">Nombre del Producto:</label>
            <input name="txtNombreProducto" id="txtNombreProducto" value="<%if (solDto != null) {
                    out.print(solDto.getProduct().getNombre());
                }%>" type="text" readonly="true">
            <br>
            <label for=txtFechaSolicitada">Fecha solicitada por la asociación:</label>
            <input name="txtFechaSolicitada" id="txtFechaSolicitada" value="<%if (solDto != null) {
                    out.print(solDto.getFechaEntregaInterna());
                }%>" type="date" readonly="true">
            <br>
            <label for=txtCantidadSolicitada">Cantidad solicitada:</label>
            <input name="txtCantidadSolicitada" id="txtCantidadSolicitada" value="<%if (solDto != null) {
                    out.print(solDto.getCantidadSolicitada());
                }%>" type="text" readonly="true">
            <br>
            <label for=txtCantidadAportar">Cantidad aportar:</label>
            <input name="txtCantidadAportar" id="txtCantidadAportar" value="" type="text">
            <br>
            <label for=txtFechaEntrega">Fecha entrega:</label>
            <input name="txtFechaEntrega" id="txtFechaEntrega" value="" type="date">
            <br>
            <input name="aplicarSolicitud" id="aplicarSolicitud" type="hidden">
            <input name="btnAplicarSolicitud" id="btnAplicarSolicitud" value="Aplicar Solicitud" type="submit">
        </form>
    </body>
</html>