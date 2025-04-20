<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="svIndex">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-tooth"></i>
                </div>
                <div class="sidebar-brand-text mx-3">NovaDent</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="svIndex">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Menú</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                GESTION NOVADENT
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsu"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cogs"></i>
                    <span>Usuarios</span>
                </a>
                <div id="collapseUsu" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svUsuario">Ver Usuarios</a>
                        <a class="collapse-item" href="UsuarioAlta.jsp">Alta Usuarios</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSecre"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>Secretarios</span>
                </a>
                <div id="collapseSecre" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svSecretario">Ver Secretarios</a>
                        <a class="collapse-item" href="SecretarioAlta.jsp">Alta Secretarios</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOdonto"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-laugh-squint"></i>
                    <span>Odontologos</span>
                </a>
                <div id="collapseOdonto" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svOdontologo">Ver Odontologos</a>
                        <a class="collapse-item" href="OdontologoAlta.jsp">Alta Odontologos</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePaci"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-laugh-wink"></i>
                    <span>Pacientes</span>
                </a>
                <div id="collapsePaci" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svPaciente">Ver Pacientes</a>
                        <a class="collapse-item" href="PacienteAlta.jsp">Alta Pacientes</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseResp"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-laugh-squint"></i>
                    <span>Responsables</span>
                </a>
                <div id="collapseResp" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svResponsable">Ver Responsables</a>
                        <a class="collapse-item" href="ResponsableAlta.jsp">Alta Responsables</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseHora"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Horarios</span>
                </a>
                <div id="collapseHora" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svHorario">Ver Horarios</a>
                        <a class="collapse-item" href="HorarioAlta.jsp">Alta Horarios</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTurn"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Turnos</span>
                </a>
                <div id="collapseTurn" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="svTurno">Ver Turnos</a>
                        <a class="collapse-item" href="TurnoAlta.jsp">Alta Turnos</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>Clinica NovaDent</strong> Por una sonrisa más brillante!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">