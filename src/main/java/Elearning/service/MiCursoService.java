package Elearning.service;

import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import java.util.List;
import java.util.Map;

public interface MiCursoService {
    public boolean selectCourses (Map<String, String> allParams);
    public List<MiCurso> bringList(Integer idUsuario);
    public boolean updateMiCurso(MiCurso miCurso);
    public boolean createMiCurso(MiCurso miCurso);

}
