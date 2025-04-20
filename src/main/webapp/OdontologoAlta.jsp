<%@page import="logica.Controladora"%>
<%@page import="logica.Horario"%>
<%@page import="java.util.List"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Alta de Odontologos</h1>
                </div>

                <form action="svOdontologo" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputFirstName">DNI</label>
                            <input class="form-control" id="dni" name="dni" type="number" required />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputFirstName">Nombre</label>
                            <input class="form-control" id="nombre" name="nombre" type="text" required />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputLastName">Apellidos</label>
                            <input class="form-control" id="apellidos" name="apellidos" type="text" required />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="inputFirstName">Teléfono</label>
                            <input class="form-control" id="telefono" name="telefono" type="number" required />
                        </div>
                        <div class="col-md-6">
                            <label for="inputFirstName">Dirección</label>
                            <input class="form-control" id="direccion" name="direccion" type="text" required />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="inputFirstName">Fecha Nacimiento</label>
                            <input class="form-control" id="fecha_nac" name="fecha_nac" type="date" required />
                        </div>
                        <div class="col-md-6">
                            <label for="inputFirstName">Especialidad</label>
                            <select name="especialidad" id="especialidad" class="form-control" required>
                                <option></option>
                                <option>Muelas</option>
                                <option>Braquets</option>
                                <option>Cirujia</option>
                                <option>Consulta General</option>
                                <option>Blanqueamiento</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <%                Controladora control = new Controladora();
                                List<Horario> listaHorarios = control.getHorarios();
                            %>
                            <label for="inputFirstName">Horario</label>
                            <select name="horario" id="horario" class="form-control" required>
                                <option></option>
                                <%
                                    for (Horario hr : listaHorarios) {
                                %>
                                <option value="<%=hr.getId_horario()%>">
                                    <%=hr.getHorario_inicio()%> a <%=hr.getHorario_fin()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <%
                                List<Usuario> listaUsuarios = control.getUsuarios();
                            %>
                            <label for="inputFirstName">Usuario</label>
                            <select name="usuario" id="usuario" class="form-control" required>
                                <option></option>
                                <%
                                    for (Usuario usu : listaUsuarios) {
                                %>
                                <option value="<%=usu.getId_usuario()%>">
                                    <%=usu.getNombre_usuario()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-3">
                            <button class="btn btn-success btn w-100" type="submit">Crear</button>
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