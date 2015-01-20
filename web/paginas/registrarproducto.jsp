<%-- 
    Document   : registrarproducto
    Created on : 10/12/2014, 10:11:02 PM
    Author     : krito
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="daos.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar producto</title>
        <%
            CategoriaDAO cdao = new CategoriaDAO();
            CategoriaDTO cdto = new CategoriaDTO();
            ArrayList<CategoriaDTO> categorias = new ArrayList();
            categorias = (ArrayList<CategoriaDTO>) cdao.listarCategorias();
        %>
    </head>
    <body>
        <form action="../Controlador" name="regProducto">
            <label for ="txtNombre">Nombre:</label>
            <input name="txtNombre" id="txtNombre" type="text" value=""/><br>
            <label for ="txtUnidad">Unidad:</label>
            <input name="txtUnidad" id="txtUnidad" type="text" value="Kg" readonly=""/><br>
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

            <input type="hidden" name="registrar" id="registrar" value=""/>
            <input type="submit" value="Registrar" name="btnRegistrar"/>
        </form>
    </body>
</html>
