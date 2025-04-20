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
                    <h1 class="h3 mb-0 text-gray-800">Alta de Usuarios</h1>
                </div>

                <form action="svUsuario" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Usuario</label>
                            <input class="form-control" id="usuario" name="usuario" type="text" required/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputLastName">Contraseña</label>
                            <input class="form-control" id="contrasena" name="contrasena" type="password" required/>
                        </div>
                    </div>    
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Rol</label>
                            <select name="rol" id="rol" class="form-control" required>
                                <option></option>
                                <option>Odontologo</option>
                                <option>Secretaria</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <div class="mt-4 mb-0">
                                <div class="d-grid">
                                    <button class="btn btn-success btn-block" type="submit">Crear</button>
                                </div>
                            </div>
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