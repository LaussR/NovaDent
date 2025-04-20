package servlet;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

@WebServlet(name = "svTurno", urlPatterns = {"/svTurno"})
public class svTurno extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Turno> listaTurnos = new ArrayList<Turno>();
        listaTurnos = control.getTurnos();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaTurnos", listaTurnos);
        response.sendRedirect("TurnoVer.jsp");
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

        control.crearTurn(fecha_turno, hora_turno, tratamiento, odon, pac);

        response.sendRedirect("svTurno");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
