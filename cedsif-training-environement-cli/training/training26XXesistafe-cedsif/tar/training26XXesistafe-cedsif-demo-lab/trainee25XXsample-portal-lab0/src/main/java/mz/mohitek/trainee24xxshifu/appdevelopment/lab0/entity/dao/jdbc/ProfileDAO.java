/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.ProfileEntity;

/**
 *
 * @author shifu
 */
public interface ProfileDAO extends EntityDAO<ProfileEntity,String> {
   
    /**
     * 
     * @param code
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public ProfileEntity readProfileEntity(String code) throws SQLException, ClassNotFoundException;
    /**
     * 
     * @return 
     */
    public ResultSet list();
    
}
