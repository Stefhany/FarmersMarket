/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dtos.OfertasDTO;
import facade.FacadeOfertas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mona
 */
public class ControladorOfertas extends HttpServlet {

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
        FacadeOfertas facadeOffer = new FacadeOfertas();
        OfertasDTO ofDto = new OfertasDTO();
        String salida = "";
        try {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("btnModificarOferta") != null && request.getParameter("modificarOferta") != null) {
                
                ofDto.setIdOfertas(Integer.parseInt(request.getParameter("txtIdOferta").trim()));
                ofDto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                
                salida = facadeOffer.actualizarOferta(ofDto);
                response.sendRedirect("paginas/ofertas/listarofertas.jsp?msgSalida= "+salida);       
                
            }else if (request.getParameter("btnModificarMiOferta") != null && request.getParameter("modificarMiOferta") != null) {
                
                ofDto.setIdOfertas(Integer.parseInt(request.getParameter("txtIdOferta").trim()));
                ofDto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                
                salida = facadeOffer.actualizarMiOferta(ofDto);
                response.sendRedirect("paginas/ofertas/misofertas.jsp?msgSalida= "+salida);
                
            }else if (request.getParameter("btnRegistrarOferta") != null && request.getParameter("registrarOferta") != null) {
                
                ofDto.setProductosAsociadosUsuariosId(Integer.parseInt(request.getParameter("txtProductoAsociado").trim()));
                ofDto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                ofDto.setPrecio(Float.parseFloat(request.getParameter("txtPrecio").trim()));
                
                salida = facadeOffer.registrarOferta(ofDto);
                response.sendRedirect("paginas/usuarios/perfil.jsp?msgSalida= " + salida);

            }           
            
            else {
                out.print("Esta ingresando de forma fraudalenta!!");
            }
            
        }finally {
            out.printf(" ");
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
