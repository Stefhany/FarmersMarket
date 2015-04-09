<%-- 
    Document   : listarofertas
    Created on : 10/12/2014, 10:14:57 PM
    Author     : krito
--%>

<%@page import="facade.FacadeOfertas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.OfertasDTO"%>
<%@page import="daos.OfertasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGAA | Ofertas</title>
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
            FacadeOfertas facadeOffer = new FacadeOfertas();
            LinkedList<OfertasDTO> offers = new LinkedList();
            offers = (LinkedList<OfertasDTO>) facadeOffer.consultarOfertas();
        %>
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
                            <div class="cuerpo" style="width: 85%; height: 520px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Ofertas</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:95%;">
                                            <thead>
                                                <tr>
                                                    <th>Nombre productor</th>
                                                    <th>Tipo de producto</th>                   
                                                    <th>Nombre producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Unidad</th>
                                                    <th>Precio</th>
                                                    <th>Solicitar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (OfertasDTO ofer : offers) {
                                                %>
                                                <tr>
                                                    <td><%=ofer.getUser().getNombres()%></td> 
                                                    <td><%=ofer.getProducts().getCategoriaId().getNombre()%></td>
                                                    <td><%=ofer.getProducts().getNombre()%></td>
                                                    <td><%=ofer.getCantidad()%></td>
                                                    <td><%=ofer.getProducts().getUnidad()%></td>
                                                    <td><%=ofer.getPrecio()%></td>
                                                    
                                                    <%-- <td><a href="listarofertas.jsp?idOffer=<%=ofer.getIdOfertas()%>"><img src="../imagenes/order.png" width="32" height="32" alt="Solicitar " 
                                                                                                                          title="Solicitar el producto: " onclick="window.open('solicitarpedido.jsp',
                                                                                                  'Solicitar Pedido', 'width=100', 'height=200', 'menubar=No')">
                                                    </a></td>
                                                    <td><a href="../ofertas/modificaroferta.jsp?id=<%=ofer.getIdOfertas()%>"><img src="../../imagenes/modificar.png" width="32" height="32" alt="Modificar oferta <%=ofer.getProducts().getNombre()%>" 
                                                                                                                       title="Modificar oferta: <%=ofer.getProducts().getNombre()%>">
                                                        </a></td>
                                                    <td><a href="../Controlador?idOfertas=<%=ofer.getIdOfertas()%>"><img src="../../imagenes/eliminar.png" width="32" height="32" alt="Eliminar la oferta: <%=ofer.getProducts().getNombre()%>" 
                                                                                                                         title="Elimianr la oferta de: <%=ofer.getProducts().getNombre()%>" onclick="return confirmar();">
                                                        </a></td>
                                                    --%>
                                                    
                                                    <td><a href="../solicitudes/solicitaroferta.jsp?idOffer=<%=ofer.getIdOfertas()%>"><img src="../../imagenes/order.png" width="32" height="32" alt="Solicitar <%=ofer.getProducts().getNombre()%>" 
                                                                                                                          title="Solicitar el producto: <%=ofer.getProducts().getNombre()%>" width=100', height=200, menubar=No">
                                                    </a></td>
                                                    
                                                    
                                                </tr>
                                                <%
                                                }%>
                                            </tbody>
                                        </table>
                                            <a href="../reportes/reporteofertas.jsp"><img src="../../imagenes/excel.png" width="32" height="32" title="Descargar en Excel" alt="Generar excel"></a>
                                        <div style="cursor:pointer;" id="pageNavPosition"></div>
                                    </center>   
                                </div>

                            </div>    
                            <div class="submenu"  style="border: 1px solid #000; width: 15%; height: 520px; right: 20%;float: left; ">

                                <div id="submenu">
                                    <div class="barraleft" >

                                        <div class="panel-body" id="menuStyle">
                                            <%
                                                HttpSession miSesion = request.getSession(false);
                                                if (miSesion.getAttribute("usr") != null) {
                                                    UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                                                    String menu = (String) miSesion.getAttribute("mp");

                                                    out.print("Usuario : " + uregistrado.getNombres());
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
            <footer class="cnt"> Pie de Pagina </footer> 
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
