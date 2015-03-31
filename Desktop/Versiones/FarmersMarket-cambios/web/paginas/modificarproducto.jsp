<%-- 
    Document   : modificarproducto
    Created on : 10/12/2014, 10:18:45 PM
    Author     : krito
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoriaDAO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page import="daos.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../img/favicon.ico" type="image/x-ico"/>
        <script src="../js/jquery-1.11.2.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <title>SIGAA | Actualizar Producto</title>
        <%
            ProductoDAO pdao = new ProductoDAO();
            ProductoDTO pdto = new ProductoDTO();
            CategoriaDAO cdao = new CategoriaDAO();
            ArrayList<CategoriaDTO> categorias = new ArrayList();
            categorias = (ArrayList<CategoriaDTO>) cdao.listarCategorias();
            pdto = pdao.consultarByIdProduct(8);
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
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 520px; left: 25%;  float: right;">

                                <div class="derecha">
                                    <center>
                                        <h1>Actualizar producto</h1><br>
                                        <div name="modProducto" style="width: 500px;">
                                            <form action="../Controlador" name="modProducto" method="post" class="form-horizontal">
                                                <div class="form-group">
                                                    <label for ="txtNombre" class="col-sm-2 control-label">Nombre del producto:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtNombre" id="txtNombre" type="text" value="<%if (pdto != null) {
                                                                out.print(pdto.getNombre());
                                                            }%>" class="form-control"/>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for ="txtUnidad" class="col-sm-2 control-label">Unidad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtUnidad" id="txtUnidad" type="text" value="<%if (pdto != null) {
                                                                out.print(pdto.getUnidad());
                                                            }
                                                               %>" readonly="true" selected="true" class="form-control"/>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for ="txtCategoria" class="col-sm-2 control-label">Categoría:</label>
                                                    <div class="col-sm-10">
                                                        <select name="txtCategoria" class="form-control">
                                                            <% for (CategoriaDTO categoria : categorias) {%>
                                                            <option value="<% if (categoria != null) {
                                                                    out.print(categoria.getIdCategoria());
                                                                }%>" selected="true" ><%if (categoria != null) {
                                                                        out.print(categoria.getNombre());
                                                                    }%></option>
                                                                <%
                                                                    }
                                                                %> 
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <input type="hidden" name="actualizarProducto" id="actualizarProducto" value=""/>
                                                        <button type="submit" value="Actualizar" name="btnActualizarProducto" class="btn btn-default">Actualizar</button>
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

        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>

        </div>
    </body>
</html>