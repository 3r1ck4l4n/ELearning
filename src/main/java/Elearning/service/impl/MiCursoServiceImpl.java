package Elearning.service.impl;

import Elearning.dao.MiCursoDao;
import Elearning.modelo.MiCurso;
import Elearning.service.MiCursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
                System.out.println("key " + k + "value " + v);
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

    @Override
    public List<MiCurso> bringList(Integer idUsuario) {
        return miCursoDao.getMiCurso(idUsuario);
    }

    @Override
    public boolean updateMiCurso(MiCurso miCurso) {
        if(!miCurso.isObligatorio()){
            miCurso.setObligatorio(false);
        }
        if(!miCurso.isSugerido()){
            miCurso.setSugerido(false);
        }
        miCurso.setProgreso(0);
        MiCurso curso = miCursoDao.update(miCurso);
        if (curso != null){
            return true;
        }
        return false;
    }

    @Override
    public boolean createMiCurso(MiCurso miCurso) {
        try{
            miCursoDao.create(miCurso);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }


}
