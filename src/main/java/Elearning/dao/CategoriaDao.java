package Elearning.dao;

import Elearning.modelo.Categoria;

import java.util.List;

public interface CategoriaDao {

    public List<Categoria> getAll();
    public boolean createCategory(Categoria categoria);
    public boolean updateCategory(Categoria categoria);
    public Categoria findById(int idCategory);
    public Categoria bringAllCategories(String nombreCategoria);
}
