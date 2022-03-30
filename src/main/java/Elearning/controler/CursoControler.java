package Elearning.controler;

import Elearning.dao.CategoriaDao;
import Elearning.modelo.Categoria;
import Elearning.modelo.Usuario;
import Elearning.modelo.formModel.CursoModel;
import Elearning.service.CategoryService;
import Elearning.service.CursoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CursoControler {
    
    public String DatosE;

    @Autowired
    private CursoService cursoService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoriaDao categoriaDao;
    @RequestMapping(value = "nuevocurso.html", method = RequestMethod.GET)
    public ModelAndView nuevocurso(Model model) {
        ModelAndView mo = new ModelAndView();
        List<Categoria> categories = categoriaDao.getAll();
        model.addAttribute("categories", categories);
        mo.setViewName("nuevocurso");
        return mo;
    }
   
    //Creacion de los Cursos
    @RequestMapping(value="crearCurso.html",method = RequestMethod.POST)
    public String crearCurso(@ModelAttribute CursoModel CursoF,HttpServletRequest request){
        return cursoService.createNewCurso(CursoF,request);
    }
    
    //Listado de los curso de acuerdo a su categoria
     @RequestMapping(value = "Cartas.html", method = RequestMethod.GET)
     public String listadoCursos(@RequestParam("categoria") String categoria,Model model, HttpServletRequest request){
         //return cursoService.listadoCursos(categoria,model);
        return categoryService.findCoursesByCategory(categoria, model, request);
    }
   
   //Este es el del crud de cursos para Listar Actualizar y Eliminar  
    @RequestMapping(value = "listadodecursos.html", method = RequestMethod.GET)
    public String listadodecursos2(Model model) {
        return cursoService.listadoAllCursos(model);
    }
    
    @RequestMapping(value = "borrarCursos.html", method = RequestMethod.GET)
    public  ModelAndView listadodecursos(@RequestParam("CursoE") int CursoE, Model model) {
        //String aux = "";
        //String Dirigir = "listadodecursos.html";
        ModelAndView mo = new ModelAndView();
        
        if(cursoService.deleteCurso(CursoE)){
            System.out.println("Se elimino el curso con ID: " + CursoE);
            //DatosE = "Se elimino el curso correctamente.";
            //aux = "exito";
            mo.setViewName("redirect:/listadodecursos.html");
        } else{
            System.out.println("No se ha borrado el curso...");
            //DatosE = "¡Algo salio mal! No se ha podido borrar el curso...";
            //aux = "error";
            mo.setViewName("redirect:/error.html");
        }
        /*
        model.addAttribute("Message", DatosE);
        model.addAttribute("Dirigir", Dirigir);
        return aux;
        */
        return mo;
    }
    
    @RequestMapping(value="ActualizarCurso.html",method = RequestMethod.POST)
    public String ActualizarCurso(
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("categoria") String categoria,
            @RequestParam("caratula") MultipartFile caratula,
            @RequestParam("curid") int idCurso){
        return cursoService.updateCurso(idCurso, nombre, descripcion, categoria, caratula);
    }
    
    
    //Vistas de Error Curso
    @RequestMapping(value = "errorCurso.html")
    public String errorCurso(){
        return "errorCurso";
    }
    
    @RequestMapping(value = "errorCursoU.html")
    public String errorCursoU(){
        return "errorCursoU";
    }


    /***
     * Esta función permite mostrar el formulario para seleccionar los cursos que el usuario desea tomar.
     * @params: Model, String
     *
     * @return String
     *
     * */

    @RequestMapping(value = "selectCourses.html")
    public String selectCourses(Model model, @ModelAttribute("user") String usuario) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();

        Usuario us = mapper.readValue(usuario, Usuario.class);

        System.out.println(us);
        List<Categoria> categorias = categoriaDao.getAll();
        model.addAttribute("usuario", us);
        model.addAttribute("categories", categorias);


        return "selectCourses";
    }


    

}
