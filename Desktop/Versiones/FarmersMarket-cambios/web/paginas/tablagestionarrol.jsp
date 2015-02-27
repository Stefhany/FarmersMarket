<%-- 
    Document   : gestionarrol
    Created on : 10-dic-2014, 7:21:09
    Author     : Sena
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmers Market | Usuarios</title>
        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este registro?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%
            UsuariosDAO userDAO = new UsuariosDAO();
            ArrayList<UsuariosDTO> lista = new ArrayList<UsuariosDTO>();
            lista = (ArrayList<UsuariosDTO>) userDAO.consultarRegistros();
            UsuariosDTO userDTO = new UsuariosDTO();

        %>

        <table border="1">
            <thead>
                <tr>
                    <th>Id usuario</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Cedula</th>
                    <th>Telefono</th>
                    <th>Dirrecion</th>                    
                    <th>Correo</th>
                    <th>Notificacion</th>
                    <th>Ciudad</th>
                    <th>Fecha nacimiento</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%                    for (UsuariosDTO u : lista) {
                %>
                <tr>
                    <td><%=u.getIdUsuarios() %></td>
                    <td><%=u.getNombres()%></td>
                    <td><%=u.getApellidos()%></td>
                    <td><%=u.getCedula()%></td>
                    <td><%=u.getTelefono()%></td>
                    <td><%=u.getDireccion()%></td>
                    <td><%=u.getCorreo()%></td>
                    <td><%=u.isNotificacion()%></td>
                    <td><%=u.getCiudad()%></td>
                    <td><%=u.getFechaNacimiento()%></td>
                    <td><a href="modificarusuario.jsp" ><img src="../imagenes/cambiarRol.png" width="32" height="32" alt="Cambiar rol" title="Cambiar rol"></a></td>
                    <td><a href="../Controlador?idUsuario=<%=u.getIdUsuarios()%>" onclick="return confirmar();"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar <%= u.getNombres()%>" title="Eliminar a: <%= u.getNombres()+" "+u.getApellidos() %>"/></a></td>

                        
                </tr>
                
                <%
                    }%>
                       
            </tbody>
        </table>
                    <a href="reporteusuarios.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel"></a>
               
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>
    </body>
</html>
