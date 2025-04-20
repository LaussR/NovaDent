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
import logica.Horario;
import logica.Odontologo;
import logica.Usuario;

@WebServlet(name = "svOdontologoEditar", urlPatterns = {"/svOdontologoEditar"})
public class svOdontologoEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Odontologo odon = control.traerOdonto(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("odontoEditar", odon);
        
        response.sendRedirect("OdontologoEditar.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String especialidad = request.getParameter("especialidad");

        Date fecha_nac = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha_nac = formato.parse(request.getParameter("fecha_nac"));
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return; 
        }
        
        int id_Horario = Integer.parseInt(request.getParameter("horario"));
        Horario hor = control.traerHorario(id_Horario);
        
        int id_Usuario = Integer.parseInt(request.getParameter("usuario"));
        Usuario usu = control.traerUsu(id_Usuario);
        
        Odontologo odon = (Odontologo) request.getSession().getAttribute("odontoEditar");
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellidos(apellidos);
        odon.setTelefono(telefono);
        odon.setDireccion(direccion);
        odon.setFecha_nac(fecha_nac);
        odon.setEspecialidad(especialidad);
        odon.setUnHorario(hor);
        odon.setUnUsuario(usu);
        control.editarOdonto(odon);
        
        response.sendRedirect("svOdontologo");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
