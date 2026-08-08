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
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;

/**
 *
 * @author shifu
 */
public class UserDAOImpl extends EntityDAOImpl<UserEntity, Long> implements UserDAO {

    private ProfileDAO profileDAO;

    public UserDAOImpl() throws ClassNotFoundException, SQLException {

        super("user_authenticator", UserEntity.class);

        this.profileDAO = new ProfileDAOImpl();

    }

    @Override
    public UserEntity readUserEntity(final String username) throws SQLException, ClassNotFoundException {
        
        //prepare the set of list to get only one
        final ResultSet rSet  = (ResultSet) super.read(username, "account = ?");
        
        //habilita e pega no proximo elemento do cursor
        rSet.next();
        
        ProfileDAO profileDao = new ProfileDAOImpl();

        //try {
        //invocar o resultset generico
       
        String name = rSet.getString("name");
        String credential = rSet.getString("credential");
        char active = rSet.getString("active").charAt(0);

        UserEntity user = new UserEntity(rSet.getLong("id"), (active == '1' ? true : false)); // (active == '1')
            user.setName(name);
            user.setCredential(credential);

        //instanciar o object profile
        //for1
        ResultSet rSet2  = profileDAO.list("");
             
        /*while (true) { //rSet2.next()
            //user.setProfileEntity(profileEntity); 

            //for2 TODO: Fix the relation bug.

            String profileCode = "";//rSet2.getString("profile_code");
            //
            ProfileEntity profileEntity = profileDao.readProfileEntity(profileCode);
            
            /**
             * TODO:
             * Compare the profile with the user.profile object
             */
            //user.getProfiles().add(profileEntity);
        
    /* }*/
                        
        //then call by id
        return user;
           
    }
    
    @Override
    public UserEntity readUserEntity(Long id) throws SQLException, ClassNotFoundException {

        final ResultSet rSet = (ResultSet) super.read(id);

        ProfileDAO profileDao = null;

        //habilita e pega no proximo elemento do cursor
        rSet.next();
        
        //try {
        //invocar o resultset generico
       
        String name = rSet.getString("name");
        String credential = rSet.getString("credential");
        char active = rSet.getString("active").charAt(0);

        //return object profile
        String profileCode = rSet.getString("profile_code");

        //invocar o dao do profile
        profileDao = new ProfileDAOImpl();
        ProfileEntity profileEntity = profileDao.readProfileEntity(profileCode);

        //instanciar o object
        final UserEntity user = new UserEntity(id, (active == '1' ? true : false)); // (active == '1')
        user.setName(name);
        user.setCredential(credential);
        //user.setProfileEntity(profileEntity); 
        
        //ProfileEntity pE = rSet.getObject("profile_code", ProfileEntity.class);
        user.getProfiles().add(profileEntity);
        
        //}
        return user;

    }
    
    @Override
    public void create(final UserEntity o) throws SQLException {

        super.create(o, "?,?,?");
    }
    
    

    @Override
    protected <String> void addParameter(String o) {

        int i = 0;

        try {

            this.preparedStmt.setObject(++i, o);
            //....
            
            //execute
            //this.preparedStmt.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    

}
