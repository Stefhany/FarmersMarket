/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import daos.AportesProductoresDAO;
import daos.DespachosPedidosDAO;
import daos.PedidoSobreOfertaDAO;
import daos.SolicitudDistribuidorDAO;
import dtos.AportesProductoresDTO;
import dtos.DespachosPedidosDTO;
import dtos.SolicitudDistribuidorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
        try {
            if (request.getParameter("btnSolicitarAsociacion") != null && request.getParameter("solicitarAsociacion") != null) {
                //out.print("si llega ");
                SolicitudDistribuidorDTO solicitud = new SolicitudDistribuidorDTO();
                solicitud.setCantidadSolicitada(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                solicitud.setFechaSolicitud(request.getParameter("txtFechaSolicitud").trim());
                solicitud.setProductoId(Integer.parseInt(request.getParameter("subcategoria").trim()));
                solicitud.setDistribuidorId(Integer.parseInt(request.getParameter("txtId").trim()));
                SolicitudDistribuidorDAO soldao = new SolicitudDistribuidorDAO();
                String salida = soldao.insertarSolicitudDistribuidor(solicitud);
                response.sendRedirect("index.jsp?msg= " + salida);

            } else if (request.getParameter("idSolicitud") != null) {
                SolicitudDistribuidorDAO soldao = new SolicitudDistribuidorDAO();
                String msj = "";
                msj = soldao.eliminarSolicitud(Integer.parseInt(request.getParameter("idSolicitud")));
                response.sendRedirect("paginas/listarsolicitudesasociaciones.jsp?msg= " + msj);
                
            } else if (request.getParameter("btnSolicitar") != null && request.getParameter("solicitar").equals("solicitar")) {

                PedidoSobreOfertaDAO pedOffer = new PedidoSobreOfertaDAO();
                String salida = pedOffer.insertarPedidoSobreOferta(Integer.parseInt(request.getParameter("txtCantidadSolicitada").trim()),
                        Integer.parseInt(request.getParameter("txtIdOferta").trim()), request.getParameter("txtFechaSolicitud").trim());
                response.sendRedirect("index.jsp?msg= " + salida);

            } else if (request.getParameter("btnGenerarPedido") != null && request.getParameter("generarPedido") != null) {
                SolicitudDistribuidorDTO solDto = new SolicitudDistribuidorDTO();
                solDto.setIdSolicitud(Integer.parseInt(request.getParameter("txtIdSolicitud")));
                solDto.setFechaEntregaInterna(request.getParameter("txtFechaEntrega").trim());
                SolicitudDistribuidorDAO solDao = new SolicitudDistribuidorDAO();
                String salida = solDao.modificarSolicitudDistribuidor(solDto);
                response.sendRedirect("index.jsp?msg= "+salida);
                
            }else if(request.getParameter("btnAplicarSolicitud") != null && request.getParameter("aplicarSolicitud") != null){
                AportesProductoresDAO aporDao = new AportesProductoresDAO();
                String salida = aporDao.aplicarSolicitudAsociacion(request.getParameter("txtFechaEntrega").trim(), 
                        Integer.parseInt(request.getParameter("txtCantidadAportar").trim()),
                        Integer.parseInt(request.getParameter("txtIdAso").trim()), 
                        Integer.parseInt(request.getParameter("txtIdSolicitud").trim()));
                response.sendRedirect("paginas/listarsolicitudesproductores.jsp?msg= " + salida);
            }else if(request.getParameter("btnDespacharPedido") != null && request.getParameter("despacharPedido") != null){
                DespachosPedidosDTO dto = new DespachosPedidosDTO();
                dto.setDireccionDespacho(request.getParameter("txtDireccion").trim());
                dto.setFechaDespacho(request.getParameter("txtFechaEnvio").trim());
                dto.setObservaciones(request.getParameter("txtObservacion").trim());
                dto.setSolicitudId(Integer.parseInt(request.getParameter("txtSolicitud").trim()));
                dto.setUsuariosId(Integer.parseInt(request.getParameter("txtUser").trim()));
                DespachosPedidosDAO despacho = new DespachosPedidosDAO();
                String salida = despacho.insertarDespacho(dto);
                response.sendRedirect("paginas/listardespachos.jsp?msg = El despacho ha sido registrado. ");
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
