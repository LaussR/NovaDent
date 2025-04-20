<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Secretario"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Editar Secretario</h1>
                </div>

                <%                    
                    Secretario sec = (Secretario) request.getSession().getAttribute("secreEditar");
                %>

                <form action="svSecretarioEditar" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">DNI</label>
                            <input class="form-control" id="dni" name="dni" type="number" required value="<%=sec.getDni()%>"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Nombre</label>
                            <input class="form-control" id="nombre" name="nombre" type="text" required value="<%=sec.getNombre()%>"/>
                        </div>
                    </div>    
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputLastName">Apellidos</label>
                            <input class="form-control" id="apellidos" name="apellidos" type="text" required value="<%=sec.getApellidos()%>"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="inputFirstName">Telefono</label>
                            <input class="form-control" id="telefono" name="telefono" type="number" required value="<%=sec.getTelefono()%>"/>
                        </div>
                        <div class="col-md-5">
                            <label for="inputFirstName">Direccion</label>
                            <input class="form-control" id="direccion" name="direccion" type="text" required value="<%=sec.getDireccion()%>"/>
                        </div>
                    </div>
                    <%
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String formato = sdf.format(sec.getFecha_nac());
                    %>          
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="fecha_naci">Fecha Nacimiento</label>
                            <input class="form-control" id="fecha_nac" name="fecha_nac" type="date" required value="<%= formato%>"/>
                        </div>
                        <div class="col-md-5">
                            <label for="inputFirstName">Sector</label>
                            <select name="sector" id="sector" class="form-control" required>
                                <option <%= sec.getSector().equals("") ? "selected" : ""%>></option>
                                <option <%= sec.getSector().equals("Salida") ? "selected" : ""%>>Salida</option>
                                <option <%= sec.getSector().equals("Recepcion") ? "selected" : ""%>>Recepcion</option>
                                <option <%= sec.getSector().equals("Consultorio") ? "selected" : ""%>>Consultorio</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-5">
                            <%
                                Controladora control = new Controladora();
                                List<Usuario> listaUsuarios = control.getUsuarios();
                            %>
                            <label for="inputLastName">Usuario</label>
                            <select name="usuario" id="usuario" class="form-control" required>
                                <option></option>
                                <%
                                    for (Usuario usu : listaUsuarios) {
                                %>
                                <option value="<%=usu.getId_usuario()%>" <%= sec.getUnUsuario().getId_usuario() == usu.getId_usuario() ? "selected" : ""%>>
                                    <%=usu.getNombre_usuario()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <div class="mt-4 mb-0">
                                <div class="d-grid">
                                    <button class="btn btn-success btn-block" type="submit">Modificar</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mt-4 mb-0">
                                <div class="d-grid">
                                    <a class="btn btn-danger btn-block" href="SecretarioVer.jsp">Cancelar</a>
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
