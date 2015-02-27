<%-- 
    Document   : registrarpedido
    Created on : 27/01/2015, 03:50:39 PM
    Author     : krito
--%>

<%@page import="dtos.ProductoDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="daos.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT language="JavaScript" src="../js/products.js"></SCRIPT>
        <title>Farmers Market | Realizar pedido</title>
        <%
            ProductoDTO pdto = new ProductoDTO();
        %>
    </head>
    <body>
        <form name="registrarSolicitud" action="../cp" method="post"> 
            <div class="form-group" align="center">
                <label for="categorias">Tipo de producto:</label>

                <select name="categorias" size="1" id="categorias" onchange="listarcategorias(this.value);">
                    <option value="0" selected>Categoría del producto</option>
                    <%  CategoriaDAO cdao = new CategoriaDAO();
                        LinkedList<CategoriaDTO> categorias = new LinkedList();
                        categorias = cdao.listarCategorias2();
                        for (CategoriaDTO cdto : categorias) {
                    %>   
                    <option value="<%=cdto.getIdCategoria()%>"> <%=cdto.getNombre()%></option>
                    <%
                        }
                    %>
                </select>

                <br> 

                <label for="subcategoria">Nombre del Producto:</label>
                <select name="subcategoria" size="1" id="subcategoria">
                    <option value="<%=pdto.getIdProductos()%>" >Elija un producto</option>
                </select><br>

                <label for="txtCantidad">Cantidad: </label> 
                <input type="text" id="txtCantidad" name="txtCantidad" 
                       placeholder="Cantidad solicitada" value="">

                <input size="1" placeholder="Kilos"><br>

                <label for="txtFechaSolicitud"> Fecha solicitud: </label>
                <input type="date" id="txtFechaSolicitud" name="txtFechaSolicitud" 
                       placeholder="fecha entrega"><br>
                
                <input name="txtId" id="txtId" type="hidden" value="4"/><br>

                <input type="hidden" name="solicitarAsociacion" id="solicitarAsociacion" value="solicitar" />
                <input type="submit" value="Solicitar Pedido" id="btnSolicitarAsociacion" name="btnSolicitarAsociacion" />
            </div>



        </form>

    </body>
</html>
