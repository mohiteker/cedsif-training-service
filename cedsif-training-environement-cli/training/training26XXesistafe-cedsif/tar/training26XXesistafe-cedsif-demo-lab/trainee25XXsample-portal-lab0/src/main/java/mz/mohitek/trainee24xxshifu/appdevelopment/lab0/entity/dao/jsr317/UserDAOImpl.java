/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.jsr317.UserEntity;
/**
 *
 * @author shifu
 * 
 */
public class UserDAOImpl extends EntityDAOImpl<UserEntity, Integer> {

    public UserDAOImpl() {
        
        super(UserEntity.class, "trainee24xxshifu-PU");
    }

}
