<%-- 
    Document   : registrarofertas
    Created on : 10/12/2014, 10:20:06 PM
    Author     : krito
--%>

<%@page import="daos.OfertasDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Oferta</title>
        <%
            ProductoDTO pdto = new ProductoDTO();
            OfertasDTO ofdto = new OfertasDTO();
            OfertasDAO ofdao = new OfertasDAO();
            ArrayList<ProductoDTO> productos = new ArrayList<ProductoDTO>();
            productos = (ArrayList<ProductoDTO>)ofdao.listarProductosAsociado(10);
        %>
    </head>
    <body>
        <form action="../Controlador" name="regOferta">
            
            <label for ="txtProducto">Nombre producto:</label>
            <select name="txtProducto">
                <% for (ProductoDTO pro : productos) {%>
                <option value="<%if (pro != null){out.print(pro.getIdProductos());}%>">
                    <%if (pro != null){out.print(pro.getNombre());}%></option>
                <%
                    }
                %>
            </select><br>
            
            <label for ="txtCantidad">Cantidad:</label>
            <input name="txtCantidad" id="txtCantidad" type="text" value=""/><br>

            <label for ="txtPrecio">Precio:</label>
            <input name="txtPrecio" id="txtPrecio" type="text" value=""/><br>
            
            <input name="txtId" id="txtId" type="hidden" value="4"/><br>
            
            
            <input type="hidden" name="registrarOferta" id="registrarOferta" value=""/>
            <input type="submit" value="Ofertar" name="btnRegistrarOferta"/>
        </form>
    </body>
</html>

