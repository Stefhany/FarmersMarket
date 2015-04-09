<%-- 
    Document   : misofertas
    Created on : 05-mar-2015, 2:47:59
    Author     : Mona
--%>

<%@page import="facade.FacadeConsultas"%>
<%@page import="facade.FacadeOfertas"%>
<%@page import="daos.Consultas"%>
<%@page import="daos.ProductosAsociadosUsuariosDAO"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.OfertasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script type="text/javascript" src="../../js/paging.js"></script>
        <script src="../../js/jquery-1.11.2.min.js"></script>
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
                FacadeOfertas facadeOffer = new FacadeOfertas();
                ArrayList<OfertasDTO> ofertas = new ArrayList();
                ofertas = facadeOffer.consultarMisOfertas(userdto.getIdUsuarios());
                //ofertas = of.consultarMisOfertas(4);
                if (ofertas != null) {

        %>
        <title>SIGAA | Mis ofertas</title>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="../../img/banner.png" alt="" class="col-xs-12">
            </header>
            <div class="col-xs-12" >
                <ul id="bar"  style="float:left;">
                    <li><a href="../usuarios/perfil.jsp">Inicio</a></li>                    
                </ul>
                <div class="nav"> 						
                    <ul id="bar"  style="float:right;">
                        <li><a href="../usuarios/logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 400px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Mis ofertas</h1>
                                        <table border="1" name="solicitudes" id="results" class="table table-bordered" style="width:90%;">


                                            <thead>
                                                <tr>
                                                    <th>Tipo de producto</th>                   
                                                    <th>Nombre producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Unidad</th>
                                                    <th>Fecha finalización</th>
                                                    <th>Actualizar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                    for (OfertasDTO o : ofertas) {
                                                %>
                                                <tr>
                                                    <td><%=o.getIdAso().getProducto().getCategoriaId().getNombre()%></td>
                                                    <td><%=o.getIdAso().getProducto().getNombre()%></td> 
                                                    <td><%=o.getCantidad()%></td>
                                                    <td><%=o.getPrecio()%></td>
                                                    <td><%=o.getFechaFin()%></td>

                                                    <td><a href="modificarmioferta.jsp?idOffer=<%=o.getIdAso().getIdProductosAsociadosUsuarios()%>"><img src="../imagenes/actualizar.png" width="32" height="32" alt="Modificar oferta <%=o.getIdAso().getIdProductosAsociadosUsuarios()%>" 
                                                                                                                                                         title="Modificar oferta: <%=o.getIdAso().getIdProductosAsociadosUsuarios()%>" style="text-align:center; vertical-align: text-bottom;">
                                                        </a></td>
                                                </tr>
                                                <%
                                                        }
                                                    } else {
                                                        out.print("No tienes ofertas registradas.");
                                                    }%>
                                            </tbody>
                                        </table>

                                        <div style="cursor:pointer;" id="pageNavPosition"></div>
                                    </center>   
                                </div>

                            </div>    
                            <div class="submenu"  style="width: 15%; height: 400px; right: 20%;float: left; ">

                                <div id="submenu">
                                    <div class="barraleft" >

                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                    out.println(menu);

                                                } else {
                                                    response.sendRedirect("../index.jsp");
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
                    var pager = new Pager('results', 6);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            //--></script>
        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>
        </div>
    </body>    
</html>





