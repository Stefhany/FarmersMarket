<%-- 
    Document   : listarsolicitudesproductores
    Created on : 21-feb-2015, 9:15:57
    Author     : Mona
--%>

<%@page import="dtos.SolicitudDistribuidorDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.AportesProductoresDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market Solicites a productores</title>
    </head>
    
       <body>
        
        <%
            AportesProductoresDAO soldao = new AportesProductoresDAO();
            LinkedList<SolicitudDistribuidorDTO> solicitudes = new LinkedList();
            solicitudes = soldao.listarSolicitudesDeAsociacion();
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
                    <th>Fecha de entrega a asoción</th>
                    <th>Aplicar</th>
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
                    <td><%=ped.getFechaEntregaInterna()%></td>
                    <td><a href="aplicarsolicitudasociacion.jsp?id=<%=ped.getIdSolicitud()%>"><img src="../imagenes/order.png"
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
