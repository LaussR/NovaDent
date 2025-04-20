<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Responsable"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Alta de Responsables</h1>
                </div>

                <form action="svResponsable" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">DNI</label>
                            <input class="form-control" id="dni" name="dni" type="number" required/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Nombre</label>
                            <input class="form-control" id="nombre" name="nombre" type="text" required/>
                        </div>
                    </div>    
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputLastName">Apellidos</label>
                            <input class="form-control" id="apellidos" name="apellidos" type="text" required/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="inputFirstName">Telefono</label>
                            <input class="form-control" id="telefono" name="telefono" type="number" required/>
                        </div>
                        <div class="col-md-5">
                            <label for="inputFirstName">Direccion</label>
                            <input class="form-control" id="direccion" name="direccion" type="text" required/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="fecha_naci">Fecha Nacimiento</label>
                            <input class="form-control" id="fecha_nac" name="fecha_nac" type="date" required/>
                        </div>
                        <div class="col-md-5">
                            <label for="inputFirstName">Tipo Responsable</label>
                            <select name="responsable" id="responsable" class="form-control" required>
                                <option></option>
                                <option>Padre</option>
                                <option>Madre</option>
                                <option>Abuel@</option>
                                <option>Herman@</option>
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
