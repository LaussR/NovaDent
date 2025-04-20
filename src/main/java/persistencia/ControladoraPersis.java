package persistencia;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersis {

    PersonaJpaController persJPA = new PersonaJpaController();
    HorarioJpaController horaJPA = new HorarioJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    

    public void crearHorario(Horario hor) {
        horaJPA.create(hor);
    }

    public List<Horario> getHorarios() {
        return horaJPA.findHorarioEntities();
    }

    public void borrarHorario(int id) {
        try {
            horaJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Horario traerHorario(int id) {
        return horaJPA.findHorario(id);
    }

    public void editarHorario(Horario hor) {
        try {
            horaJPA.edit(hor);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearUsu(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void borrarUsu(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsu(int id) {
        return usuJPA.findUsuario(id);
    }

    public void editarUsu(Usuario usu) {
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearSecre(Secretario sec) {
        secreJPA.create(sec);
    }

    public List<Secretario> getSecretarios() {
        return secreJPA.findSecretarioEntities();
    }

    public void borrarSecre(int id) {
        try {
            secreJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Secretario traerSecre(int id) {
        return secreJPA.findSecretario(id);
    }

    public void editarSecre(Secretario sec) {
        try {
            secreJPA.edit(sec);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearOdonto(Odontologo odon) {
        odontoJPA.create(odon);
    }

    public List<Odontologo> getOdontos() {
        return odontoJPA.findOdontologoEntities();
    }

    public void borrarOdonto(int id) {
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo traerOdonto(int id) {
        return odontoJPA.findOdontologo(id);
    }

    public void editarOdonto(Odontologo odon) {
        try {
            odontoJPA.edit(odon);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearPaci(Paciente pac) {
        pacJPA.create(pac);
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public void borrarPaci(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Paciente traerPaci(int id) {
        return pacJPA.findPaciente(id);
    }

    public void editarPaci(Paciente pac) {
        try {
            pacJPA.edit(pac);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearResp(Responsable res) {
        respJPA.create(res);
    }

    public List<Responsable> getResponsables() {
        return respJPA.findResponsableEntities();
    }

    public void borrarResp(int id) {
        try {
            respJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Responsable traerResp(int id) {
        return respJPA.findResponsable(id);
    }

    public void editarResp(Responsable res) {
        try {
            respJPA.edit(res);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearTurn(Turno turn) {
        turnJPA.create(turn);
    }

    public List<Turno> getTurnos() {
        return turnJPA.findTurnoEntities();
    }

    public void borrarTurn(int id) {
        try {
            turnJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Turno traerTurn(int id) {
        return turnJPA.findTurno(id);
    }

    public void editarTurn(Turno turn) {
        try {
            turnJPA.edit(turn);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersis.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> listaTurnosActuales(String fActual) {
        EntityManager em = turnJPA.getEntityManager();
        List<Turno> lista = new ArrayList<>();

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = sdf.parse(fActual);

            Query query = em.createQuery("SELECT t FROM Turno t WHERE t.fecha = :fHoy ORDER BY t.hora");
            query.setParameter("fHoy", fecha);

            lista = query.getResultList();
        } catch (ParseException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return lista;
    }

    public Usuario getUsuarioPorNombre(String nombreUsuario) {
        EntityManager em = usuJPA.getEntityManager();
        Usuario usuario = null;

        try {
            Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.nombre_usuario = :nombre");
            query.setParameter("nombre", nombreUsuario);

            usuario = (Usuario) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return usuario;
    }

    public List<Turno> turnosHoyOdontologos(String fActual, String nombreUsuario) {
        EntityManager em = turnJPA.getEntityManager();
        List<Turno> lista = new ArrayList<>();

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = sdf.parse(fActual);

            Query query = em.createQuery("SELECT t FROM Turno t WHERE t.fecha = :fHoy AND t.odonto.unUsuario.nombre_usuario = :nombreUsuario ORDER BY t.hora");
            query.setParameter("fHoy", fecha);
            query.setParameter("nombreUsuario", nombreUsuario);

            lista = query.getResultList();
        } catch (ParseException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return lista;
    }
}
