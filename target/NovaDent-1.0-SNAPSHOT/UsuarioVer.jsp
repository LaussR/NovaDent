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
                    <h1 class="h3 mb-0 text-gray-800">Ver Usuarios</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre Usuario</th>
                            <th>Rol</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                        
                        List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                    %>
                    <tbody>
                        <%  if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                                for (Usuario usu : listaUsuarios) {%>
                        <tr>
                            <td><%=usu.getId_usuario()%></td>
                            <td><%=usu.getNombre_usuario()%></td>
                            <td><%=usu.getRol()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svUsuarioEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=usu.getId_usuario()%>">
                                    </form>
                                    <form name="eliminar" action="svUsuarioEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=usu.getId_usuario()%>">
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