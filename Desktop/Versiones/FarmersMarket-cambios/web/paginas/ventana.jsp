<%-- 
    Document   : ventana
    Created on : 03-mar-2015, 1:53:07
    Author     : Mona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
 <head>
   <meta charset="utf-8">
   <title>Ventana Modal</title>
   <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> 
   <script src="../js/jquery-1.11.2.min.js"></script>
   <script src="../js/bootstrap.js"></script>

 </head>
 <body>
   
   <div class="container" style="margin-top:60px;">
     <button class="btn btn-danger" data-toggle="modal" data-target="#miventana">
     	Enviar¡¡¡
     </button>
     
     <div class="modal fade" id="miventana" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     	<div class="modal-dialog">
           <div class="modal-content">
              
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
                 <center><h4>Amiga con todo mi Corazón</h4></center>
              </div>

              <div class="modal-body" style="background: url(img/AngelicaAlvarez.jpg) no-repeat; height: 340px;">
                <h4>Amiga con todo mi Corazón</h4>
                
              </div>	 

             <div class="modal-footer">
              	<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
              </div>
        </div>
     	</div>
     </div>
  </div>   
 </body>
</html>
