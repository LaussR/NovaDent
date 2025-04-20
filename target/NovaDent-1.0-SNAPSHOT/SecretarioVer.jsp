<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Secretarios</h1>
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
                            <th>Sector</th>
                            <th>Usuario</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                            
                        List<Secretario> listaSecretarios = (List) request.getSession().getAttribute("listaSecretarios");
                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <tbody>
                        <% if (listaSecretarios != null && !listaSecretarios.isEmpty()) {
                                for (Secretario sec : listaSecretarios) {%>
                        <tr>
                            <td><%=sec.getId()%></td>
                            <td><%=sec.getDni()%></td>
                            <td><%=sec.getNombre()%></td>
                            <td><%=sec.getApellidos()%></td>
                            <td><%=sec.getTelefono()%></td>
                            <td><%=sec.getDireccion()%></td>
                            <td><%= formato.format(sec.getFecha_nac())%></td>
                            <td><%=sec.getSector()%></td>
                            <td><%=sec.getUnUsuario().getNombre_usuario()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svSecretarioEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=sec.getId()%>">
                                    </form>
                                    <form name="eliminar" action="svSecretarioEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=sec.getId()%>">
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
