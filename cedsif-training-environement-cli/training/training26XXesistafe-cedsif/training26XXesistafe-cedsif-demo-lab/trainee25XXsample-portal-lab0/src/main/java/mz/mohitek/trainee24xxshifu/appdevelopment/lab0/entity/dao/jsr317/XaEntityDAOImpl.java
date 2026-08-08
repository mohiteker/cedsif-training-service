/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317;

import java.io.Serializable;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.Entity;

/**
 *
 * @author shifu
 * 
 * Xa - Distributed DAO
 * 
 * @param <T>
 * @param <PK>
 */
public abstract class XaEntityDAOImpl<T extends Entity, PK extends Serializable>
                    extends TxEntityDAOImpl<T, PK>{
    
    public XaEntityDAOImpl(final Class<T> tClazz) {
        super(tClazz);
    }
    
}