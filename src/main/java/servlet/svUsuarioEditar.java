package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "svUsuarioEditar", urlPatterns = {"/svUsuarioEditar"})
public class svUsuarioEditar extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuario usu = control.traerUsu(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("usuEditar", usu);
        
        response.sendRedirect("UsuarioEditar.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsu = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol");
        
        Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");
        usu.setNombre_usuario(nombreUsu);
        usu.setContrasenia(contrasena);
        usu.setRol(rol);
        
        control.editarUsu(usu);
        
        response.sendRedirect("svUsuario");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
