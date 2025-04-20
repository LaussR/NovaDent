<%@page import="logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="logica.Paciente"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Editar Turno</h1>
                </div>

                <%                    
                    Turno turn = (Turno) request.getSession().getAttribute("turnoEditar");

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String formato = sdf.format(turn.getFecha());
                %>

                <form action="svTurnoEditar" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="inputFirstName">Fecha Turno</label>
                            <input class="form-control" id="fecha_turno" name="fecha_turno" type="date" required value="<%= formato%>"/>
                        </div>
                        <div class="col-md-4">
                            <label for="inputFirstName">Hora Turno</label>
                            <input class="form-control" id="hora_turno" name="hora_turno" type="time" required value="<%=turn.getHora()%>"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Tratamiento</label>
                            <input class="form-control" id="tratamiento" name="tratamiento" type="text" required value="<%=turn.getTratamiento()%>"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <%
                                Controladora control = new Controladora();
                                List<Odontologo> listaOdontologos = control.getOdontos();
                            %>
                            <label for="inputLastName">Odontologo</label>
                            <select name="odontologo" id="odontologo" class="form-control" required>
                                <option></option>
                                <%
                                    for (Odontologo odon : listaOdontologos) {
                                %>
                                <option value="<%=odon.getId()%>" <%= turn.getOdonto().getId() == odon.getId() ? "selected" : ""%>>
                                    <%=odon.getNombre()%> <%=odon.getApellidos()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <%
                                List<Paciente> listaPacientes = control.getPacientes();
                            %>
                            <label for="inputLastName">Paciente</label>
                            <select name="paciente" id="paciente" class="form-control" required>
                                <option></option>
                                <%
                                    for (Paciente pac : listaPacientes) {
                                %>
                                <option value="<%=pac.getId()%>" <%= turn.getPacien().getId() == pac.getId() ? "selected" : ""%>>
                                    <%=pac.getNombre()%> <%=pac.getApellidos()%></option>
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
                                    <a class="btn btn-danger btn-block" href="TurnoVer.jsp">Cancelar</a>
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

