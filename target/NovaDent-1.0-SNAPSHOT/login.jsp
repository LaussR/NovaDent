<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="layout/header.jsp" %>
    
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-8 col-md-9"> <!-- Más centrado -->

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Única columna para evitar espacio blanco -->
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Bienvenido a NovaDent</h1>
                                <p class="mb-4 text-muted">Por favor ingresa tus credenciales para continuar</p>
                            </div>
                            <form class="user" action="svLogin" method="POST">
                                <div class="form-group">
                                    <input type="text" id="usuario" name="usuario"
                                           class="form-control form-control-user"
                                           placeholder="Usuario..." required>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="contrasena" name="contrasena"
                                           class="form-control form-control-user"
                                           placeholder="Contraseña..." required>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox small">
                                        <input type="checkbox" class="custom-control-input" id="customCheck">
                                        <label class="custom-control-label" for="customCheck">Recordarme</label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Iniciar Sesión
                                </button>
                                <hr>
                                <button type="button" class="btn btn-primary btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Iniciar con Google
                                </button>
                                <button type="button" class="btn btn-primary btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Iniciar con Facebook
                                </button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.jsp">¿Olvidaste tu contraseña?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="register.jsp">¡Crear una cuenta!</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <%@include file="layout/scripts.jsp" %>

</body>



</html>