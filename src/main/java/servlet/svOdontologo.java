package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Odontologo;
import logica.Horario;
import logica.Usuario;

@WebServlet(name = "svOdontologo", urlPatterns = {"/svOdontologo"})
public class svOdontologo extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Odontologo>listaOdontologos = new ArrayList<Odontologo>();
        listaOdontologos = control.getOdontos();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaOdontologos", listaOdontologos);
        response.sendRedirect("OdontologoVer.jsp");
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

        control.crearOdonto(dni, nombre, apellidos, telefono, direccion, fecha_nac, especialidad, hor, usu);

        response.sendRedirect("svOdontologo");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
