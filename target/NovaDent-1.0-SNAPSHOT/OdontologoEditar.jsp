<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Editar Odontologo</h1>
                </div>

                <%                    
                    Odontologo odon = (Odontologo) request.getSession().getAttribute("odontoEditar");
                %>

                <form action="svOdontologoEditar" method="POST" class="p-4 rounded shadow bg-white">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputFirstName">DNI</label>
                            <input class="form-control" id="dni" name="dni" type="number" required value="<%=odon.getDni()%>" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputFirstName">Nombre</label>
                            <input class="form-control" id="nombre" name="nombre" type="text" required value="<%=odon.getNombre()%>" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="inputLastName">Apellidos</label>
                            <input class="form-control" id="apellidos" name="apellidos" type="text" required value="<%=odon.getApellidos()%>" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="inputFirstName">Teléfono</label>
                            <input class="form-control" id="telefono" name="telefono" type="number" required value="<%=odon.getTelefono()%>" />
                        </div>
                        <div class="col-md-6">
                            <label for="inputFirstName">Dirección</label>
                            <input class="form-control" id="direccion" name="direccion" type="text" required value="<%=odon.getDireccion()%>" />
                        </div>
                    </div>

                    <%
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String formato = sdf.format(odon.getFecha_nac());
                    %>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="inputFirstName">Fecha Nacimiento</label>
                            <input class="form-control" id="fecha_nac" name="fecha_nac" type="date" required value="<%= formato%>" />
                        </div>
                        <div class="col-md-6">
                            <label for="inputFirstName">Especialidad</label>
                            <select name="especialidad" id="especialidad" class="form-control" required>
                                <option <%= odon.getEspecialidad().equals("") ? "selected" : ""%>></option>
                                <option <%= odon.getEspecialidad().equals("Muelas") ? "selected" : ""%>>Muelas</option>
                                <option <%= odon.getEspecialidad().equals("Braquets") ? "selected" : ""%>>Braquets</option>
                                <option <%= odon.getEspecialidad().equals("Cirujia") ? "selected" : ""%>>Cirujia</option>
                                <option <%= odon.getEspecialidad().equals("Consulta General") ? "selected" : ""%>>Consulta General</option>
                                <option <%= odon.getEspecialidad().equals("Blanqueamiento") ? "selected" : ""%>>Blanqueamiento</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <%
                                Controladora control = new Controladora();
                                List<Horario> listaHorarios = control.getHorarios();
                            %>
                            <label for="inputFirstName">Horario</label>
                            <select name="horario" id="horario" class="form-control" required>
                                <option></option>
                                <%
                                    for (Horario hr : listaHorarios) {
                                %>
                                <option value="<%=hr.getId_horario()%>" <%= odon.getUnHorario().getId_horario() == hr.getId_horario() ? "selected" : ""%>>
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
                                <option value="<%=usu.getId_usuario()%>" <%= odon.getUnUsuario().getId_usuario() == usu.getId_usuario() ? "selected" : ""%>>
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
                            <button class="btn btn-success w-100" type="submit">Modificar</button>
                        </div>
                        <div class="col-md-3">
                            <a class="btn btn-danger w-100" href="OdontologoVer.jsp">Cancelar</a>
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