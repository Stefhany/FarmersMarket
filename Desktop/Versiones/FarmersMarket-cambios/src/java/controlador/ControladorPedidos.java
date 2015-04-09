/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dtos.DespachosPedidosDTO;
import dtos.SolicitudDistribuidorDTO;
import facade.FacadeAportesProductores;
import facade.FacadeDespachosPedidos;
import facade.FacadePedidoSobreOferta;
import facade.FacadeSolicitudDistribuidor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mona
 */
public class ControladorPedidos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String salida = "";
        FacadeSolicitudDistribuidor facadeRequestDistributor = new FacadeSolicitudDistribuidor();
        SolicitudDistribuidorDTO solicitud = new SolicitudDistribuidorDTO();
        try {
            if (request.getParameter("btnSolicitarAsociacion") != null && request.getParameter("solicitarAsociacion") != null) {
                
                solicitud.setCantidadSolicitada(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                solicitud.setFechaSolicitud(request.getParameter("txtFechaSolicitud").trim());
                solicitud.setProductoId(Integer.parseInt(request.getParameter("subcategoria").trim()));
                solicitud.setDistribuidorId(Integer.parseInt(request.getParameter("txtId").trim()));
                
                salida =  facadeRequestDistributor.insertarSolicitudDistribuidor(solicitud);
                
                response.sendRedirect("paginas/usuarios/perfil.jsp?msgSalida= " + salida);

            } else if (request.getParameter("idSolicitud") != null) {
                
                salida = facadeRequestDistributor.eliminarSolicitud(Integer.parseInt(request.getParameter("idSolicitud")));
                
                response.sendRedirect("paginas/solicitudes/listarsolicitudesasociaciones.jsp?msgSalida= " + salida);
                
            } else if (request.getParameter("btnSolicitar") != null && request.getParameter("solicitar").equals("solicitar")) {
                
                FacadePedidoSobreOferta facadeOrderOffer = new FacadePedidoSobreOferta();
                salida = facadeOrderOffer.registrarPedidoSobreOferta(Integer.parseInt(request.getParameter("txtCantidadSolicitada").trim()),
                        Integer.parseInt(request.getParameter("txtIdOferta").trim()), request.getParameter("txtFechaSolicitud").trim());
                
                response.sendRedirect("paginas/usuarios/perfil.jsp?msgSalida= " + salida);

            } else if (request.getParameter("btnGenerarPedido") != null && request.getParameter("generarPedido") != null) {
                
                solicitud.setIdSolicitud(Integer.parseInt(request.getParameter("txtIdSolicitud")));
                solicitud.setFechaEntregaInterna(request.getParameter("txtFechaEntrega").trim());
                
                salida = facadeRequestDistributor.modificarSolicitudDistribuidor(solicitud);
                response.sendRedirect("paginas/usuarios/perfil.jsp?msgSalida= "+salida);
                
            }else if(request.getParameter("btnAplicarSolicitud") != null && request.getParameter("aplicarSolicitud") != null){
                
                FacadeAportesProductores facadeContributeProducer = new FacadeAportesProductores();
                salida = facadeContributeProducer.participarASolicitudAsociacion(request.getParameter("txtFechaEntrega").trim(), 
                        Integer.parseInt(request.getParameter("txtCantidadAportar").trim()),
                        Integer.parseInt(request.getParameter("txtIdAso").trim()), 
                        Integer.parseInt(request.getParameter("txtIdSolicitud").trim()));
                
                response.sendRedirect("paginas/solicitudes/listarsolicitudesproductores.jsp?msgSalida= " + salida);
                
                
            }else if(request.getParameter("btnDespacharPedido") != null && request.getParameter("despacharPedido") != null){
                
                DespachosPedidosDTO dto = new DespachosPedidosDTO();
                dto.setDireccionDespacho(request.getParameter("txtDireccion").trim());
                dto.setFechaDespacho(request.getParameter("txtFechaEnvio").trim());
                dto.setObservaciones(request.getParameter("txtObservacion").trim());
                dto.setSolicitudId(Integer.parseInt(request.getParameter("txtSolicitud").trim()));
                dto.setUsuariosId(Integer.parseInt(request.getParameter("txtUser").trim()));
                
                FacadeDespachosPedidos facadeDispatchOrder = new FacadeDespachosPedidos();
                salida = facadeDispatchOrder.insertarDespacho(dto);
                response.sendRedirect("paginas/despacho/listardespachos.jsp?msgSalida=  "+salida);
            }
            
            else {
                System.out.println("Esta ingresando de forma fraudalenta");
            }
        } finally {
            out.print(" ");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
