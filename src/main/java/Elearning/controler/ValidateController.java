package Elearning.controler;

import Elearning.modelo.MiCurso;
import Elearning.service.MiCursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
//Muestra los cursos seleccionados por el usuario y a validar
public class ValidateController {
    @Autowired
    private MiCursoService miCursoService;
    @PostMapping(value = "validateCourse.html")
    public String validateCourse(@ModelAttribute MiCurso miCurso){
        System.out.println(miCurso);
        boolean status = miCursoService.updateMiCurso(miCurso);
        String redirect = "";
        if (status){
            redirect  = "redirect:/updateAccess.html?idUsuario="+miCurso.getIdUsuario();
        }

        return  redirect;
    }

    @GetMapping (value = "updateAccess.html")
    public String updateAccess(Model model, @RequestParam("idUsuario") Integer idUsuario){
        model.addAttribute("listMiCurso",miCursoService.bringList(idUsuario));
        MiCurso miCurso = new MiCurso();
        model.addAttribute("updateMiCurso", miCurso);
        return "validateCourse";

    }

}
