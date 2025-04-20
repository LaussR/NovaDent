package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Turno;

@WebServlet(name = "svLogin", urlPatterns = {"/svLogin"})
public class svLogin extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        boolean validacion = false;
        boolean error = true;
        HttpSession misession = request.getSession(true);
        validacion = control.comprobarAcceso(usuario, contrasena);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasena");

        boolean validacion = false;
        boolean error = true;
        HttpSession misession = request.getSession(true);
        validacion = control.comprobarAcceso(usuario, contrasenia);

        if (validacion) {
            error = false;
            misession.setAttribute("usuario", usuario);

            LocalDate fechaActual = LocalDate.now();
            String fecha_hoy = fechaActual.toString();

            List<Turno> listaTurnosActuales = control.getTurnosHoyOdontologos(fecha_hoy, usuario);
            misession.setAttribute("listaTurnos", listaTurnosActuales);

            response.sendRedirect("index.jsp");
        } else {
            misession.setAttribute("error", error);
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
