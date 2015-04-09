<%-- 
    Document   : gestionarrol
    Created on : 08-mar-2015, 19:21:55
    Author     : Mona
--%>

<%@page import="facade.FacadeUsuarios"%>
<%@page import="facade.FacadeRoles"%>
<%@page import="daos.UsuariosDAO"%>
<%@page import="dtos.RolesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.RolesDAO"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                
                UsuariosDTO u = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                
                FacadeRoles facadeRol = new FacadeRoles();
                ArrayList<RolesDTO> roles = new ArrayList();
                roles = (ArrayList<RolesDTO>) facadeRol.listarRoles();
                
                
                if (request.getParameter("idUsuario") != null) {
                    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                    UsuariosDTO userdto = new UsuariosDTO();
                    
                    FacadeUsuarios facadeUsers = new FacadeUsuarios();
                    userdto = facadeUsers.consultarUnRegistro(idUsuario);
                        
        %>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Cambiar rol</title>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                    <ul id="bar"  style="float:left;">
                        <li><a href="perfil.jsp">Inicio</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">
                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 630px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Datos personales</h1>
                                        <div name="modificarusuario" style="width: 500px;">
                                            <form name="modificarusuario" method="post" action="../../cr" class="form-horizontal">

                                                <input name="txtIdUser" id="txtIdUser" type="text" 
                                                       value="<%if (userdto != null) {
                                                               out.print(userdto.getIdUsuarios());
                                                           }
                                                       %>"/>
                                                <div class="form-group">
                                                    <label for="txtNombres" class="col-sm-2 control-label">Nombres:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtNombres" id="txtNombres" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getNombres());
                                                                   }
                                                               %>" readonly='true' class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtApellidos" class="col-sm-2 control-label">Apellidos:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtApellidos" id="txtApellidos" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getApellidos());
                                                                   }
                                                               %>" readonly='true' class="form-control"/> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtCedula" class="col-sm-2 control-label">Cédula:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCedula" id="txtCedula" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getCedula());
                                                                   }
                                                               %>" readonly='true' class="form-control"/> 
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtTelefono" class="col-sm-2 control-label">Teléfono:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtTelefono" id="txtTelefono" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getTelefono());
                                                                   }
                                                               %>" class="form-control" readonly="true"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtDireccion" class="col-sm-2 control-label">Dirección:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtDireccion" id="txtDireccion" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getDireccion());
                                                                   }
                                                               %>" class="form-control" readonly="true"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtCorreo" class="col-sm-2 control-label">Correo:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCorreo" id="txtCorreo" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getCorreo());
                                                                   }
                                                               %>" class="form-control" readonly="true"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtCiudad" class="col-sm-2 control-label">Ciudad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCiudad" id="txtCiudad" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getCiudad());
                                                                   }
                                                               %>" class="form-control" readonly="true"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtFechaNacimiento" class="col-sm-2 control-label">Fecha de nacimiento:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtFechaNacimiento" id="txtFechaNacimiento" type="date" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getFechaNacimiento());
                                                                   }
                                                               %>" readonly='true' class="form-control"/> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for ="txtRol" class="col-sm-2 control-label">Rol:</label>  
                                                    <div class="col-sm-10">
                                                        <select name="txtRol" id="txtRol" class="form-control">
                                                            <% for (RolesDTO rol : roles) {%>
                                                            <option name="txtRol" value="<% if (rol != null) {
                                                                    out.print(rol.getIdRol());
                                                                }%>"><%if (rol != null) {
                                                                        out.print(rol.getNombre());
                                                                    }%></option>
                                                                <%
                                                                    }
                                                                %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <input name="cambiarRol" id="cambiarRol" type="hidden"/>
                                                    <div>
                                                        <button name="btnCambiarRol" id="btnCambiarRol" type="submit" 
                                                                class="btn btn-default">Actualizar rol</button>         
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </center>

                                </div>

                            </div>    
                            <div class="submenu"  style="width: 15%; height: 520px; right: 20%;float: left; ">
                                <div id="submenu">
                                    <div class="barraleft" >
                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                    out.println(menu);
                }
                                                } else {
                                                    response.sendRedirect("../index.jsp");
                                                }
                                                //class="text-left"
                                            %>
                                        </div>   
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </center>
            </div>	 			
            <footer class="cnt" style="clear: both;"> 
                <nav>
                    <ul>
                        <li><a id="google" href="https://www.google.com.co">Google</a></li>
                        <li><a id="facebook" href="https://www.facebook.com/">Facebook</a></li>
                        <li><a id="twitter" href="https://twitter.com/">Twitter</a></li>
                        <li><a id="instagram" href="http://instagram.com/">Instagram</a></li>
                        <li><a id="winsports" href="http://www.minagricultura.gov.co/">MinAgricultura</a></li>
                    </ul>
                </nav>
            </footer> 
        </div>  
    </body>
</html>
