package servlet;

import java.io.IOException;
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
import logica.Responsable;
import logica.Paciente;

@WebServlet(name = "svPaciente", urlPatterns = {"/svPaciente"})
public class svPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Paciente>listaPacientes = new ArrayList<Paciente>();
        listaPacientes = control.getPacientes();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaPacientes", listaPacientes);
        response.sendRedirect("PacienteVer.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        Boolean eps = Boolean.parseBoolean(request.getParameter("eps"));
        String sangre = request.getParameter("sangre");

        Date fecha_nac = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha_nac = formato.parse(request.getParameter("fecha_nac"));
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return; 
        }
        
        int id_Responsable = Integer.parseInt(request.getParameter("responsable"));
        Responsable res = control.traerResp(id_Responsable);
        
        control.crearPaci(dni, nombre, apellidos, telefono, direccion, fecha_nac, eps, sangre, res);

        response.sendRedirect("svPaciente");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
