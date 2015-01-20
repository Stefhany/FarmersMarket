/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import daos.OfertasDAO;
import daos.ProductoDAO;
import daos.UsuariosDAO;
import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.UsuariosDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author krito
 */
public class Controlador extends HttpServlet {

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
        String salida = "jnjnjln";
        try {
            if (request.getParameter("btnRegistrar") != null && request.getParameter("registrar") != null) {
                ProductoDTO pdto = new ProductoDTO();
                ProductoDAO pdao = new ProductoDAO();
                CategoriaDTO cdto = new CategoriaDTO();
                pdto.setNombre(request.getParameter("txtNombre").trim());
                pdto.setUnidad(request.getParameter("txtUnidad").trim());
                cdto.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria").trim()));
                //pdto.setCategoriaId(request.getParameter("txtCategoria").trim());
                pdto.setCategoriaId(cdto);
                salida = pdao.insertarProducto(pdto);
                response.sendRedirect("index.jsp?msg= " + salida);
            }else if (request.getParameter("btnRegistrarOferta") != null && request.getParameter("registrarOferta") != null) {
                OfertasDTO ofdto = new OfertasDTO();
                OfertasDAO ofdao = new OfertasDAO();
                ofdto.setNombre(request.getParameter("txtProducto").trim());
                ofdto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                ofdto.setPrecio(Float.parseFloat(request.getParameter("txtPrecio").trim()));
                ofdto.setProductosAsociadosUsuariosId(Integer.parseInt(request.getParameter("txtId").trim()));
                salida = ofdao.insertarOferta(ofdto);
                response.sendRedirect("index.jsp?msg= " + salida);
            
            } else if (request.getParameter("btnActualizarProducto") != null && request.getParameter("actualizarProducto") != null) {
                ProductoDTO prdto = new ProductoDTO();
                prdto.setNombre(request.getParameter("txtNombre").trim());
                prdto.setUnidad(request.getParameter("txtUnidad").trim());
                //prdto.setCategoriasId(Integer.parseInt(request.getParameter("txtCategoria").trim()));

                ProductoDAO prdao = new ProductoDAO();
                salida = prdao.modificarProducto(prdto);
                out.print(salida);
                //response.sendRedirect("index.jsp?msj=" + salida);
            } else if (request.getParameter("btnIngresar") != null && request.getParameter("iUsuario") != null) {
                UsuariosDAO udao = new UsuariosDAO();
                UsuariosDTO udto = new UsuariosDTO();
                udto = udao.validarUsuario(request.getParameter("txtcorreo"), request.getParameter("txtclave"));
                if (udto.getIdUsuarios() != 0) {
                    HttpSession miSesion = request.getSession(true);
                    miSesion.setAttribute("usuarioLogueado", udto);
                    response.sendRedirect("listarofertas.jsp");
                } else {
                    response.sendRedirect("login.jsp?msg=Usuario No existe!!");
                }
            }
            
            else {
                System.out.println("Esta ingresando de forma fraudalenta");
            }
        } finally {

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
