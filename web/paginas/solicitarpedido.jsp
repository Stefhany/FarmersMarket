<%-- 
    Document   : solicitarpedido
    Created on : 10/12/2014, 10:21:13 PM
    Author     : krito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Solicitar pedido</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <%
            
        %>
    </head>
    <body>  
        <div class="contenedor" >
            <form>
                <center><h1>Solicitar pedido</h1></h1></center>
                <center> 
                    <table style="width:50%" name="table2">
                        <tr>
                            <td><label for="categoriaProducto">Categoria Producto</label></td>
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
                            <td><label for="nombreProducto">Nombre Producto</label></td>
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
                            <td><label for="nombreProductor">Nombre Productor</label></td>
                            <td><input name="nombreProductor" class="campo"  id="nombreProductor" style="width:220px" placeholder="Stefhany Alfonso"  disabled></td> 
                        </tr>
                        <tr>
                            <td><label for="cantidad">Cantidad</label> </td>
                            <td><input type="text" id="cantidad" name="cantidad" style="width:220px" placeholder="cantidad solicitada"></td>
                        <tr>
                        <tr> 

                            <td><label for="unidad">Unidad:</label></td>
                            <td><input name="unidad" class="campo"  id="unidad" style="width:220px" placeholder="Kilos"  disabled></td>                                                
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="submit" name="boton" value="Solicitar" onclick="pasarValor();"></td>
                        <a href="../listarofertas.jsp">Volver</a>
                        </tr>


                    </table></center>
            </form>
            <script>
                function pasarValor() {
                    window.opener.document.table2.c1.value = document.table1.c2.value;
                    window.innerHeight(50);
                    window.innerWidth(50);
                    window.scrollbars(false);
                    window.close();
                }
            </script>
    </body>
</html>
