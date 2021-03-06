package Elearning.service.impl;

import Elearning.dao.CategoriaDao;
import Elearning.dao.UsuarioDao;
import Elearning.modelo.Categoria;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.modelo.formModel.CursoModel;
import Elearning.service.CategoryService;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service("CategoryService")
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoriaDao categoriaDao;
    @Autowired
    UsuarioDao usuarioDao;

    @Override
    public boolean addCategory(Categoria categoria) {
        return categoriaDao.createCategory(categoria);
    }

    public String guardarDropBox(MultipartFile imgCategory) throws IOException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = imgCategory + "_Imagen" + getExtention(imgCategory.getOriginalFilename());
        jv.uploadToDropbox(imgCategory.getBytes(), "/" + caratula);
        String urlImagen = jv.createURL(caratula);
        String sNuevaURL = reemplazar(urlImagen, "www.dropbox.com", "dl.dropboxusercontent.com");
        System.out.println("url modificada: " + sNuevaURL);
        if (!sNuevaURL.equals("")) {
            enlace = sNuevaURL;
        }
        return enlace;
    }

    @Override
    public String findCoursesByCategory(String categoria, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Usuario usuario = usuarioDao.getUsuario((int) session.getAttribute("UsuarioID"));
        List<Curso> misCursos = new ArrayList<Curso>();
        usuario.getMisCursos().forEach(miCurso -> {
            if (miCurso.getCurso().getCategoria().getNombreCategoria().equals(categoria) && (miCurso.isObligatorio() || miCurso.isSugerido())) {
                misCursos.add(miCurso.getCurso());
            }
        });
        model.addAttribute("categoria", categoria);
        model.addAttribute("cursos", misCursos);
        return "Cartas";
    }

    @Override
    public List<Categoria> getAll() {
        return categoriaDao.getAll();
    }

    private String getExtention(String string) {
        return string.substring(string.lastIndexOf("."), string.length());

    }

    public static String reemplazar(String cadena, String busqueda, String reemplazo) {
        return cadena.replaceAll(busqueda, reemplazo);
    }

}
