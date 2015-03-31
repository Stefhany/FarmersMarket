/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.renderer.DefaultWordRenderer;

/**
 *
 * @author admin
 */
public class MyCaptcha extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _width = getServletConfig().getInitParameter("width");
        String _height = getServletConfig().getInitParameter("height");
        List<Color> colors = new ArrayList<Color>();
        colors.add(Color.black);
        colors.add(Color.gray);
//        Se puede cambiar el tipo de letra y el color de la misma
//        List<Font> fonts = new ArrayList<Font>();
//        fonts.add(new Font("Arial", Font.ITALIC, 40));

        Captcha captcha = new Captcha.Builder(Integer.parseInt(_width),Integer.parseInt(_height))
                .addText(new DefaultWordRenderer())
                //.addText(new DefaultWordRenderer(colors, fonts))
                .addBackground(new GradiatedBackgroundProducer(Color.white, Color.LIGHT_GRAY))
                .gimp()
                .addBorder()
                .addNoise()
                .build();

        // display the image produced
        CaptchaServletUtil.writeImage(response, captcha.getImage());

        // save the captcha value on session
        request.getSession().setAttribute("simpleCaptcha", captcha);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
