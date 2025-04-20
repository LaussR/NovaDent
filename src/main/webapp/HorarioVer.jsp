<%@page import="logica.Horario"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Horarios</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hora Inicio</th>
                            <th>Hora Salida</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                        
                        List<Horario> listaHorarios = (List) request.getSession().getAttribute("listaHorarios");
                    %>
                    <tbody>
                        <% if (listaHorarios != null && !listaHorarios.isEmpty()) {
                            for (Horario hor : listaHorarios) {%>
                        <tr>
                            <td><%=hor.getId_horario()%></td>
                            <td><%=hor.getHorario_inicio()%></td>
                            <td><%=hor.getHorario_fin()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svHorarioEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=hor.getId_horario()%>">
                                    </form>
                                    <form name="eliminar" action="svHorarioEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=hor.getId_horario()%>">
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%  }
                            } else {
                                out.println("<tr><td colspan='4'>No hay datos para mostrar.</td></tr>");
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
