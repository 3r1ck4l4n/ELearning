package Elearning.service.impl;

import Elearning.dao.MiCursoDao;
import Elearning.modelo.MiCurso;
import Elearning.service.MiCursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class MiCursoServiceImpl implements MiCursoService {
@Autowired
    MiCursoDao miCursoDao;
    @Override
    public boolean selectCourses(Map<String, String> allParams ) {
        boolean status = false;
        int idUsuario;
        try{
            idUsuario = Integer.parseInt(allParams.get("idUsuario"));
            allParams.remove("idUsuario");

            allParams.forEach((k, v)->{
                int idCurso = Integer.parseInt(v);
                MiCurso miCurso = new MiCurso(idUsuario,idCurso);
                miCursoDao.create(miCurso);
            });
            status = true;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("Se ejecuto el metodo en su totalidad");
        }
        return status;
    }


}
