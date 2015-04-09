/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utilidades.MyException;

/**
 *
 * @author Mona
 */
public class ControladorUsuarios extends HttpServlet {

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
            throws ServletException, IOException, MyException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UsuariosDTO user = new UsuariosDTO();
        FacadeUsuarios facadeUser = new FacadeUsuarios();
        String salida = "";
        try {     
            if (request.getParameter("btnModificarUsuario") != null && request.getParameter("modificarUsuario") != null) {
                                
                user.setIdUsuarios(Integer.parseInt(request.getParameter("txtId").trim()));
                user.setTelefono(Integer.parseInt(request.getParameter("txtTelefono").trim()));
                user.setDireccion(request.getParameter("txtDireccion").trim());
                user.setCorreo(request.getParameter("txtCorreo").trim());
                user.setCiudad(request.getParameter("txtCiudad").trim());
                
                salida = facadeUser.modificarUsuario(user);
                
                response.sendRedirect("paginas/usuarios/perfil.jsp?=msgSalida "+salida);
            }else{
                out.println("Su ingreso no es permitido");
            }

        } finally {
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
        try {
            processRequest(request, response);
        } catch (MyException ex) {
            Logger.getLogger(ControladorUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (MyException ex) {
            Logger.getLogger(ControladorUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
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
