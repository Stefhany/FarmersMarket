<%-- 
    Document   : registrarofertas
    Created on : 10/12/2014, 10:20:06 PM
    Author     : krito
--%>

<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="daos.OfertasDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" onerror="">
        <title>Farmers Market | Registrar Oferta</title>
        <%
            ProductosAsociadosUsuariosDAO padao = new ProductosAsociadosUsuariosDAO();
            OfertasDTO ofdto = new OfertasDTO();
            OfertasDAO ofdao = new OfertasDAO();
            ArrayList<ProductosAsociadosUsuariosDTO> productos = new ArrayList<ProductosAsociadosUsuariosDTO>();
            productos = padao.listarProductosByUser(3);
            
        %>
    </head>
    <body>
        <form action="../Controlador" name="regOferta">
            
            <label for ="txtProductoAsociado">Nombre producto:</label>
            <select name="txtProductoAsociado">
                <% for (ProductosAsociadosUsuariosDTO pro : productos) {%>
                <option value="<%if (pro != null){out.print(pro.getIdProductosAsociadosUsuarios());}%>">
                    <%if (pro != null){out.print(pro.getProducto().getNombre());}%></option>
                <%
                    }
                %>
            </select><br>
            
            <label for ="txtCantidad">Cantidad:</label>
            <input name="txtCantidad" id="txtCantidad" type="text" value=""/><br>

            <label for ="txtPrecio">Precio:</label>
            <input name="txtPrecio" id="txtPrecio" type="text" value=""/><br>
            
            <input name="txtId" id="txtId" type="hidden" value=""/><br>
            
            
            <input type="hidden" name="registrarOferta" id="registrarOferta" value=""/>
            <input type="submit" value="Ofertar" name="btnRegistrarOferta"/>
        </form>
            
            <%
            if(request.getParameter("msg")!=null){
                out.print(request.getParameter("msg"));
            }
            %>
            
    </body>
</html>

