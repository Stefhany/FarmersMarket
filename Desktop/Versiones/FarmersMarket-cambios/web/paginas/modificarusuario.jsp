<%-- 
    Document   : perfils
    Created on : 09-dic-2014, 20:36:43
    Author     : Sena
--%>

<%@page import="daos.Consultas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Datos Personales</title>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO userdto = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
        %>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../img/banner.png" alt="" class="col-xs-12">
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
                            <div class="cuerpo" style="width: 85%; height: 590px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Datos personales</h1>
                                        <div name="modificarusuario" style="width: 500px;">
                                            <form name="modificarusuario" method="post" action="../cu" class="form-horizontal">
                                                
                                                <input name="txtId" id="txtId" type="hidden" 
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
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtDireccion" class="col-sm-2 control-label">Dirección:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtDireccion" id="txtDireccion" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getDireccion());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtCorreo" class="col-sm-2 control-label">Correo:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCorreo" id="txtCorreo" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getCorreo());
                                                                   }
                                                               %>" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtCiudad" class="col-sm-2 control-label">Ciudad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCiudad" id="txtCiudad" type="text" 
                                                               value="<%if (userdto != null) {
                                                                       out.print(userdto.getCiudad());
                                                                   }
                                                               %>" class="form-control"/>
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
                                                    <input name="modificarUsuario" id="modificarUsuario" type="hidden"/>
                                                    <div>
                                                        <button name="btnModificarUsuario" id="btnModificarUsuario" type="submit" class="btn btn-default"
                                                                value="Actualizar datos">Actualizar perfil</button>         
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </center>
                                    <div>
                                        <%
                                            if (request.getParameter("msj") != null) {
                                                out.print(request.getParameter("msj"));
                                            }
                                        %>
                                    </div>
                                </div>

                            </div>    
                            <div class="submenu"  style="border: 1px solid #000; width: 15%; height: 520px; right: 20%;float: left; ">
                                <div id="submenu">
                                    <div class="barraleft" >
                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                    out.println(menu);

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
            <footer class="cnt" style="clear: both; "> 
                <nav>
                    <ul>
                        <li><a id="sena" href="http://www.sena.edu.co/">Sena</a></li>
                        <li>Stefhany Alfonso Rincón</li>
                            <li>Última actualización: 
                            <%Consultas c = new Consultas();
                            out.println(c.consultarFecha());%></li>
                        <li><a href="http://www.minagricultura.gov.co/">MinAgricultura</a></li>
                    </ul>
                </nav>
            </footer> 
        </div>  

        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>
        </div>
    </body>
</html>
