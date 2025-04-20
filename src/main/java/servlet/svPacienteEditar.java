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
import logica.Paciente;
import logica.Responsable;

@WebServlet(name = "svPacienteEditar", urlPatterns = {"/svPacienteEditar"})
public class svPacienteEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Paciente pac = control.traerPaci(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("paciEditar", pac);
        
        response.sendRedirect("PacienteEditar.jsp");
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
        
        Paciente pac = (Paciente) request.getSession().getAttribute("paciEditar");
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellidos(apellidos);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFecha_nac(fecha_nac);
        pac.setEps(eps);
        pac.setTipo_sangre(sangre);
        pac.setUnResponsable(res);
        control.editarPaci(pac);
        
        response.sendRedirect("svPaciente");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
