package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.configuration;

import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;

@Path(UserAuthenticationEndpoint.RESOURCE_NAME)
public class UserAuthenticationEndpoint {

    public final static String RESOURCE_NAME="/user";

    private final UserDAO userDAO;
    private java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName());

    UserAuthenticationEndpoint() throws ClassNotFoundException, SQLException{

        this.userDAO = new UserDAOImpl();
    }


    @Path("/findUser/{username}/{password}")
    @GET
    public Response readUser(@PathParam("username") final String username, @PathParam("password")final String password){

        //identidificar o usario na base de dados
        UserEntity userEntity=null;
        try {

            userEntity = this.userDAO.readUserEntity(username);
        
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return Response.ok(userEntity)
                        .header("content-type", MediaType.APPLICATION_JSON)
                        .header("X-Token", "xxxxxxx")
                        .build();
    }

}
