/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.ProfileEntity;

/**
 *
 * @author shifu
 */
public class ProfileDAOImpl extends EntityDAOImpl<ProfileEntity, String> implements ProfileDAO{

    public ProfileDAOImpl() throws SQLException, ClassNotFoundException {
        super("profile", ProfileEntity.class);
    }

    @Override
    public ProfileEntity readProfileEntity(final String code) throws SQLException {
        
        //find the profile
        final ResultSet rSet = super.read(code, "CODE = ?"); 
        
        //habilita a chamada para o curor.
        rSet.next();
        
        ///than
        return (new ProfileEntity(rSet.getString("code"), true));
                                  //true)); //only active object
    }
    
    @Override
    public void create(final ProfileEntity o) {
        
        try {
            
            super.create(o, "(?,?,?,?)"); //To change body of generated methods, choose Tools | Templates.
        
        } catch (SQLException ex) {
            Logger.getLogger(ProfileDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected <String> void addParameter(final String o) {
        
        int i = 0;

        try {
            
            //this.preparedStmt.setLong(++i, o.getId());
            this.preparedStmt.setObject(++i, o);
            //....
            
            //execute
            //this.preparedStmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ResultSet list() {
        
        ResultSet rSet = null;

        try {
        
            //list all
            rSet = super.list("");
        
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return rSet;
    }
    
    


    
    
    
    


    
    

}
