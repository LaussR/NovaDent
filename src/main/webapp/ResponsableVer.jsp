<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Responsable"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Ver Responsables</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>DNI</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
                            <th>Fecha Nacimiento</th>
                            <th>Tipo Responsable</th>
                            <th width="10%">Acciones</th>
                        </tr>
                    </thead>
                    <%                                            
                        List<Responsable> listaResponsables = (List) request.getSession().getAttribute("listaResponsables");
                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <tbody>
                        <%  if (listaResponsables != null && !listaResponsables.isEmpty()) {
                                for (Responsable res : listaResponsables) {%>
                        <tr>
                            <%
                                if (res.getNombre().equals("N/A")) {
                                } else {
                            %>
                            <td><%=res.getId()%></td>
                            <td><%=res.getDni()%></td>
                            <td><%=res.getNombre()%></td>
                            <td><%=res.getApellidos()%></td>
                            <td><%=res.getTelefono()%></td>
                            <td><%=res.getDireccion()%></td>
                            <td><%= formato.format(res.getFecha_nac())%></td>
                            <td><%=res.getTipo_responsable()%></td>
                            <td>
                                <div class="d-flex gap-4">
                                    <form name="editar" action="svResponsableEditar" method="GET">
                                        <button class="btn btn-outline-success" title="Editar">
                                            <i class="fas fa-archive"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId()%>">
                                    </form>
                                    <form name="eliminar" action="svResponsableEliminar" method="POST">
                                        <button class="btn btn-outline-danger" title="Eliminar">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId()%>">
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%      }
                            }
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
