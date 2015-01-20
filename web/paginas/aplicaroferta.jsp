<%-- 
    Document   : aplicaroferta
    Created on : 10/12/2014, 10:12:59 PM
    Author     : krito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicar Solicitud</title>
    </head>
    <body>
        <form>
            <center><h1>Aplicar Solicitud</h1></center>
            <center> <table style="width:50%">
                    <tr>
                        <td><label for="txtNombreProducto">Nombre Producto:</label> </td>
                        <td><input type="text" id="txtNombreProducto" name="txtNombreProducto"></td>
                    </tr>
                    <tr>
                        <td><label for="txtCantidad">Cantidad solicitada:</label></td>
                        <td><input type="text" id="txtCantidad" name="txtCantidad">  </td>
                    </tr>
                    <tr>
                        <td><label for="txtAporte">Cantidad Aportar:</label> </td>
                        <td><input type="text" id="txtAporte" name="txtAporte"></td>
                    </tr>
                    <tr> 

                        <td><label for="txtUnidad">Unidad:</label></td>
                        <td><input name="txtUnidad" id="txtUnidad" value="Kg" readonly="true"></td>                                                
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" onclick="return confirm('seguro que desea hacer esto?')" value="aplicar"></td>
                    </tr>


                </table></center>


        </form>

    </body>
</html>