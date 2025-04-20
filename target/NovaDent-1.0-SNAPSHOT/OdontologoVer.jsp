<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Odontologos</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
                            <th>Fecha Nacimiento</th>
                            <th>Especialidad</th>
                            <th>Horario</th>
                            <th>Usuario</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                        List<Odontologo> listaOdontologos = (List) request.getSession().getAttribute("listaOdontologos");
                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <tbody>
                        <%  if (listaOdontologos != null && !listaOdontologos.isEmpty()) {
                                for (Odontologo odon : listaOdontologos) {%>
                        <tr>
                            <td><%=odon.getId()%></td>
                            <td><%=odon.getDni()%></td>
                            <td><%=odon.getNombre()%></td>
                            <td><%=odon.getApellidos()%></td>
                            <td><%=odon.getTelefono()%></td>
                            <td><%=odon.getDireccion()%></td>
                            <td><%= formato.format(odon.getFecha_nac())%></td>
                            <td><%=odon.getEspecialidad()%></td>
                            <td><%=odon.getUnHorario().getHorario_inicio()%> - <%=odon.getUnHorario().getHorario_fin()%></td>
                            <td><%=odon.getUnUsuario().getNombre_usuario()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svOdontologoEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=odon.getId()%>">
                                    </form>
                                    <form name="eliminar" action="svOdontologoEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=odon.getId()%>">
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