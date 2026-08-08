/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317;

import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.Entity;
//import org.apache.openjpa.persistence.OpenJPAPersistence;
//import org.apache.openjpa.persistence.OpenJPAQuery;
/**
 *
 * @author shifu
 * @param <T>
 * @param <PK>
 */
public abstract class EntityDAOImpl<T extends Entity, PK extends Serializable> implements EntityDAO<T, PK> {

    //application management
    private EntityManager em;

    //make it transactional with jpa-tansactional and shared over all subclasses
    protected EntityTransaction emTx;

    protected Class<T> tclazz;
    private PK pk;

    protected java.util.logging.Logger logger;

    //uitilizado pelo JPA
    public EntityDAOImpl() {
        //logger.log(Level.INFO, "MoglyEntityDAO-v1 JPA Initializing [{0}()]", tclazz.getName());
    }

    //utilizado para controlar e instanciar as subclasses
    public EntityDAOImpl(final Class<T> tClass) {

        //this();
        //
        this.tclazz = tClass;
        this.logger = java.util.logging.Logger.getLogger(tclazz.getCanonicalName());

        //create an jpa factory
        em = Persistence.createEntityManagerFactory("trainee24xxshifu-PU")
                .createEntityManager();

        //createTx
        emTx = em.getTransaction();

        //beginTx
        //emTx.begin();
        try {
            
            /*if instance is an ojpa call another logger*/
            //if(!(em instanceof org.apache.openjpa.persistence.EntityManagerImpl))
                /*logger.log(Level.INFO, "EntityDAO-v2 javaxJPA Initializing [{0}()] entities=[{1}] and isActiveEmTx={2}",
                    new Object[]{tClass.getName(), em.getEntityManagerFactory().getMetamodel().getEntities(), emTx.isActive()});*/
            /*else
                logger.log(Level.INFO, "EntityDAO-v2 openJPA  Initializing [{0}()] entities=[{1}] and isActiveEmTx={2}",
                    new Object[]{tClass.getName(), em.getEntityManagerFactory().getMetamodel().getEntities(), emTx.isActive()});*/
            

        } catch (NullPointerException nux) {

            logger.log(Level.INFO, "NullpointerException at {0}",
                    new Object[]{em});
        }

    }
    
    /**
     * 
     * @param tClass
     * @param persistenceUnitName 
     */
    public EntityDAOImpl(final Class<T> tClass, final String persistenceUnitName) {

        //this();
        //
        this.tclazz = tClass;
        this.logger = java.util.logging.Logger.getLogger(tclazz.getCanonicalName());

        //create an jpa factory
        em = Persistence.createEntityManagerFactory(persistenceUnitName)
                .createEntityManager();

        //createTx
        emTx = em.getTransaction();

        //beginTx
        //emTx.begin();
        try {

            /*logger.log(Level.INFO, "EntityDAO-v2 JPA Initializing [{0}()] entities=[{1}] and isActiveEmTx={2}",
                    new Object[]{tclazz.getName(), em.getEntityManagerFactory().getMetamodel().getEntities(), emTx.isActive()});*/

        } catch (NullPointerException nux) {

            logger.log(Level.INFO, "{0}", new Object[]{em});
        }

    }

    @Override
    public void create(final T o) {

        //o.getClass().getField("id"); in this case id is as a key is better option.
        //persiste na base
        em.persist((T) o);

    }

    @Override
    public T read(final PK id) {

        if (em.find(tclazz, id) == null) {
            throw new EntityNotFoundException();
        }

        return (T) em.find(tclazz, id);
    }

    @Override
    public void update(final T o, final PK id) {

        try{
            
            em.find(tclazz,id);
            
            em.merge((T) o);
            
        }catch(EntityNotFoundException nux){
            throw new EntityNotFoundException();
        }

        
    }

    @Override
    public void delete(final PK id) {

        em.remove(id);
    }

    @Override
    public List<T> list(final String queryName, final Class<T> tClazz) {
        
        //list all namedQuery.
        final Query q = em.createQuery(queryName, tClazz);//em.createNativeQuery(queryName, tclazz);
        
        return (List<T>) q.getResultList();
    }

    @Override
    public List<T> list(final Class<T> tclazz) {
        
        Query q = em.createNativeQuery("SELECT * FROM ", tclazz);
        
        return q.getResultList();
    }
    
    
 
}
