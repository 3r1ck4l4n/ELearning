package Elearning.service;

import Elearning.modelo.MiCurso;
import java.util.List;
import java.util.Map;

public interface MiCursoService {
    public boolean selectCourses (Map<String, String> allParams);
    public List<MiCurso> bringList(Integer idUsuario);
}
