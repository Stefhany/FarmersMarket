<%-- 
    Document   : generarexcel
    Created on : 26-ago-2014, 9:27:18
    Author     : SEBAS
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.UsuariosDAO"%>
<%@page import="java.util.Date"%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
        <title>Reporte de usuarios</title>
        <%

            UsuariosDAO userDAO = new UsuariosDAO();
            ArrayList<UsuariosDTO> lista = new ArrayList<UsuariosDTO>();
            lista = (ArrayList<UsuariosDTO>) userDAO.consultarRegistros();
            UsuariosDTO userDTO = new UsuariosDTO();

        %>   
    </head>
    <body>
        <table border="1">
            <thead>
                <tr style="background-color: #FE9A2E; color: #FFF; border: #BC8D4B">
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
                </tr>
            </thead>
            <tbody>
                <%                    
            String reportesUsuarios = "Usuarios de Farmers market" + new Date() + ".xls";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + reportesUsuarios + "\"");
                for (UsuariosDTO u : lista) {
                %>
                <tr>
                    <th><%out.write(u.getIdUsuarios() + "\t");%>
                    <td><%out.write(u.getNombres() + "\t");%></td>
                    <td><%out.write(u.getApellidos() + "\t");%></td>
                    <td><%out.write(u.getCedula() + "\t");%></td>
                    <td><%out.write(u.getTelefono() + "\t");%></td>
                    <td><%out.write(u.getDireccion() + "\t");%></td>
                    <td><%out.write(u.getCorreo() + "\t");%></td>
                    <td><%out.write(u.isNotificacion() + "\t");%></td>
                    <td><%out.write(u.getCiudad() + "\t");%></td>
                    <td><%out.write(u.getFechaNacimiento()+ "\t");%></td>
                <%

                        out.write("\n");
                    }
                %>    
            </tbody>
        </table> 
    </body>
</html>
