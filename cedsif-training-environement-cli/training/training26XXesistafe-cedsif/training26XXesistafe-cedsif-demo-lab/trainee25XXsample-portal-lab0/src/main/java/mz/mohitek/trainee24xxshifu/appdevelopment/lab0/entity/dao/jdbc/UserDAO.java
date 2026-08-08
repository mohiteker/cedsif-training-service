/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc;

import java.sql.SQLException;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;

/**
 *
 * @author shifu
 */
public interface UserDAO extends EntityDAO<UserEntity,Long> {
    
    /*
    C-reate
    0-read
    U-update
    D-elete
    */ 
    
    public UserEntity readUserEntity(Long id) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @param code
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public UserEntity readUserEntity(String code) throws SQLException, ClassNotFoundException;
}