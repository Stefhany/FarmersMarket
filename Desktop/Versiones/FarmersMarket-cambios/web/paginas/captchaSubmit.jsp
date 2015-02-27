<%--
    Document   : captchaSubmit
    Created on : 12-ene-2015, 22:01:18
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="nl.captcha.Captcha" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>




    <% // We're doing this in a JSP here, but in your own app you'll want to put
    // this logic in your MVC framework of choice.
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);

    // Or, for an AudioCaptcha:
    // AudioCaptcha captcha = (AudioCaptcha) session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
    String answer = (request.getParameter("answer")).toLowerCase();
    if (captcha.isCorrect(answer)) { %>
        <b><%
        request.getServletContext().getRequestDispatcher("../Controlador").forward(request, response);

        //response.sendRedirect("control");
        %></b>
    <% } else{

        request.getServletContext().getRequestDispatcher("../index.jsp").forward(request, response);
        //response.sendRedirect("index.jsp");
    }%>



    </body>
</html>
