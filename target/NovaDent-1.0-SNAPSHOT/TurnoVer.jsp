<%@page import="logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Turnos</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Fecha Turno</th>
                            <th>Hora Turno</th>
                            <th>Tratamiento</th>
                            <th>Odontologo</th>
                            <th>Paciente</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                            
                        List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos");
                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <tbody>
                        <%  if (listaTurnos != null && !listaTurnos.isEmpty()) {
                                for (Turno turn : listaTurnos) {%>
                        <tr>
                            <td><%=turn.getId_turno()%></td>
                            <td><%= formato.format(turn.getFecha())%></td>
                            <td><%=turn.getHora()%></td>
                            <td><%=turn.getTratamiento()%></td>
                            <td><%=turn.getOdonto().getNombre()%> <%=turn.getOdonto().getApellidos()%></td>
                            <td><%=turn.getPacien().getNombre()%> <%=turn.getPacien().getApellidos()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svTurnoEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=turn.getId_turno()%>">
                                    </form>
                                    <form name="eliminar" action="svTurnoEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=turn.getId_turno()%>">
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%  }
                            } else {
                                out.println("<tr><td colspan='11'>No hay datos para mostrar.</td></tr>");
                            }%>
                    </tbody>
                </table>

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <%@include file="layout/footer.jsp" %>

        <%@include file="layout/scripts.jsp" %>

    </body>

</html>
