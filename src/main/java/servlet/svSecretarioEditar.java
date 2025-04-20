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
import logica.Secretario;
import logica.Usuario;

@WebServlet(name = "svSecretarioEditar", urlPatterns = {"/svSecretarioEditar"})
public class svSecretarioEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Secretario sec = control.traerSecre(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("secreEditar", sec);
        
        response.sendRedirect("SecretarioEditar.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String sector = request.getParameter("sector");

        Date fecha_nac = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha_nac = formato.parse(request.getParameter("fecha_nac"));
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return; 
        }
        
        int id_Usuario = Integer.parseInt(request.getParameter("usuario"));
        Usuario usu = control.traerUsu(id_Usuario);
        
        Secretario sec = (Secretario) request.getSession().getAttribute("secreEditar");
        sec.setDni(dni);
        sec.setNombre(nombre);
        sec.setApellidos(apellidos);
        sec.setTelefono(telefono);
        sec.setDireccion(direccion);
        sec.setFecha_nac(fecha_nac);
        sec.setSector(sector);
        sec.setUnUsuario(usu);
        control.editarSecre(sec);
        
        response.sendRedirect("svSecretario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
