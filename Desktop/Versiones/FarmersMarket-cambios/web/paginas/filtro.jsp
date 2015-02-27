<%-- 
    Document   : filtro
    Created on : 26-feb-2015, 14:56:58
    Author     : Mona
--%>

<%@page import="daos.Consultas"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market  Consultar</title>
        <script type="text/javascript" src="javascript/validacion.js"></script>
    </head>
    <body>
        <form name="filtro" action="../cc">
        <label for="txtProductor">Nombre Productor:</label>
        <input name="txtProductor" id="txtProductor" type="text">
        
        <label for="txtProducto">Nombre Producto:</label>
        <input name="txtProducto" id="txtProducto" type="text">
        
        <label for="txtFecha">Fecha ofertas:</label>
        <input name="txtFecha" id="txtFecha" type="date">
        
        <input type="submit" value="Consultar" name="consultar" onclick=""/>
        </form>
    </body>
</html>
