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
import logica.Secretario;
import logica.Usuario;

@WebServlet(name = "svSecretario", urlPatterns = {"/svSecretario"})
public class svSecretario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Secretario>listaSecretarios = new ArrayList<Secretario>();
        listaSecretarios = control.getSecretarios();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaSecretarios", listaSecretarios);
        response.sendRedirect("SecretarioVer.jsp");
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

        control.crearSecre(dni, nombre, apellidos, telefono, direccion, fecha_nac, sector, usu);

        response.sendRedirect("svSecretario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
