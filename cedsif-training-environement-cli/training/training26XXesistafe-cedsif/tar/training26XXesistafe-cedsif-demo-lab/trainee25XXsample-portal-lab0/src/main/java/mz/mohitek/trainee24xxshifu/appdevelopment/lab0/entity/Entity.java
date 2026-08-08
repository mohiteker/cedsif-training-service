/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity;

import java.io.Serializable;
/**
 *
 * @author shifu
 */
public abstract class Entity<PK extends Serializable> implements Serializable {
    
    protected PK pk;
    
    public Entity(){
    }

    public Entity(final PK pk){
        this.pk = pk;
    }
    
    
}
