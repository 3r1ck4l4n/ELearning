
package Elearning.controler;


import Elearning.service.CategoryService;
import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;


@Controller
@RequestMapping("/")
public class HomeController {
    
    
    @Autowired
    private UsuarioService usuarioService;
    @Autowired
    private CategoryService categoryService;
    
    //Este contrlador para nada debe cambiar de Metodo DEVER SER SI O SI GET
    @RequestMapping(value = "index.html", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        return mo;
    }
    
    
    @RequestMapping(value="semilleroRegistro.html",method = RequestMethod.POST)
    public ModelAndView semilleroRegistro(HttpServletRequest request, RedirectAttributes redirectAttributes) throws IOException {
        ModelAndView mo = new ModelAndView();
        String data = usuarioService.createNewSemillero(request);
        switch (data) {
            case "existente":
                System.out.println();
                mo.setViewName("error");
                break;
            default:
                redirectAttributes.addFlashAttribute("user", data);
                mo.setViewName("redirect:/selectCourses.html");
                System.out.println("Redirect");
                break;
        }
         return mo;
        
    }
    
    @RequestMapping(value = "validador.html",method = RequestMethod.POST)

    public ModelAndView validador(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
         switch (usuarioService.loginUser(request)) {
            case "Semillero":
                mo.setViewName("bienvenida");
               
                mo.addObject("categorias", categoryService.getAll());
                break;
            case "Administrador":
                mo.setViewName("admin");
                break;
            case "No Cursos":
                mo.setViewName("validateUser");
                break;
            default:
                mo.setViewName("error");
                break;
        }
         return mo;
    }
   
   
    @RequestMapping(value = "enviarCorreo.html",method = RequestMethod.GET)
    public ModelAndView enviarCorreo(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
        if(usuarioService.recuperarContrase??a(request)){
            mo.setViewName("index");
            System.out.println("Correo Emviado");
        } else {
            mo.setViewName("error");
            System.out.println("Correo no Emviado");
        }       
        return mo;
    } 
    
     //Controlador para cerrar session
    @RequestMapping(value = "cerrarSession.html", method = RequestMethod.GET)
     public ModelAndView cerrarSession(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
        HttpSession session = request.getSession(false);
        session.removeAttribute("usuario");
        session.removeAttribute("tUsuario");
        session.removeAttribute("UsuarioID");
        session.removeAttribute("CursoID");
        session.invalidate();
        System.out.println("SESION CERRADA");
        mo.setViewName("redirect:/index.html");
        return mo;
    }
    
    @RequestMapping("error.html")
    public ModelAndView error(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("error");
        return mo;
    }
    
    @RequestMapping("exito.html")
    public ModelAndView exito(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("exito");
        return mo;
    }
    
    @RequestMapping("admin.html")
    public ModelAndView admin(){
         ModelAndView mo = new ModelAndView();
        mo.setViewName("admin");
        return mo;
    }
    
     @RequestMapping("bienvenida.html")
     public ModelAndView semillero(){
         ModelAndView mo = new ModelAndView();
         mo.addObject("categorias", categoryService.getAll());
         mo.setViewName("bienvenida");

        return mo;
    }
 @RequestMapping("validateUser.html")
    public ModelAndView validateUser(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("validateUser");
        return mo;
    }
}
