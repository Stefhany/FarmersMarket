<%-- 
    Document   : error
    Created on : 27/01/2015, 02:18:48 PM
    Author     : krito
--%>

<%@page import="dtos.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/mystyle.css" type="css/txt" >
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- font Awesome -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme style -->
        <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <script src="../js/additional-methods.js"></script>
        <title>SIGAA Página error</title>
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
                                        <div id="error">
                                            <h2 class="headline text-info"> 404</h2>
                                            <div class="error-content">
                                                <h3><i class="fa fa-warning text-yellow"></i> Oops! Pagina no encontrada.</h3>
                                                <p>
                                                    No logramos encontrar la pagina que buscas.
                                                    Meanwhile, you may <a href='../../index.html'>return to dashboard</a> or try using the search form.
                                                </p>
                                                <form class='search-form'>
                                                    <div class='input-group'>
                                                        <input type="text" name="search" class='form-control' placeholder="Search"/>
                                                        <div class="input-group-btn">
                                                            <button type="submit" name="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                                        </div>
                                                    </div><!-- /.input-group -->
                                                </form>
                                            </div><!-- /.error-content -->
                                        </div><!-- /.error-page -->
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
