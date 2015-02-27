<%-- 
    Document   : solicitarpedido
    Created on : 10/12/2014, 10:21:13 PM
    Author     : krito
--%>

<%@page import="daos.OfertasDAO"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="daos.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Farmers Market Solicitar Pedido</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
        <SCRIPT language="JavaScript" src="../js/products.js"></SCRIPT>
            <%
                OfertasDTO offerdto = new OfertasDTO();
                OfertasDAO offerdao = new OfertasDAO();
                offerdto = offerdao.consultByOffer(2);
              
                if(offerdto!=null){
                    out.println("ok");
                
                }else{
                    out.print("que defecada!!!");
                    offerdto=null;
                }
            %>
    </head>
    <body> 
        
        <form name="solicitarpedido" action="../cp" method="POST" align="center">

            <input name="txtIdAsociado" id="txtIdAsociado" type="hidden" value="<%if (offerdto != null) {
                    out.print(offerdto.getIdAso().getIdProductosAsociadosUsuarios());
                }
                   %>"/>
            
                        
            <input type="hidden" name="txtIdDistribuidor" id="txtIdDistribuidor"
                   value="4"/>
            
            <input name="txtIdOferta" id="txtIdOferta" type="hidden" 
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getIdOfertas());
                       }
                   %>"/>

            <label for="txtNombreProducto">Nombre del Producto:</label>
            <input type="text" name="txtNombreProducto" class="campo"  id="txtNombreProducto" 
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getIdAso().getProducto().getNombre());
                       }
                   %>" readonly="true"><br>
            <input type="hidden" name="idProducto" class="campo"  id="idProducto" 
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getIdAso().getProducto().getIdProductos());
                       }
                   %>"><br>

            <label for="txtNombreProductor">Nombre Productor: </label>
            <input type="text" name="txtNombreProductor" class="campo"  id="txtNombreProductor" 
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getIdAso().getUsuario().getNombres());
                       }
                   %>" readonly="true"><br> 
            
            <input name="idProductor" class="campo"  id="idProductor" type="hidden"
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getIdAso().getUsuario().getIdUsuarios());
                       }
                   %>"><br>

            <label for="txtCantidadOfertada">Cantidad ofertada: </label> 
            <input type="text" id="txtCantidadOfertada" name="txtCantidadOfertada" 
                   value="<%if (offerdto != null) {
                           out.print(offerdto.getCantidad());
                       }
                   %>" readonly="true"><br>

            <label for="  ">Cantidad solicitada: </label> 
            <input type="text" id="txtCantidadSolicitada" name="txtCantidadSolicitada" 
                   required>                

            <input size="1" placeholder="Kilos"><br>

            <label for="txtFechaSolicitud"> Fecha solicitud: </label>
            <input type="date" id="txtFechaSolicitud" name="txtFechaSolicitud"><br>

            <input type="hidden" name="solicitar" id="solicitar" value="solicitar" />
            <input type="submit" value="Solicitar Pedido" id="btnSolicitar" name="btnSolicitar" />
        <br>
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

    <%
        if (request.getParameter("msg") != null) {
            out.print(request.getParameter("msg"));
        }
    %>
</body>
</html>
