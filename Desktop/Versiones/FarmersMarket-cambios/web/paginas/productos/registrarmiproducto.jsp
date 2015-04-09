<%-- 
    Document   : registrarmiproducto
    Created on : 18-mar-2015, 13:01:28
    Author     : Mona
--%>

<%@page import="facade.FacadeCategorias"%>
<%@page import="facade.FacadeConsultas"%>
<%@page import="daos.Consultas"%>
<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoriaDAO"%>
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
        <title>SIGAA | Registrar producto</title>
        <%  HttpSession miSesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                
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
                    <ul id="bar"  style="float:right;">
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>	
            </div>

            <div class="row">

                <center>    
                    <div class="main" style="width: 96%;" >
                        <div class="row">
                            <div class="cuerpo" style="width: 85%; height: 590px; left: 25%;  float: right; margin-bottom: -190px">

                                <div class="derecha" style="margin-top: 15px; text-align: center;">
                                    <center>
                                        <h1>Registrar producto</h1>
                                        <div name="regProducto" style="width: 500px;">
                                            <form action="../../cpro" name="regProductoAso" method="post" class="form-horizontal" align="center">
                                                
                                                        <input name="txtIdUsu" id="txtIdUsu" type="hidden" value="<%=uregistrado.getIdUsuarios()%>" class="form-control"/><br>
                                                
                                                <div class="form-group">
                                                    <label for ="txtNombre" class="col-sm-2 control-label">Nombre:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtNombre" id="txtNombre" type="text" value="" class="form-control"/><br>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for ="txtUnidad" class="col-sm-2 control-label">Unidad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtUnidad" id="txtUnidad" type="text" value="Kg" readonly="true" class="form-control"/><br>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for ="txtCategoria" class="col-sm-2 control-label">Categoría:</label>  
                                                    <div class="col-sm-10">
                                                        <select name="txtCategoria" class="form-control">
                                                            <% for (CategoriaDTO categoria : categorias) {%>
                                                            <option value="<% if (categoria != null) {
                                                                    out.print(categoria.getIdCategoria());
                                                                }%>"><%if (categoria != null) {
                                                                        out.print(categoria.getNombre());
                                                                    }%></option>
                                                                <%
                                                                    }
                                                                %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <input type="hidden" name="registrarProAso" id="registrarProAso" value=""/>

                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="btnRegistrarProAso"
                                                                class="btn btn-default" id="btnRegistrarProAso"/>Registrar</button>
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
                            <div class="submenu"  style="width: 15%; height: 520px; right: 20%;float: left; margin-bottom: -190px; ">
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
                            %></li>
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

