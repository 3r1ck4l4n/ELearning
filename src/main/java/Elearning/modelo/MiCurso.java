package Elearning.modelo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MiCurso")
public class MiCurso implements Serializable {

    @Getter
    @Setter
    @Column(name = "progreso")
    private Integer progreso;

    @Getter
    @Setter
    @Id
    @Column(name = "idUsuario")
    private int idUsuario;

    @Getter
    @Setter
    @Id
    @Column(name = "idCurso")
    private int idCurso;

    @Getter
    @Setter
    @Column(name = "sugerido")
    private boolean sugerido;

    @Column(name = "obligatorio")
    private boolean obligatorio;
    public MiCurso() {
    }

    public MiCurso(int idUsuario, int idCurso) {
        this.idUsuario = idUsuario;
        this.idCurso = idCurso;
    }

    public MiCurso(boolean sugerido, boolean obligatorio) {
        this.sugerido = sugerido;
        this.obligatorio = obligatorio;
    }

    public MiCurso(Integer progreso) {
        this.progreso = progreso;
    }



    @Override
    public String toString() {
        return "MiCurso{" + "idUsuario=" + idUsuario + ", idCurso=" + idCurso + ", progreso=" + progreso + '}';
    }
}
