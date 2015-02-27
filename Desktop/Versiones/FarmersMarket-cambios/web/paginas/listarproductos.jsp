<%-- 
    Document   : listarproductos
    Created on : 10/12/2014, 10:16:19 PM
    Author     : krito
--%>

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
        
        <title>Farmers Market | Productos</title>
        <!-- bootstrap 3.0.2-->
        <link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css"/> 

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
            ProductoDAO pdao = new ProductoDAO();
            LinkedList<ProductoDTO> productos = new LinkedList();
            productos = (LinkedList<ProductoDTO>) pdao.listarAllProductos();
            CategoriaDAO cdao = new CategoriaDAO();
            ArrayList<CategoriaDTO> categorias = new ArrayList();
            categorias = (ArrayList<CategoriaDTO>) cdao.listarCategorias();
        %>
    </head>
    <body>
        
        <form  method="get" enctype="application/x-www-form-urlencoded">
            <table border="1" id="results">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre producto</th>
                    <th>Unidad</th>
                    <th>Categoria</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
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
                    <td><a href="../Controlador?idProducto=<%=p.getIdProductos()%>" onclick="return confirmar();"><img src="../imagenes/eliminar.png" width="32" height="32" alt="Eliminar producto" title="Eliminar producto"/>
                        </a></td>

                    <td><a href="modificarproducto.jsp?id=<%=p.getIdProductos()%>"><img src="../imagenes/actualizar.png" width="32" height="32" alt="Modificar producto" title="Modificar producto"/>
                        </a></td>     

                </tr>
                <%
                    }%>

            </tbody>
        </table>
                    
        <a href="reporteproductos.jsp"><img src="../imagenes/excel.png" width="32" height="32" title="Descargar en Excel"></a>

        <div id="pageNavPosition"></div>
        
        </form>       
        
       <script type="text/javascript"><!--
        var pager = new Pager('results', 4); 
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
