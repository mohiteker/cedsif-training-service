/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author shifu
 */
public class UserEntity  extends Entity<Long> implements Serializable {
    
    private Long id;
    private String name;
    private String account;
    private String credential;
    private char active;
    
    private List<ProfileEntity> profiles = new ArrayList<>();
    
    
    public UserEntity(Long id, boolean active) {
        super(id);
    }

    public void setProfiles(List<ProfileEntity> profiles) {
        this.profiles = profiles;
    }

    public List<ProfileEntity> getProfiles() {
        return profiles;
    }
    
    public String getName() {
        return name;
    }

    public String getCredential() {
        return credential;
    }


    public void setName(String name) {
        this.name = name;
    }

    public void setCredential(String credential) {
        this.credential = credential;
    }

    public String getAccount() {
        return account;
    }
}
