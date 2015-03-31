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
<!DOCTYPE html><!--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script> 
        <title>SIGAA | Solicitar pedido</title>
    </head>
    <body> 



        <div class="modal fade" id="miventana" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" name="boton" class="close" data-dismiss="modal" value="Solicitar"  aria-hidden="true" onclick="pasarValor();" href="../listarofertas.jsp">Volver</button>
                        <center><h4>Solicitar pedido</h4></center>
                    </div>

                    <div class="modal-body" style="height: 450px;">
<%
    //if (request.getParameter ( 
    //  "idOffer") != null) {
    //int idOffer = Integer.parseInt(request.getParameter("idOffer"));
    //OfertasDTO offerdto = new OfertasDTO();
    //OfertasDAO offerdao = new OfertasDAO();
    //offerdto = offerdao.consultByOffer(7);
%>

    <input name="txtIdAsociado" id="txtIdAsociado" type="hidden" value="<%//if (offerdto != null) {
        //out.print(offerdto.getIdAso().getIdProductosAsociadosUsuarios());
        //}
%>"/><br>


<input type="hidden" name="txtIdDistribuidor" id="txtIdDistribuidor"
value="4"/>


<input name="txtIdOferta" id="txtIdOferta" type="hidden" 
value="<%//if (offerdto != null) {
    //out.print(offerdto.getIdOfertas());
    //}
%>"/>
<div class="form-group">
<label for="txtNombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
<div class="col-sm-10">
 <input class="form-control" type="text" name="txtNombreProducto" class="campo"  id="txtNombreProducto" 
        value="<%//if (offerdto != null) {
            //       out.print(offerdto.getIdAso().getProducto().getNombre());
            // }
%>" readonly="true">
</div>
</div><br><br>
<input type="hidden" name="idProducto" class="campo"  id="idProducto" 
value="<%//if (offerdto != null) {
//out.print(offerdto.getIdAso().getProducto().getIdProductos());
//}
%>"><br>

<div class="form-group">
<label for="txtNombreProductor" class="col-sm-2 control-label">Nombre Productor: </label>
<div class="col-sm-10">
 <input  class="form-control" type="text" name="txtNombreProductor" class="campo"  id="txtNombreProductor" 
         value="<%//if (offerdto != null) {
             //out.print(offerdto.getIdAso().getUsuario().getNombres());
             // }
%>" readonly="true">
</div>
</div>
<input name="idProductor" class="campo"  id="idProductor" type="hidden"
value="<%//if (offerdto != null) {
//out.print(offerdto.getIdAso().getUsuario().getIdUsuarios());
//}
%>"><br><br>
<div class="form-group">
<label for="txtCantidadOfertada" class="col-sm-2 control-label">Cantidad ofertada: </label> 
<div class="col-sm-10">
 <input type="text" id="txtCantidadOfertada" name="txtCantidadOfertada" 
        value="//<%//if (offerdto != null) {
            //out.print(offerdto.getCantidad());
            //}
%>" readonly="true" class="form-control"><br>
</div>
</div>
<div class="form-group">
<label for="txtCantidadSolicitada" class="col-sm-2 control-label">Cantidad solicitada: </label> 
<div class="col-sm-10">
<input type="text" id="txtCantidadSolicitada" name="txtCantidadSolicitada" 
required="true" class="form-control"><br>
</div>
</div>
<div class="form-group">
<label for="txtUnidad" class="col-sm-2 control-label">Unidad: </label> 
<div class="col-sm-10">
<input value="Kilos" class="form-control" readonly="true"><br>
</div>
</div>
<div class="form-group">
<label for="txtFechaSolicitud" class="col-sm-2 control-label"> Fecha solicitud: </label>
<div class="col-sm-10">
<input type="date" id="txtFechaSolicitud" name="txtFechaSolicitud" class="form-control"><br>
</div>
</div>
<input type="hidden" name="solicitar" id="solicitar" value="solicitar" />

<div class="form-group" style="text-align: center;">
<div>
<button type="submit" class="btn btn-default" value="Solicitar Pedido" 
 id="btnSolicitar" name="btnSolicitar">Solicitar Pedido</button>
</div>
</div>
</form>
<%//} else {
    //}%>
</div>	 
</div>
</div>
</div>
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
</html>-->

<html>
    <head>
        <title>Solicitar pedido</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <%
            OfertasDTO offerdto = new OfertasDTO();
            OfertasDAO offerdao = new OfertasDAO();
            offerdto = offerdao.consultByOffer(7);
        %>
    </head>
    <body>  
        <div class="contenedor" >
            <form name="solicitarpedido" action="../cp" method="POST" style="width: 500px;">
                <center><h1>Solicitar pedido</h1></h1></center>
                <center> 
                    <table style="width:50%" name="table2">
                        <tr>
                        <input name="txtIdAsociado" id="txtIdAsociado" type="text" value="<%if (offerdto != null) {
                            out.print(offerdto.getIdAso().getIdProductosAsociadosUsuarios());
                            }
                               %>"/><br>
                        <td>
                            <div class="form-group">
                                <label for="txtNombreProductor" class="col-sm-2 control-label">Nombre Productor: </label>
                                <div class="col-sm-10">
                                    <input  class="form-control" type="text" name="txtNombreProductor" class="campo"  id="txtNombreProductor" 
                                            value="<%if (offerdto != null) {
                                                    out.print(offerdto.getIdAso().getUsuario().getNombres());
                                                }
                                            %>" readonly="true">
                                    </td>
                                    </tr>
                                    <tr>
                                        <td><div class="form-group">
                                                <label for="txtNombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" type="text" name="txtNombreProducto" class="campo"  id="txtNombreProducto" 
                                                           value="<%if (offerdto != null) {
                                                                   out.print(offerdto.getIdAso().getProducto().getNombre());
                                                               }
                                                           %>" readonly="true">
                                                </div>
                                            </div>
                                </div>                                                 
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
