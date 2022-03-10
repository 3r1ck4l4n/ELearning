package Elearning.modelo;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ManyToAny;

import java.io.Serializable;
import javax.persistence.*;

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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idCurso", insertable = false, updatable = false)
    @Getter
    @Setter
    private Curso curso;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idUsuario", insertable = false, updatable = false)
    @Getter
    @Setter
    private Usuario usuarioAc;
}

