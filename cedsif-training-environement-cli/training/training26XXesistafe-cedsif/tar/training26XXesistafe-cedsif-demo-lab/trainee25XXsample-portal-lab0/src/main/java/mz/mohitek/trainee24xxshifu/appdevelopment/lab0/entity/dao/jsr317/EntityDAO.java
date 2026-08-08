/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author shifu
 * 
 * Regista todos os contractos/operaçoes genericas
 * CRUD
 * em uma base de dados
 * @param <T>
 * @param <PK>
 */
public interface EntityDAO<T,PK extends Serializable> extends Serializable {
    /**
     * C-create
     * R-read
     * U-update
     * D-delete
     * 
     * Cada uma dessas operaçoes possui o seu negocio.
     */
   
    /**
     * 
     * @param t 
     */
    public void create(final T o) throws EntityExistsException;
    /**
     * 
     * @param id 
     */
    public T read(final PK id) throws EntityNotFoundException;
    /**
     * 
     * @param o
     * @param id 
     */
    default void update(final T o, final PK id) throws EntityNotFoundException {
        
        throw new UnsupportedOperationException("Not supported yet for class ");
    }
       /**
     * 
     * @param o 
     */
    default void update(final T o) throws EntityNotFoundException {
        
        throw new UnsupportedOperationException("Not supported yet for class ");
    }
    /**
     * 
     * @param id 
     */
    public void delete(final PK id) throws EntityNotFoundException;
    /**
     * 
     * @param id 
     */
    default void delete(final T o) throws NullPointerException {
    
        throw new UnsupportedOperationException("Not supported yet for class ");
    }
    /**
     * 
     * As consultas a base via query podem ser por
     * NativeQuery or TypedQuery (hw) 
     * @param t
     * @return 
     */
    public List<T> list(final Class<T> t); //{throw new UnsupportedOperationException("Not supported yet for class ");}
    /**
     * 
     * @param qName
     * @param t
     * @return 
     */
    public List<T> list(final String qName, final Class<T> t);// {throw new UnsupportedOperationException("Not supported yet for class ");}
    

}
