package Elearning.service;

import Elearning.modelo.Categoria;
import com.dropbox.core.DbxException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface CategoryService {

    public boolean addCategory(Categoria categoria);
    public String guardarDropBox(MultipartFile imgCategory) throws IOException, DbxException;
}
