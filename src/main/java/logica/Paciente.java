package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Paciente extends Persona implements Serializable {
    
    private boolean eps;
    private String tipo_sangre;
    @OneToOne
    private Responsable unResponsable;
    @OneToMany(mappedBy = "pacien")
    private List<Turno>ListaTurnos;

    public Paciente() {
    }

    public Paciente(boolean eps, String tipo_sangre, Responsable unResponsable, List<Turno> ListaTurnos, int id, String dni, String nombre, String apellidos, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellidos, telefono, direccion, fecha_nac);
        this.eps = eps;
        this.tipo_sangre = tipo_sangre;
        this.unResponsable = unResponsable;
        this.ListaTurnos = ListaTurnos;
    }

    public boolean isEps() {
        return eps;
    }

    public void setEps(boolean eps) {
        this.eps = eps;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public Responsable getUnResponsable() {
        return unResponsable;
    }

    public void setUnResponsable(Responsable unResponsable) {
        this.unResponsable = unResponsable;
    }

    public List<Turno> getListaTurnos() {
        return ListaTurnos;
    }

    public void setListaTurnos(List<Turno> ListaTurnos) {
        this.ListaTurnos = ListaTurnos;
    }
    
    
    
}
