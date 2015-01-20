<%-- 
    Document   : modificarproducto
    Created on : 10/12/2014, 10:18:45 PM
    Author     : krito
--%>

<%@page import="dtos.CategoriaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoriaDAO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page import="daos.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar producto</title>
        <%
            ProductoDAO pdao = new ProductoDAO();
            ProductoDTO pdto = new ProductoDTO();
            CategoriaDAO cdao = new CategoriaDAO();
            ArrayList<CategoriaDTO> categorias = new ArrayList();
            categorias = (ArrayList<CategoriaDTO>) cdao.listarCategorias();
            pdto = pdao.consultarById(8);
        %>
    </head>
    <body>
        <form action="../Controlador" name="modProducto" method="post">
            <label for ="txtNombre">Nombre del producto:</label>
            <input name="txtNombre" id="txtNombre" type="text" value="<%if (pdto != null) {
                    out.print(pdto.getNombre());}%>" /><br>
            <label for ="txtUnidad">Unidad:</label>
            <input name="txtUnidad" id="txtUnidad" type="text" value="<%if (pdto != null) {
                    out.print(pdto.getUnidad());
                }
                   %>" readonly="true"/><br>
            <label for ="txtCategoria">Categoría:</label>                        
            <select name="txtCategoria">
                <% for (CategoriaDTO categoria : categorias) {%>
                <option value="<% if (categoria != null) {
                        out.print(categoria.getIdCategoria());
                    }%>"><%if (categoria != null) {
                            out.print(categoria.getNombre());
                        }%></option>
                    <%
                        }
                    %>
            </select>

            <input type="hidden" name="actualizarProducto" id="actualizarProducto" value=""/>
            <input type="submit" value="Actualizar" name="btnActualizarProducto"/>
        </form>
    </body>
</html>