<%-- 
    Document   : misproductos
    Created on : 05-mar-2015, 1:24:43
    Author     : Mona
--%>

<%@page import="facade.FacadeConsultas"%>
<%@page import="facade.FacadeProductosAsociadosUsuarios"%>
<%@page import="daos.Consultas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.ProductosAsociadosUsuariosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGAA | Mis productos</title>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">        
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="../../js/paging.js"></script>
        <script src="../../js/bootstrap.js"></script>

        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este producto?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <%
            HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO userdto = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");

                //int idUsuario = userdto.getIdUsuarios();
                //int id = Integer.parseInt(request.getParameter("idProductor"));
                FacadeProductosAsociadosUsuarios facadeProAso = new FacadeProductosAsociadosUsuarios();
                
                ArrayList<ProductosAsociadosUsuariosDTO> productos = new ArrayList();
                //productos = padao.listarProductosByUser(3);
                productos = facadeProAso.listarProductosByUser(userdto.getIdUsuarios());
                        
                if (productos != null) {
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
                        <li><a href="../usuarios/perfil.jsp">Inicio</a></li>
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
                            <div class="cuerpo" style="width: 85%; height: 410px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Mis productos</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:95%;">
                                            <thead>
                                                <tr>
                                                    <th>Cod</th>        
                                                    <th>Categoría</th>
                                                    <th>Nombre producto</th>
                                                    <th>Unidad</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (ProductosAsociadosUsuariosDTO pro : productos) {
                                                %>
                                                <tr>
                                                    <td><%=pro.getIdProductosAsociadosUsuarios()%></td>
                                                    <td><%=pro.getProducto().getCategoriaId().getNombre()%></td>
                                                    <td><%=pro.getProducto().getNombre()%></td>
                                                    <td>Kilogramos</td>
                                                    <td><a href="../../o?idProAso=<%=pro.getIdProductosAsociadosUsuarios()%>"><img src="../../imagenes/eliminar.png" width="32" height="32" 
                                                                                                                                alt="Eliminar la oferta: <%=pro.getIdProductosAsociadosUsuarios()%>" 
                                                                                                                                title="Eliminar el producto: <%=pro.getProducto().getNombre() %>" 
                                                                                                                                onclick="return confirmar();">
                                                        </a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }else{}
                                                %>
                                            </tbody>
                                        </table>


                                        <div style="cursor:pointer;" id="pageNavPosition"></div>
                                    </center>   
                                </div>

                            </div>    
                            <div class="submenu"  style=" width: 15%; height: 410px; right: 20%;float: left; ">

                                <div id="submenu">
                                    <div class="barraleft" >

                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                    out.println(menu);
                                                }else {
                                                    response.sendRedirect("../../index.jsp");
                                                }
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
                            <%
                                FacadeConsultas facadeConsults = new FacadeConsultas();
                                out.println(facadeConsults.consultarFecha());
                            %>                            
                            </li>
                        <li><a href="http://www.minagricultura.gov.co/">MinAgricultura</a></li>
                    </ul>
                </nav>
            </footer> 
        </div>  
        <script type="text/javascript">
            <!--
                    var pager = new Pager('results', 4);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            //--></script>
        <div class="style">
            <%
                if (request.getParameter ( 
                    "msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>
        </div>
    </body>
</html>

