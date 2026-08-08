/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317;

import java.io.Serializable;
import java.util.logging.Level;
import javax.persistence.EntityNotFoundException;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.Entity;

/**
 *
 * @author shifu Executa operaçoes transacionaveis na base de dados
 * @param <T>
 * @param <PK>
 *
 */
public abstract class TxEntityDAOImpl<T extends Entity, PK extends Serializable>
        extends EntityDAOImpl<T, PK> {

    //utilizado para controlar e instanciar as subclasses
     public TxEntityDAOImpl(final Class<T> tClazz) {

        super(tClazz);
    }

    @Override
    public T read(final PK key) throws EntityNotFoundException {

        T o = null;

        //inicio de uma transaction
        emTx.begin();
        logger.log(Level.INFO, "JPA Initializing beginTx read(={0}) and isActiveTx={1}", new Object[]{key, emTx.isActive()});
        
        try {
            
            o = (T) super.read(key);
            
            emTx.commit();
            
            logger.log(Level.INFO, "JPA Initializing commitTx(={0})", new Object[]{key});


        } catch (EntityNotFoundException ex) {

            emTx.rollback();
            
            logger.log(Level.INFO, "JPA Initializing rollbackTx(={0})", new Object[]{emTx.getClass()});

        }   //finally {

            //emTx.commit(); //useful for distributedTx implementing TwoPhaseCommit
            
            //logger.log(Level.INFO, "JPA Initializing commitTx(={0})", new Object[]{key});
        //}

        return o;

    }

}
