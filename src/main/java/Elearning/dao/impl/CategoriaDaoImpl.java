package Elearning.dao.impl;

import Elearning.dao.CategoriaDao;
import Elearning.modelo.Categoria;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository("CategoriaDao")
public class CategoriaDaoImpl implements CategoriaDao {


    @Override
    public List<Categoria> getAll() {
        List<Categoria> categorias = new ArrayList<>();
        Session mySession = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = mySession.getTransaction();
        try {

            transaccion.begin();
            Query query = mySession.createQuery("from Categoria ", Categoria.class);
            categorias = query.list();
            transaccion.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            mySession.close();
        }

        return categorias;
    }

    @Override
    public boolean createCategory(Categoria categoria) {
        boolean status = false;
        Session mySession = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaccion = mySession.getTransaction();
        try{
            transaccion.begin();
            mySession.save(categoria);
            transaccion.commit();
            status = true;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            mySession.close();
        }

        return status;
    }

    @Override
    public boolean updateCategory(Categoria categoria) {
        boolean status = false;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.update(categoria);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public Categoria findById(int idCategory) {
        Categoria categoria = new Categoria();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            categoria = session.get(Categoria.class, idCategory);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return categoria;
    }

}

