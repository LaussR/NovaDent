<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="layout/header.jsp" %>

    <body id="page-top">

        <%@include file="layout/validarLogin.jsp" %>

        <%@include file="layout/navbar.jsp" %>

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="layout/topbar.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Editar Usuario</h1>
                </div>

                <% Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");%>

                <form action="svUsuarioEditar" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Usuario</label>
                            <input class="form-control" id="usuario" name="usuario" type="text" required value="<%=usu.getNombre_usuario()%>"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputLastName">Contraseña</label>
                            <input class="form-control" id="contrasena" name="contrasena" type="password" required value="<%=usu.getContrasenia()%>"/>
                        </div>
                    </div>    
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Rol</label>
                            <select name="rol" id="rol" class="form-control" required>
                                <option <%= usu.getRol().equals("") ? "selected" : ""%>></option>
                                <option <%= usu.getRol().equals("Odontologo") ? "selected" : ""%>>Odontologo</option>
                                <option <%= usu.getRol().equals("Secretaria") ? "selected" : ""%>>Secretaria</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-3">
                            <button class="btn btn-success w-100" type="submit">Modificar</button>
                        </div>
                        <div class="col-md-3">
                            <a class="btn btn-danger w-100" href="UsuarioVer.jsp">Cancelar</a>
                        </div>
                    </div>
                </form>

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <%@include file="layout/footer.jsp" %>

        <%@include file="layout/scripts.jsp" %>

    </body>

</html>
