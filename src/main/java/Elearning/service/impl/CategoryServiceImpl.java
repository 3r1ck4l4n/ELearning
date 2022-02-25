package Elearning.service.impl;

import Elearning.dao.CategoriaDao;
import Elearning.modelo.Categoria;
import Elearning.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CategoryService")
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoriaDao categoriaDao;

    @Override
    public boolean addCategory(Categoria categoria) {
        return categoriaDao.createCategory(categoria);
    }
}
