package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;

@WebServlet(name = "svTurnoEditar", urlPatterns = {"/svTurnoEditar"})
public class svTurnoEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Turno turn = control.traerTurn(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("turnoEditar", turn);
        
        response.sendRedirect("TurnoEditar.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tratamiento = request.getParameter("tratamiento");
        String hora_turno = request.getParameter("hora_turno");

        Date fecha_turno = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha_turno = formato.parse(request.getParameter("fecha_turno"));
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        int id_Odontologo = Integer.parseInt(request.getParameter("odontologo"));
        Odontologo odon = control.traerOdonto(id_Odontologo);

        int id_Paciente = Integer.parseInt(request.getParameter("paciente"));
        Paciente pac = control.traerPaci(id_Paciente);
        
        Turno turn = (Turno) request.getSession().getAttribute("turnoEditar");
        turn.setFecha(fecha_turno);
        turn.setHora(hora_turno);
        turn.setTratamiento(tratamiento);
        turn.setOdonto(odon);
        turn.setPacien(pac);
        control.editarTurn(turn);
        
        response.sendRedirect("svTurno");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
