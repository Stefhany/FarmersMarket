/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import daos.ProductoDAO;
import daos.ProductosAsociadosUsuariosDAO;
import dtos.CategoriaDTO;
import dtos.ProductoDTO;
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
public class ControladorProductos extends HttpServlet {

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
        try  {
            if (request.getParameter("btnRegistrarProAso")!=null && request.getParameter("registrarProAso") != null)  {
                ProductosAsociadosUsuariosDAO nuevoProAso = new ProductosAsociadosUsuariosDAO();
                String salida = nuevoProAso.insertarProductoAsociado(request.getParameter("txtNombre").trim(), 
                        Integer.parseInt(request.getParameter("txtCategoria").trim()), 
                        Integer.parseInt(request.getParameter("txtIdUsu").trim()));
                response.sendRedirect("paginas/misproductos.jsp?msg= "+salida);
                
            }else if (request.getParameter("btnRegistrar") != null && request.getParameter("registrar") != null) {
                ProductoDTO pdto = new ProductoDTO();
                ProductoDAO pdao = new ProductoDAO();
                CategoriaDTO cdto = new CategoriaDTO();
                pdto.setNombre(request.getParameter("txtNombre").trim());
                pdto.setUnidad(request.getParameter("txtUnidad").trim());
                cdto.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria").trim()));
                pdto.setCategoriaId(cdto);
                String salida = pdao.insertarProducto(pdto);
                response.sendRedirect("paginas/productos/perfil.jsp?msg= " + salida);                
            }else {
                out.print("Esta ingresando de forma fraudalenta. ");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProductos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProductos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }finally  {
            out.close();
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
