package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet(name = "svResponsable", urlPatterns = {"/svResponsable"})
public class svResponsable extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Responsable>listaResponsables = new ArrayList<Responsable>();
        listaResponsables = control.getResponsables();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaResponsables", listaResponsables);
        response.sendRedirect("ResponsableVer.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String responsable = request.getParameter("responsable");

        Date fecha_nac = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha_nac = formato.parse(request.getParameter("fecha_nac"));
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return; 
        }

        Responsable res = new Responsable();
        res.setDni(dni);
        res.setNombre(nombre);
        res.setApellidos(apellidos);
        res.setTelefono(telefono);
        res.setDireccion(direccion);
        res.setFecha_nac(fecha_nac);
        res.setTipo_responsable(responsable);

        control.crearResp(dni, nombre, apellidos, telefono, direccion, fecha_nac, responsable);

        response.sendRedirect("svResponsable");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
