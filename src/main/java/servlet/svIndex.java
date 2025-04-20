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

@WebServlet(name = "svIndex", urlPatterns = {"/svIndex"})
public class svIndex extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        HttpSession session = request.getSession();
        String usuario = (String) session.getAttribute("usuario");

        LocalDate fechaHoy = LocalDate.now();
        String fecha_hoy = fechaHoy.toString();

        List<Turno> listaTurnos = control.getTurnosHoyOdontologos(fecha_hoy, usuario);
        session.setAttribute("listaTurnos", listaTurnos);

        response.sendRedirect("index.jsp");
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
