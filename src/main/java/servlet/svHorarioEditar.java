package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;

@WebServlet(name = "svHorarioEditar", urlPatterns = {"/svHorarioEditar"})
public class svHorarioEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Horario hora = control.traerHorario(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("horaEditar", hora);
        
        response.sendRedirect("HorarioEditar.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String horarioInicio = request.getParameter("horarioinicio");
        String horarioSalida = request.getParameter("horariosalida");
        
        Horario hor = (Horario) request.getSession().getAttribute("horaEditar");
        hor.setHorario_inicio(horarioInicio);
        hor.setHorario_fin(horarioSalida);
        
        control.editarHorario(hor);
        
        response.sendRedirect("svHorario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
