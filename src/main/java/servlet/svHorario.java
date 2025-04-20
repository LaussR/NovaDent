package servlet;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;


@WebServlet(name = "svHorario", urlPatterns = {"/svHorario"})
public class svHorario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Horario>listaHorarios = new ArrayList<Horario>();
        listaHorarios = control.getHorarios();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaHorarios", listaHorarios);
        response.sendRedirect("HorarioVer.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String horarioInicio = request.getParameter("horarioinicio");
        String horarioSalida = request.getParameter("horariosalida");
        
        Horario hor = new Horario();
        hor.setHorario_inicio(horarioInicio);
        hor.setHorario_fin(horarioSalida);
        control.crearHorario(horarioInicio, horarioSalida);
        
        response.sendRedirect("svHorario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
