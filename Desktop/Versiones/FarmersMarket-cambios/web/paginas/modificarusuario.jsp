<%-- 
    Document   : perfils
    Created on : 09-dic-2014, 20:36:43
    Author     : Sena
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <title>Farmers Market | Datos Personales</title>

    </head>
    <body>
        <%
            UsuariosDTO userdto = new UsuariosDTO();
            UsuariosDAO userdao = new UsuariosDAO();
            userdto = userdao.consultarUnRegistro(6);
        %>
        
        <h1>Datos personales</h1>

        <form name="modificarusuario" method="post" action="../Controlador">

            <label for="txtNombres">Nombres:</label>
            <input name="txtNombres" id="txtNombres" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getNombres());
                       } 
                   %>" readonly/>

            <label for="txtApellidos">Apellidos:</label>
            <input name="txtApellidos" id="txtApellidos" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getApellidos());
                       } 
                   %>" readonly/> 

            <label for="txtCedula">Cédula:</label>
            <input name="txtCedula" id="txtCedula" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getCedula());
                       } 
                   %>" readonly/>

            <label for="txtTelefono">Teléfono:</label>
            <input name="txtTelefono" id="txtTelefono" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getTelefono());
                       } 
                   %>"/>
            
            <label for="txtDireccion">Dirección:</label>
            <input name="txtDireccion" id="txtDireccion" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getDireccion());
                       } 
                   %>"/>
            
            <label for="txtCorreo">Correo:</label>
            <input name="txtCorreo" id="txtCorreo" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getCorreo());
                       } 
                   %>"/>
            
            <label for="txtClave">Contraseña:</label>
            <input name="txtClave" id="txtClave" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getClave());
                       } 
                   %>"/>
            
            <label for="txtCiudad">Ciudad:</label>
            <input name="txtCiudad" id="txtCiudad" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getCiudad());
                       } 
                   %>"/>
            
            <label for="txtFechaNacimiento">Fecha de nacimiento:</label>
            <input name="txtFechaNacimiento" id="txtFechaNacimiento" type="text" 
                   value="<%if (userdto != null) {
                           out.print(userdto.getFechaNacimiento());
                       } 
                   %>" readonly/> 
            
            <input name="modificarUsuario" id="modificarUsuario" type="hidden"/>
            <input name="btnModificarUsuario" id="btnModificarUsuario" type="submit"
                   value="Actualizar datos"/>            

        </form>

        <%
            if (request.getParameter("msg") != null) {
                out.print(request.getParameter("msg"));
            }
        %>
    </body>
</html>
