<%@page import="logica.Paciente"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Pacientes</h1>
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
                            <th>EPS</th>
                            <th>Tipo de Sangre</th>
                            <th>Responsable</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                            
                        List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <tbody>
                        <%  if (listaPacientes != null && !listaPacientes.isEmpty()) {
                                for (Paciente pac : listaPacientes) {%>
                        <tr>
                            <td><%=pac.getId()%></td>
                            <td><%=pac.getDni()%></td>
                            <td><%=pac.getNombre()%></td>
                            <td><%=pac.getApellidos()%></td>
                            <td><%=pac.getTelefono()%></td>
                            <td><%=pac.getDireccion()%></td>
                            <td><%= formato.format(pac.getFecha_nac())%></td>
                            <td><%=pac.isEps()%></td>
                            <td><%=pac.getTipo_sangre()%></td>
                            <td><%=pac.getUnResponsable().getNombre()%> <%=pac.getUnResponsable().getApellidos()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svPacienteEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId()%>">
                                    </form>
                                    <form name="eliminar" action="svPacienteEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId()%>">
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