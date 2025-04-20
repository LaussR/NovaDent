<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Turno"%>
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
                    <h1 class="h3 mb-0 text-gray-800">NovaDent</h1>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Fecha del</th>
                            <th>Hora del Turno</th>
                            <th>Tratamiento</th>
                            <th>Odontologo</th>
                            <th>Paciente</th>
                        </tr>
                    </thead>
                    <%                        List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos");
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
                        </tr>
                        <%  }
                            } else {
                                out.println("<tr><td colspan='7'>No hay turnos para hoy.</td></tr>");
                            }%>
                    </tbody>
                </table>
                <br><br>



                <%@include file="layout/footer.jsp" %>

                <%@include file="layout/scripts.jsp" %>

                </body>

                </html>