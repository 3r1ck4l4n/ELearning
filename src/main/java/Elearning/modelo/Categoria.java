package Elearning.modelo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "Categorias")
public class Categoria implements Serializable {


    public Categoria() {
    }

    public Categoria(String nombreCategoria, String descripcionCategoria, String caratula) {
        this.nombreCategoria = nombreCategoria;
        this.descripcionCategoria = descripcionCategoria;
        this.caratula = caratula;
    }

    @Override
    public String toString() {
        return "Categoria{" +
                "idCategoria=" + idCategoria +
                ", nombreCategoria='" + nombreCategoria + '\'' +
                ", descripcionCategoria='" + descripcionCategoria + '\'' +
                ", idModulo=" + cursos +
                '}';
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    @Column(name = "ID_CATEGORIA")
    private Integer idCategoria;

    @Column(name = "NOMBRE_CATEGORIA")
    @Getter
    @Setter
    private String nombreCategoria;

    @Setter
    @Getter
    @Column(name = "DESCRIPCION_CATEGORIA")
    private String descripcionCategoria;

    //Relacion de un usuario a muchos cursos
    @Getter
    @Setter
    @OneToMany(mappedBy = "categoria", fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    private List<Curso> cursos;

    @Column(name = "CARATULA_CATEGORIA")
    @Setter
    @Getter
    private String caratula;
}
