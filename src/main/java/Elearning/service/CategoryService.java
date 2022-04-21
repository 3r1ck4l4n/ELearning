package Elearning.service;

import Elearning.modelo.Categoria;
import com.dropbox.core.DbxException;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface CategoryService {

    public boolean addCategory(Categoria categoria);
    public String guardarDropBox(MultipartFile imgCategory) throws IOException, DbxException;
    public String findCoursesByCategory(String categoria, Model model, HttpServletRequest request);
    public List<Categoria> getAll();
}
