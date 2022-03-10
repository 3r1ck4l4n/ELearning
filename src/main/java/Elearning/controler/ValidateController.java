package Elearning.controler;

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
    /**@PostMapping(value = "validateCourse.html")
    public String validateCourse(@RequestParam Map<String, String> allParams){
        return "";
    } **/

    @GetMapping (value = "updateAccess.html")
    public String updateAccess(Model model, @RequestParam("idUsuario") Integer idUsuario){
        model.addAttribute("listMiCurso",miCursoService.bringList(idUsuario));
        return "validateCourse";

    }


}
