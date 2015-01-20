<%-- 
    Document   : index
    Created on : 10/12/2014, 10:22:50 PM
    Author     : krito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registro Usuario</title>
        <!-- bootstrap 3.0.2-->
        <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
    </head>

    <body>
        <h1>Consultar Ofertas</h1>
        <table class="table table-striped" style="width:80%" name="table1">
            <tr>
                <th>Tipo producto</th>
                <th>Nombre Productor</th>
                <th >Nombre Producto</th>
                <th >Cantidad</th>
                <th >Precio</th>
                <th >Solicitar</th>
            </tr>
            <tr>
                <td>Tuberculos</td>
                <td>Sebastian Mondragon</td>
                <td>Papa</td>
                <td>200 kilos</td>
                <td>$800</td>
                <td><img src="imagenes/1.png" onclick="window.open('paginas/solicitarpedido.jsp', 'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')"></td>
            </tr>
            <tr>
                <td>Tuberculos</td>
                <td>Stefhany Alfonso</td>
                <td>Platano</td>
                <td>300 kilos</td>
                <td>$700</td>
                <td><img src="imagenes/1.png" onclick="window.open('paginas/solicitarpedido.jsp', 'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')"></td>
            </tr>
            <tr>
                <td>Tuberculos</td>
                <td>Andres Guerrero</td>
                <td>Yuca</td>
                <td>500 kilos</td>
                <td>$900</td>
                <td><img src="imagenes/1.png" onclick="window.open('paginas/solicitarpedido.jsp', 'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')"></td>
            </tr>
            <tr>
                <td>Tuberculos</td>
                <td>Sebastian Cotamo</td>
                <td>pepino</td>
                <td>250 kilos</td>
                <td>$1200</td>
                <td><img src="imagenes/1.png" onclick="window.open('paginas/solicitarpedido.jsp', 'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')"></td>
            </tr>

        </table>
        <%
            if (request.getParameter("msg") != null) {

        %>
        <div class="confirmarOK"><%=request.getParameter("msg")%></div>        

        <%
            }
        %>
    </body>
</html>
