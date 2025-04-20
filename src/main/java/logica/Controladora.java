package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersis;

public class Controladora {

    ControladoraPersis controlPersis = new ControladoraPersis();

    public boolean comprobarAcceso(String usuario, String contrasena) {

        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();
        for (Usuario usu : listaUsuarios) {
            if (usu.getNombre_usuario().equals(usuario)) {
                if (usu.getContrasenia().equals(contrasena)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void crearHorario(String horarioInicio, String horarioSalida) {
        Horario hor = new Horario();
        hor.setHorario_inicio(horarioInicio);
        hor.setHorario_fin(horarioSalida);
        controlPersis.crearHorario(hor);
    }

    public List<Horario> getHorarios() {
        return controlPersis.getHorarios();
    }

    public void borrarHorario(int id) {
        controlPersis.borrarHorario(id);
    }

    public Horario traerHorario(int id) {
        return controlPersis.traerHorario(id);
    }

    public void editarHorario(Horario hor) {
        controlPersis.editarHorario(hor);
    }
    
    public void crearUsu(String nombreUsuario, String contrasenia, String rol) {
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        controlPersis.crearUsu(usu);
    }

    public List<Usuario> getUsuarios() {
        return controlPersis.getUsuarios();
    }

    public void borrarUsu(int id) {
        controlPersis.borrarUsu(id);
    }

    public Usuario traerUsu(int id) {
        return controlPersis.traerUsu(id);
    }

    public void editarUsu(Usuario usu) {
        controlPersis.editarUsu(usu);
    }
    
    public void crearSecre(String dni, String nombre, String apellidos, String telefono, String direccion, Date fecha_nac, String sector, Usuario usu) {
        Secretario sec = new Secretario();
        sec.setDni(dni);
        sec.setNombre(nombre);
        sec.setApellidos(apellidos);
        sec.setTelefono(telefono);
        sec.setDireccion(direccion);
        sec.setFecha_nac(fecha_nac);
        sec.setSector(sector);
        sec.setUnUsuario(usu);
        controlPersis.crearSecre(sec);
    }

    public List<Secretario> getSecretarios() {
        return controlPersis.getSecretarios();
    }

    public void borrarSecre(int id) {
        controlPersis.borrarSecre(id);
    }

    public Secretario traerSecre(int id) {
        return controlPersis.traerSecre(id);
    }

    public void editarSecre(Secretario sec) {
        controlPersis.editarSecre(sec);
    }

    public void crearOdonto(String dni, String nombre, String apellidos, String telefono, String direccion, Date fecha_nac, String especialidad, Horario hor, Usuario usu) {
        Odontologo odon = new Odontologo();
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellidos(apellidos);
        odon.setTelefono(telefono);
        odon.setDireccion(direccion);
        odon.setFecha_nac(fecha_nac);
        odon.setEspecialidad(especialidad);
        odon.setUnHorario(hor);
        odon.setUnUsuario(usu);
        controlPersis.crearOdonto(odon);
    }

    public List<Odontologo> getOdontos() {
        return controlPersis.getOdontos();
    }

    public void borrarOdonto(int id) {
        controlPersis.borrarOdonto(id);
    }

    public Odontologo traerOdonto(int id) {
        return controlPersis.traerOdonto(id);
    }

    public void editarOdonto(Odontologo odon) {
        controlPersis.editarOdonto(odon);
    }

    public void crearPaci(String dni, String nombre, String apellidos, String telefono, String direccion, Date fecha_nac, Boolean eps, String sangre, Responsable res) {
        Paciente pac = new Paciente();
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellidos(apellidos);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFecha_nac(fecha_nac);
        pac.setEps(eps);
        pac.setTipo_sangre(sangre);
        pac.setUnResponsable(res);
        controlPersis.crearPaci(pac);
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void borrarPaci(int id) {
        controlPersis.borrarPaci(id);
    }

    public Paciente traerPaci(int id) {
        return controlPersis.traerPaci(id);
    }

    public void editarPaci(Paciente pac) {
        controlPersis.editarPaci(pac);
    }
    
    public void crearResp(String dni, String nombre, String apellidos, String telefono, String direccion, Date fecha_nac, String responsable) {
        Responsable res = new Responsable();
        res.setDni(dni);
        res.setNombre(nombre);
        res.setApellidos(apellidos);
        res.setTelefono(telefono);
        res.setDireccion(direccion);
        res.setFecha_nac(fecha_nac);
        res.setTipo_responsable(responsable);
        controlPersis.crearResp(res);
    }

    public List<Responsable> getResponsables() {
        return controlPersis.getResponsables();
    }

    public void borrarResp(int id) {
        controlPersis.borrarResp(id);
    }

    public Responsable traerResp(int id) {
        return controlPersis.traerResp(id);
    }

    public void editarResp(Responsable res) {
        controlPersis.editarResp(res);
    }


    public void crearTurn(Date fecha_turno, String hora_turno, String tratamiento, Odontologo odon, Paciente pac) {
        Turno turn = new Turno();
        turn.setFecha(fecha_turno);
        turn.setHora(hora_turno);
        turn.setTratamiento(tratamiento);
        turn.setOdonto(odon);
        turn.setPacien(pac);
        controlPersis.crearTurn(turn);
    }

    public List<Turno> getTurnos() {
        return controlPersis.getTurnos();
    }

    public void borrarTurn(int id) {
        controlPersis.borrarTurn(id);
    }

    public Turno traerTurn(int id) {
        return controlPersis.traerTurn(id);
    }

    public void editarTurn(Turno turn) {
        controlPersis.editarTurn(turn);
    }

    public List<Turno> getTurnosHoyOdontologos(String fecha_hoy, String usuario) {

        Usuario usu = controlPersis.getUsuarioPorNombre(usuario);

        if (usu != null && "odontologo".equalsIgnoreCase(usu.getRol())) {
            return controlPersis.turnosHoyOdontologos(fecha_hoy, usuario);
        } else {
            return controlPersis.listaTurnosActuales(fecha_hoy); 
        }
    }

}
