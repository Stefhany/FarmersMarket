<%-- 
    Document   : modificaroferta
    Created on : Jan 20, 2015, 11:54:35 AM
    Author     : rodrigoaranda
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page import="daos.OfertasDAO"%>
<%@page import="dtos.OfertasDTO"%>
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
        <title>SIGAA | Actualizar oferta</title>
        <%
            if (request.getParameter("id") != null) {

                int id = Integer.parseInt(request.getParameter("id"));
                OfertasDTO ofDto = new OfertasDTO();
                OfertasDAO ofDao = new OfertasDAO();
                ofDto = ofDao.consultByOffer(id);
                if (ofDto != null) {

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
                                        <h1>Actualizar oferta</h1><br>
                                        <div name="modOferta" style="width: 500px;">
                                            <form action="../co" method="post" name="modOferta" class="form-horizontal">

                                                <input name="txtIdOferta" id="txtIdOferta" value="<%if (ofDto != null) {
                                                        out.print(ofDto.getIdOfertas());
                                                    }%>" type="hidden">
                                                <div class="form-group">
                                                    <label for=txtNombreProducto" class="col-sm-2 control-label">Nombre del producto:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtNombreProducto" id="txtNombreProducto" value="<%if (ofDto != null) {
                                                                out.print(ofDto.getIdAso().getProducto().getNombre());
                                                            }%>" type="text" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtCantidad" class="col-sm-2 control-label">Cantidad:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtCantidad" id="txtCantidad" value="<%if (ofDto != null) {
                                                                out.print(ofDto.getCantidad());
                                                            }%>" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for=txtPrecio" class="col-sm-2 control-label">Precio:</label>
                                                    <div class="col-sm-10">
                                                        <input name="txtPrecio" id="txtPrecio" value="<%if (ofDto != null) {
                                                                out.print(ofDto.getPrecio());
                                                            }%>" type="text" readonly="true" class="form-control">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div>
                                                        <input name="modificarOferta" id="modificarOferta" type="hidden">
                                                        <button name="btnModificarOferta" id="btnModificarOferta" value="Actualizar Oferta" 
                                                                type="submit" class="btn btn-default">Actualizar</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
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

        <div class="style">
            <%
                if (request.getParameter("msg") != null) {
                    out.print(request.getParameter("msg"));
                }
                    }
    }
            %>
 
        </div>
    </body>
</html>
