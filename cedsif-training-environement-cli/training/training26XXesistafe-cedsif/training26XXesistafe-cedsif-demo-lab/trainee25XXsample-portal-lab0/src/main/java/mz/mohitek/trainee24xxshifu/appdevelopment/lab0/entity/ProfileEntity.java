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
public class ProfileEntity extends Entity<String> implements Serializable{
   
    private Long id;
    private String description;
    private String code;

    public ProfileEntity(final String code, final boolean active) {
        super(code);
    }

    
    //paradgima de encapsulamento
    public String getDescription() {
        return description;
    }

    public Long getId() {
        return id;
    }
    
    

    
  

    
    

    
    
    
    


    
    
    
    
    
    
    
   
}
