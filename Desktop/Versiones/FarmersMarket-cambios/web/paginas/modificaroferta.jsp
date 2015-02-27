<%-- 
    Document   : modificaroferta
    Created on : Jan 20, 2015, 11:54:35 AM
    Author     : rodrigoaranda
--%>

<%@page import="daos.OfertasDAO"%>
<%@page import="dtos.OfertasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Actualizar oferta</title>
        <!-- bootstrap 3.0.2-->
        <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        <%
            OfertasDTO ofDto = new OfertasDTO();
            OfertasDAO ofDao = new OfertasDAO();
            ofDto = ofDao.consultByOffer(2);
        %>
    </head>
    <body>
        <form action="../co" method="post" name="modOferta">
            <input name="txtIdOferta" id="txtIdOferta" value="<%if (ofDto != null) {
                    out.print(ofDto.getIdOfertas());
            }%>" type="hidden">
            <label for=txtNombreProducto">Nombre del producto:</label>
            <input name="txtNombreProducto" id="txtNombreProducto" value="<%if (ofDto != null) {
                    out.print(ofDto.getIdAso().getProducto().getNombre());
            }%>" type="text" readonly="true">
            <br>
            <label for=txtCantidad">Cantidad:</label>
            <input name="txtCantidad" id="txtCantidad" value="<%if (ofDto != null) {
                    out.print(ofDto.getCantidad());
            }%>" type="text">
            <br>
            <label for=txtPrecio">Precio:</label>
            <input name="txtPrecio" id="txtPrecio" value="<%if (ofDto != null) {
                    out.print(ofDto.getPrecio());
            }%>" type="text" readonly="true">
            <br>
            <input name="modificarOferta" id="modificarOferta" type="hidden">
            <input name="btnModificarOferta" id="btnModificarOferta" value="Actualizar Oferta" type="submit">
        </form>
        <%
            if (request.getParameter("msj") != null) {
                out.print(request.getParameter("msj"));
            }
        %>
    </body>
</html>
