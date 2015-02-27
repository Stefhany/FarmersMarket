<%-- 
    Document   : listarsolicitudes
    Created on : 30/01/2015, 04:01:10 PM
    Author     : krito
--%>

<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page import="daos.SolicitudDistribuidorDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Pedidos Solicitados</title>
    </head>
    <body>
        
        <%
            SolicitudDistribuidorDAO soldao = new SolicitudDistribuidorDAO();
            LinkedList<SolicitudDistribuidorDTO> solicitudes = new LinkedList();
            solicitudes = soldao.listarSolicitudesDistribuidor();
        %>

        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este pedido?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <table name="solicitudes" border="1">
            <thead>
                <tr>                    
                    <th>Distribuidor</th>
                    <th>Nombre producto</th>
                    <th>Cantidad solicitada</th>
                    <th>Unidad</th>
                    <th>Fecha solicitada</th>
                    <th>Generar pedido a productores</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>                
            </thead>
            <tbody>
                <%
                    for (SolicitudDistribuidorDTO ped : solicitudes) {
                %>
                <tr>
                    <td><%=ped.getUser().getNombres()%></td>
                    <td><%=ped.getProduct().getNombre()%></td>
                    <td><%=ped.getCantidadSolicitada()%></td>  
                    <td>Kilogramos</td>
                    <td><%=ped.getFechaSolicitud()%></td>
                    <td><a href="generarpedidoaproductores.jsp?id=<%=ped.getIdSolicitud()%>"><img src="../imagenes/order.png"
                                                                                    whith="32" height="32" title="Generar pedido"
                                                                                    alt="Generar pedido" align="center"/>
                        </a>
                    </td>
                    <td><a href="../cp?idSolicitud=<%=ped.getIdSolicitud()%>"><img src="../imagenes/eliminar.png"
                                                                                       whith="32" height="32" title="Eliminar solicitud"
                                                                                       alt="Eliminar solicitud"
                                                                                       onclick="return confirmar();"/>
                        </a>
                    </td>
                    <td><a href="modificarpedido.jsp?id=<%=ped.getIdSolicitud()%>"><img src="../imagenes/modificar.png"
                                                                                      whith="32" height="32" title="Modificar solicitud"
                                                                                      alt="Modificar solicitud"/>
                        </a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
            
            <a href="reportepedidos.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel"></a>
            
        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>

        </div>
    </body>
</html>
