/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311.endpoint.*;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317.EntityDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jsr317.UserDAOImpl;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.jsr317.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311.endpoint.dto.UserDTO;

/**
 *
 * @author shifu
 */
//@Path(UserEndpoint.RESOURCE_NAME)
public class UserEndpoint implements Endpoint<UserDTO,Integer> {

    public static final String RESOURCE_NAME = "/user";
    
    private final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName()); 
    
    //instance
    private final EntityDAO<UserEntity,Integer> dao= new UserDAOImpl();
    
   
    @Path("/read/{id}")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Override
    public UserDTO read(@PathParam("id") final Integer id) {
        
        return ((UserDTO) new UserDTO(dao.read(id)));
    }


}
