<%-- 
    Document   : gestionarrol
    Created on : 10-dic-2014, 7:21:09
    Author     : Sena
--%>
<%@page import="facade.FacadeUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="daos.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <script type="text/javascript" src="../../js/paging.js"></script>
        <SCRIPT language="JavaScript" src="../../js/products.js"></SCRIPT>
        <title>SIGAA | Usuarios</title>
        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este registro?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <%

            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                
                FacadeUsuarios facadeUsers = new FacadeUsuarios(); 
                ArrayList<UsuariosDTO> lista = new ArrayList<UsuariosDTO>();
                lista = (ArrayList<UsuariosDTO>) facadeUsers.consultarRegistros();
                
        %>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <div class="nav"> 
                    <ul id="bar"  style="float:left;">
                        <li><a href="perfil.jsp">Inicio</a></li>
                    </ul>
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 83%; height: 570px; left: 5%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Usuarios</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:0; height: 0%;">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Telefono</th>
                                                    <th>Dirrecion</th>                    
                                                    <th>Correo</th>
                                                    <th>Modificar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% 
                                                    for (UsuariosDTO u : lista) {
                                                %>
                                                <tr>
                                                    <!--<td><%=u.getIdUsuarios()%></td>-->
                                                    <td><%=u.getNombres()%></td>
                                                    <td><%=u.getApellidos()%></td>
                                                    <!--<td><%=u.getCedula()%></td>-->
                                                    <td><%=u.getTelefono()%></td>
                                                    <td><%=u.getDireccion()%></td>
                                                    <td><%=u.getCorreo()%></td>
                                                    <!--<td><%=u.isNotificacion()%></td>-->
                                                    <!--<td><%=u.getCiudad()%></td>-->
                                                    <!--<td><%=u.getFechaNacimiento()%></td>-->
                                                    <td><a href="gestionarrol.jsp?idUsuario=<%=u.getIdUsuarios()%>"><img src="../imagenes/cambiarRol.png" width="32" height="32" alt="Cambiar rol" title="Cambiar rol"></a></td>
                                                    <!--<td><a href="../Controlador?idUsuario=<%=u.getIdUsuarios()%>" onclick="return confirmar();"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar <%= u.getNombres()%>" title="Eliminar a: <%= u.getNombres() + " " + u.getApellidos()%>"/></a></td>-->
                                                </tr>
                                                <%
                                                        }%>
                                            </tbody>
                                        </table>
                                        <div style="cursor:pointer;" id="pageNavPosition"></div><a href="reporteusuarios.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel"></a>
                                    </center>   
                                </div>
                            </div>    
                            <div class="submenu"  style="width: 15%; height: 520px; right: 20%;float: left; ">

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
                    <div class="style">
                        <script>
                            function responder() {
                            <%
                                if (request.getParameter("msg") != null) {
                                    out.print(request.getParameter("msg"));
                                }
                            %>
                            }
                        </script>
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
        <script type="text/javascript">
            <!--
                    var pager = new Pager('results', 7);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            //--></script>
        <div class="style">
            <script>
            function responder() {
                <%
                    if (request.getParameter("msg") != null) {
                        out.print(request.getParameter("msg"));
                    }
                %>
            }
            </script>
        </div>
    </body>
</html>
