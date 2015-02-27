/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import daos.MyException;
import daos.OfertasDAO;
import daos.PedidosDAO;
import daos.ProductoDAO;
import daos.UsuariosDAO;
import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.UsuariosDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws IOException, MyException {
        //throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        PrintWriter out = response.getWriter();
        String salida = " ";
        try {
            if (request.getParameter("btnRegistrar") != null && request.getParameter("registrar") != null) {
                ProductoDTO pdto = new ProductoDTO();
                ProductoDAO pdao = new ProductoDAO();
                CategoriaDTO cdto = new CategoriaDTO();
                pdto.setNombre(request.getParameter("txtNombre").trim());
                pdto.setUnidad(request.getParameter("txtUnidad").trim());
                cdto.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria").trim()));
                pdto.setCategoriaId(cdto);
                salida = pdao.insertarProducto(pdto);
                response.sendRedirect("index.jsp?msg= " + salida);
                
            } else if (request.getParameter("btnRegistrarOferta") != null && request.getParameter("registrarOferta") != null) {
                OfertasDTO ofdto = new OfertasDTO();
                OfertasDAO ofdao = new OfertasDAO();
                ofdto.setProductosAsociadosUsuariosId(Integer.parseInt(request.getParameter("txtProductoAsociado").trim()));
                //ofdto.setNombre(request.getParameter("txtProducto").trim());
                ofdto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad").trim()));
                ofdto.setPrecio(Float.parseFloat(request.getParameter("txtPrecio").trim()));
                //ofdto.setProductosAsociadosUsuariosId(Integer.parseInt(request.getParameter("txtId").trim()));
                salida = ofdao.insertarOferta(ofdto);
                response.sendRedirect("index.jsp?msg= " + salida);

            } else if (request.getParameter("btnActualizarProducto") != null && request.getParameter("actualizarProducto") != null) {
                ProductoDTO prdto = new ProductoDTO();
                prdto.setNombre(request.getParameter("txtNombre").trim());
                prdto.setUnidad(request.getParameter("txtUnidad").trim());
                prdto.setCategoriaId2(Integer.parseInt(request.getParameter("txtCategoria").trim()));
                ProductoDAO prdao = new ProductoDAO();
                salida = prdao.modificarProducto(prdto);
                //out.print(salida);
                response.sendRedirect("index.jsp?msg=" + salida);
            } else if (request.getParameter("btnIngresarSistema") != null && request.getParameter("ingresarSistema") != null) {
                UsuariosDAO udao = new UsuariosDAO();
                UsuariosDTO udto = new UsuariosDTO();
                udto = udao.validarUsuario(request.getParameter("txtCorreo"), request.getParameter("txtClave"));
                if (udto.getIdUsuarios() != 0) {
                    HttpSession miSesion = request.getSession(true);
                    miSesion.setAttribute("usuarioLogueado", udto);
                    response.sendRedirect("indexproductor.jsp");
                } else {
                    response.sendRedirect("paginas/login.jsp?msg=Usuario No existe!!");
                }
            } else if (request.getParameter("btnRegistrarUsuario") != null && request.getParameter("rUsuario") != null) {

                UsuariosDTO udto = new UsuariosDTO();
                udto.setNombres(request.getParameter("txtnombre").trim());
                udto.setApellidos(request.getParameter("txtpellido").trim());
                udto.setCedula(Integer.parseInt(request.getParameter("txtcedula").trim()));
                udto.setTelefono(Integer.parseInt(request.getParameter("txttelefono").trim()));
                udto.setDireccion(request.getParameter("txtdireccion").trim());
                udto.setCorreo(request.getParameter("txtcorreo").trim());
                udto.setClave(request.getParameter("txtclave").trim());
                udto.setNotificacion(Boolean.parseBoolean(request.getParameter("txtnotificacion")));
                udto.setCiudad(request.getParameter("txtciudad").trim());
                udto.setFechaNacimiento(sdf.format(Date.valueOf(request.getParameter("txtfechanacimiento"))).toString());
//    p       m     out.println(udto.getNombres());
//    r       e     out.println(udto.getApellidos());
//    o   e   t      out.println(udto.getCedula());
//    b   l   o      out.println(udto.getTelefono());
//    a       d     out.println(udto.getDireccion());
//    n       o     out.println(udto.getCorreo());
//    d            out.println(udto.getClave());
//    o            out.println(udto.isNotificacion());
//                out.println(udto.getCiudad());
//                out.println(udto.getFechaNacimiento());
                UsuariosDAO dao = new UsuariosDAO();
                salida = dao.ingresarRegistro(udto);
                response.sendRedirect("index.jsp?msg=" + salida);

            } else if (request.getParameter("btnModificarUsuario") != null && request.getParameter("modificarUsuario") != null) {
                UsuariosDTO userdto = new UsuariosDTO();
                userdto.setNombres(request.getParameter("txtNombres").trim());
                userdto.setApellidos(request.getParameter("txtApellidos").trim());
                userdto.setCedula(Integer.parseInt(request.getParameter("txtCedula").trim()));
                userdto.setTelefono(Integer.parseInt(request.getParameter("txtTelefono").trim()));
                userdto.setDireccion(request.getParameter("txtDireccion").trim());
                userdto.setCorreo(request.getParameter("txtCorreo").trim());
                userdto.setClave(request.getParameter("txtClave").trim());
                userdto.setCiudad(request.getParameter("txtCiudad").trim());
                userdto.setFechaNacimiento(request.getParameter("txtFechaNacimiento").trim());
                UsuariosDAO userdao = new UsuariosDAO();
                String sal = userdao.modificarUsuario(userdto);
                response.sendRedirect("index.jsp?msg= "+sal);
            
            } else if (request.getParameter("idUsuario") != null) {
                UsuariosDAO userdao = new UsuariosDAO();
                String sal = ""; 
                sal = userdao.eliminarUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                response.sendRedirect("paginas/tablagestionarrol.jsp?msg= "+sal);

            }  else if (request.getParameter("idProducto") != null) {
                ProductoDAO pro = new ProductoDAO();
                String sal = ""; 
                sal = pro.eliminarProducto(Integer.parseInt(request.getParameter("idProducto")));
                response.sendRedirect("paginas/listarproductos.jsp?msg= "+sal);
                
            } else if (request.getParameter("idOfertas") != null) {
                OfertasDAO ofdao = new OfertasDAO();
                String msj = " ";
                msj = ofdao.eliminarOferta(Integer.parseInt(request.getParameter("idOfertas")));
                response.sendRedirect("paginas/listarofertas.jsp?msg= "+msj);
                
            } else {
                out.println("Esta ingresando de forma fraudalenta");
            }
        } finally {
            out.print("");
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
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
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
