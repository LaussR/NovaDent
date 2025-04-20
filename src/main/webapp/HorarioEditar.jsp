<%@page import="logica.Horario"%>
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
                    <h1 class="h3 mb-0 text-gray-800">Editar Horarios</h1>
                </div>

                <% Horario hor = (Horario) request.getSession().getAttribute("horaEditar");%>

                <form action="svHorarioEditar" method="POST" class="mx-auto p-4 rounded-4 shadow-sm bg-white">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Hora Inicio:</label>
                            <select class="form-control" id="horarioinicio" name="horarioinicio" required>
                                <option></option>
                                <%
                                    for (int hora = 6; hora <= 14; hora++) {
                                        for (int minuto = 0; minuto < 60; minuto += 30) {
                                            String horaIni = String.format("%02d:%02d", hora, minuto);
                                            boolean horaIniSelec = horaIni.equals(hor.getHorario_inicio());
                                %>
                                <option value="<%=horaIni%>" <%= horaIniSelec ? "selected" : ""%>><%=horaIni%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="inputFirstName">Hora Salida</label>
                            <select class="form-control" id="horariosalida" name="horariosalida" required>
                                <option></option>
                                <%
                                    for (int hora = 10; hora <= 18; hora++) {
                                        for (int minuto = 0; minuto < 60; minuto += 30) {
                                            String horaSalida = String.format("%02d:%02d", hora, minuto);
                                            boolean horaSalidaSelec = horaSalida.equals(hor.getHorario_fin());
                                %>
                                <option value="<%=horaSalida%>" <%= horaSalidaSelec ? "selected" : ""%>><%=horaSalida%></option>
                                <%
                                        }
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
                                    <a class="btn btn-danger btn-block" href="HorarioVer.jsp">Cancelar</a>
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