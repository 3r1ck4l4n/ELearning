package Elearning.controler;

import Elearning.modelo.Categoria;
import Elearning.service.CategoryService;
import com.dropbox.core.DbxException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;


    @GetMapping("addCategory.html")
    public String addCategory(Model model) {
        Categoria categoria = new Categoria();
        model.addAttribute("category", categoria);
        return "addCategory";
    }

    @PostMapping("createCategory.html")
    public String createCategory(@ModelAttribute("category") Categoria categoria, @RequestParam(name = "imgCategory")MultipartFile imgCategory) throws IOException, DbxException {
        categoria.setCaratula(categoryService.guardarDropBox(imgCategory));
        boolean status =categoryService.addCategory(categoria);
        String view;
        if(status){
            view = "index";
        }else{
            view = "addCategory";
        }
        return view;
    }

}
