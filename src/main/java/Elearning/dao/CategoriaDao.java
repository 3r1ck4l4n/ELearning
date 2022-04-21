package Elearning.dao;

import Elearning.modelo.Categoria;

import java.util.List;
import java.util.Map;

public interface CategoriaDao {

    public List<Categoria> getAll();
    public boolean createCategory(Categoria categoria);
    public boolean updateCategory(Categoria categoria);
    public Categoria findById(int idCategory);
}
