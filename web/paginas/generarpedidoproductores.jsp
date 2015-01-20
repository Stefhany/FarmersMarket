<%-- 
    Document   : generarpedidoproductores
    Created on : 10/12/2014, 10:14:13 PM
    Author     : krito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Generar pedidos productores</title>
        <!-- bootstrap 3.0.2-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.ccs" rel="stylesheet" type="text/css">
    </head>
    <body>  
        <div class="contenedor">
            <form>
                <center><h1>Generar pedido a productores</h1></h1></center>
                <center> <table style="width:50%">
                        <tr>
                            <td><label for="categoriaProducto">Tipo de Producto:</label></td>
                            <td><select name="categoriaProducto" id="categoriaProducto" style="width:220px" required>
                                    <option selected="selected" value=""></option>
                                    <option value="1">Hortalizas</option>
                                    <option value="2">Frutas</option>
                                    <option value="3">Tuberculos</option>                                
                                    <option value="4"></option>                                
                                </select>                                                   
                            </td>
                        </tr>
                        <tr>
                            <td><label for="nombreProducto">Nombre Producto: </label></td>
                            <td><select name="nombreProducto" id="nombreProducto"  style="width:220px" required>
                                    <option selected="selected"  placeholder="escoge un producto" ></option>
                                    <option value="1">Papa</option>
                                    <option value="2">Yuca</option>
                                    <option value="3">Aracacha </option>                                
                                    <option value="4">Platano</option>                                
                                </select>                                                   
                            </td>
                        </tr>
                        <tr>
                            <td><label for="cantidad">Cantidad: </label> </td>
                            <td><input type="text" id="cantidad" name="cantidad"  placeholder="cantidad solicitada"></td>
                        </tr>
                        <tr> 

                            <td><label for="unidad">Unidad:</label></td>
                            <td><input name="unidad" class="campo"  id="unidad" placeholder="Kilos"  disabled></td>                                                
                        </tr>
                        <tr>
                            <td><label for="fechaEntrega"> Fecha de Entrega Distribuidor: </labe></td>
                            <td><input type="date" id="fechaEntrega" name="fechaEntrega"></td>
                        </tr>
                        <tr>
                            <td><label for="fechaEntregaProductor"> Fecha de Entrega Productor : </labe></td>
                            <td><input type="date" id="fechaEntregaProductor" name="fechaEntregaProductor"></td>
                        </tr>


                        <tr>
                            <td></td>
                            <td><input href="registro.html" type="submit" value="Publicar solicitud" ></td>

                        </tr>


                    </table></center>


            </form>
    </body>
</html>
