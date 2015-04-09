<%-- 
    Document   : listarproductos
    Created on : 10/12/2014, 10:16:19 PM
    Author     : krito
--%>

<%@page import="facade.FacadeCategorias"%>
<%@page import="facade.FacadeProductos"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.ProductoDTO"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="daos.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGAA | Productos</title>
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="icon" href="../../img/favicon.ico" type="image/x-ico"/>
        <script src="../../js/jquery-1.11.2.min.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
        <script>
            function confirmar() {
                if (confirm('¿Esta seguro de borrar este producto?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <script type="text/javascript" src="../js/paging.js"></script>

        <%
            FacadeProductos facadeProducts = new FacadeProductos();
            LinkedList<ProductoDTO> productos = new LinkedList();
            productos = (LinkedList<ProductoDTO>) facadeProducts.listarAllProducts();
            
            FacadeCategorias facadeCategories = new FacadeCategorias();
            ArrayList<CategoriaDTO> categorias = new ArrayList();
            categorias = (ArrayList<CategoriaDTO>) facadeCategories.listarCategorias();
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
                                        <h1>Productos</h1>
                                        <table border="1" id="results" class="table table-bordered" style="width:95%;">
                                            <thead>
                                                <tr>
                                                    <th>Codigo</th>
                                                    <th>Nombre producto</th>
                                                    <th>Unidad</th>
                                                    <th>Categoria</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (ProductoDTO p : productos) {
                                                %>
                                                <tr>
                                                    <td><%=p.getIdProductos()%></td>
                                                    <td><%=p.getNombre()%></td>
                                                    <td><%=p.getUnidad()%></td>
                                                    <td><%=p.getCategoriaId().getNombre()%></td>
                                                    <td><a href="../../Controlador?idProducto=<%=p.getIdProductos()%>" onclick="return confirmar();"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar producto" title="Eliminar producto"/>
                                                        </a></td>
                                                </tr>
                                                <%
                                                        }%>

                                            </tbody>
                                        </table>

                                                        <a href="../reportes/reporteproductos.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel" alt="Generar excel"></a>

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
