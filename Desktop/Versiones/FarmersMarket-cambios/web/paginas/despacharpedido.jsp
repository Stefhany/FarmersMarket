<%-- 
    Document   : despacharpedido
    Created on : 29-ene-2015, 10:04:55
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Despachar pedido</title>
    </head>
    <body>
        <form name="despacharPedido" method="post" action="../Controlador">
            <label for="txtTipoProducto">Tipo de producto:</label>
            <select name="txtTipoProducto">
            </select>
            <br>
            <label for="txtNombreProducto">Nombre del producto:</label>
            <select name="txtNombreProducto">                             
            </select>
            <br>
            <label for="txtCantidad">Cantidad:</label>
            <input type="text" name="txtCantidad" id="txtCantidad" value="" readonly="true"/>
            <br>
            <label for="txtFechaEntrega">Fecha de entrega:</label>
            <input type="date" name="txtFechaEntrega" id="txtFechaEntrega" value=""/>
            <br>
            <label for="txtFechaEnvio">Fecha de entrega:</label>
            <input type="date" name="txtFechaEnvio" id="txtFechaEnvio" value=""/>
            <br>
            <input type="hidden" name="generarPedido" id="generarPedido" value="0"/>
            <input type="submit" name="btnGenerarPedido" id="btnGenerarPedido" value="Generar pedido"/>
        </form>
    </body>
</html>
