package Elearning.controler;

import Elearning.service.MiCursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MiCursoController {

    @Autowired
    MiCursoService miCursoService;

    @PostMapping("chooseCourses.html")
    public String selectCourses(@RequestParam Map<String, String> allParams){
        String view;
        boolean status = miCursoService.selectCourses(allParams);
        view = status?"exito":"error";
        
        return view;
    }

}
