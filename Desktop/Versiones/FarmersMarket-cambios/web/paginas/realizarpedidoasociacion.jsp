<%-- 
    Document   : registrarpedido
    Created on : 27/01/2015, 03:50:39 PM
    Author     : krito
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="dtos.ProductoDTO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dtos.CategoriaDTO"%>
<%@page import="daos.CategoriaDAO"%>
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
        <script src="../js/funciones.js" type="text/javascript"></script>
        <script type="text/javascript" src="javascript/validacion.js"></script>
        <SCRIPT language="JavaScript" src="../js/products.js"></SCRIPT>
        <title>SIGAA | Realizar pedido</title>
        <%
            ProductoDTO pdto = new ProductoDTO();
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
                                        <h2>Registrar pedido</h2>
                                        <div name="registrarSolicitud" style="width: 500px; text-align: center;">
                                            <form name="registrarSolicitud" action="../cp" method="post"> 
                                                <div class="form-group input-group input-group-lg">
                                                    <label for="categorias" class="col-sm-2 control-label">Tipo de producto:</label>
                                                    <div class="col-sm-10">
                                                        <select name="categorias" size="1" class="form-control" id="categorias" onchange="listarcategorias(this.value);">
                                                            <option>Categoría del producto</option>
                                                            <%  CategoriaDAO cdao = new CategoriaDAO();
                                                                LinkedList<CategoriaDTO> categorias = new LinkedList();
                                                                categorias = cdao.listarCategorias2();
                                                                for (CategoriaDTO cdto : categorias) {
                                                            %>   
                                                            <option value="<%=cdto.getIdCategoria()%>"> <%=cdto.getNombre()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div><br>
                                                <div class="form-group input-group input-group-lg">
                                                    <label for="subcategoria" class="col-sm-2 control-label">Nombre del Producto:</label>
                                                    <div class="col-sm-10">
                                                        <select name="subcategoria" size="1" id="subcategoria" class="form-control">
                                                            <option value="<%=pdto.getIdProductos()%>" >Elija un producto</option>
                                                        </select>
                                                    </div>
                                                </div><br>
                                                <div class="form-group input-group input-group-lg">
                                                    <label for="txtCantidad" class="col-sm-2 control-label">Cantidad: </label> 
                                                    <div class="col-sm-10">
                                                        <input type="text" id="txtCantidad" name="txtCantidad" 
                                                               placeholder="Cantidad solicitada" value="" class="form-control" size="30">
                                                    </div>
                                                </div>
                                                <div class="form-group input-group input-group-lg">
                                                    <label for="txtCantidad" class="col-sm-2 control-label">Unidad: </label> 
                                                    <div class="col-sm-10">
                                                        <input placeholder="Kilogramos" class="form-control" readonly="true" size="30"><br>
                                                    </div>
                                                </div>

                                                <div class="form-group input-group input-group-lg">
                                                    <label for="txtFechaSolicitud" class="col-sm-2 control-label"> Fecha solicitud: </label>
                                                    <div class="col-sm-10">
                                                        <input type="date" id="txtFechaSolicitud" name="txtFechaSolicitud" 
                                                               class="form-control" onblur="javascript:validar();" size="30">

                                                    </div>
                                                    <div id="result" class="mensajegError">              
                                                    </div>
                                                </div>
                                                <input name="txtId" id="txtId" type="hidden" value="4"/>

                                                <input type="hidden" name="solicitarAsociacion" id="solicitarAsociacion" value="solicitar" />
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" value="Solicitar Pedido" id="btnSolicitarAsociacion" 
                                                                name="btnSolicitarAsociacion" class="btn btn-default">Solicitar</button>
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

        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
            %>
        </div>
    </body>
</html>
