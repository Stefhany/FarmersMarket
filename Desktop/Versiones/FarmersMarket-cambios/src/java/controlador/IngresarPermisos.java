/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import daos.UsuariosDAO;
import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mona
 */
public class IngresarPermisos extends HttpServlet {

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
        
        FacadeUsuarios menu = new FacadeUsuarios();
        
        if (request.getParameter("btnIngresar") != null && request.getParameter("btnIngresar").equals("Ingresar")) {
            
                String usr = request.getParameter("txtCorreo");
                String psw = request.getParameter("txtClave");
                UsuariosDTO datosUsuario = new UsuariosDTO();
                            
                String menuAPintar = "";
                HashMap<UsuariosDTO, String> hs = new HashMap<UsuariosDTO, String>();
                String url = request.getContextPath();
                hs = menu.validarUsuarioV2(usr, psw);
                for (Map.Entry<UsuariosDTO, String> registro : hs.entrySet()) {
                    datosUsuario = registro.getKey();
                    menuAPintar = registro.getValue();
                }
                // out.print("documento " + datosUsuario.getDocumento());
                if (datosUsuario.getCedula() != 0) {
                    HttpSession miSesion = request.getSession(true);
                    miSesion.setAttribute("usr", datosUsuario);
                    miSesion.setAttribute("mp", menuAPintar);
                    response.sendRedirect("paginas/usuarios/perfil.jsp");

                } else {
                    response.sendRedirect("index.jsp?msg=no existe");
                }
            } else {        
                response.sendRedirect("index.jsp?msg=no puede ingresar");
            }
//        
//            if (request.getParameter("btnIngresar") != null && request.getParameter("btnIngresar").equals("Ingresar")) {
//         
//                String usr = request.getParameter("txtCorreo");
//                String psw = request.getParameter("txtClave");
//                UsuariosDTO datosUsuario = new UsuariosDTO();
//                            
//                UsuariosDAO menu = new UsuariosDAO();
//                String menuAPintar = "";
//                
//                HashMap<UsuariosDTO, String> hs = new HashMap<UsuariosDTO, String>();
//                String url = request.getContextPath();
//                //hs = menu.validarUsuario(usr, psw);
//                for (Map.Entry<UsuariosDTO, String> registro : hs.entrySet()) {
//                    datosUsuario = registro.getKey();
//                    menuAPintar = registro.getValue();
//                }
//                // out.print("documento " + datosUsuario.getDocumento());
//                if (datosUsuario.getCedula() != 0) {
//                    HttpSession miSesion = request.getSession(true);
//                    miSesion.setAttribute("usr", datosUsuario);
//                    miSesion.setAttribute("mp", menuAPintar);
//                    response.sendRedirect("paginas/usuarios/perfil.jsp");
//
//                } else {
//                    response.sendRedirect("index.jsp?msg=no existe");
//                }
//            } else {        
//                response.sendRedirect("index.jsp?msg=no puede ingresar");
//            }
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
