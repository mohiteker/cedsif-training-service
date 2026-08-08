package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint;

import java.sql.SQLException;
import java.util.Base64;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.ProfileDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.ProfileDAOImpl;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;

@Path(UserAuthenticationEndpoint.RESOURCE_NAME)
public class UserAuthenticationEndpoint {

    public final static String RESOURCE_NAME = "/user";

    private final UserDAO userDAO;
    
    private final ProfileDAO profileDAO;
    
    private java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName());

    /*
    HTTP Status 500 - A MultiException has 1 exceptions.
     */
    public UserAuthenticationEndpoint() throws ClassNotFoundException, SQLException {

        this.userDAO = new UserDAOImpl();
        
        this.profileDAO = new ProfileDAOImpl();
    }

    @Path("/findUser/{username}")
    @GET
    public Response readUser(@PathParam("username") final String username ) {

        //identidificar o usario na base de dados
        UserEntity userEntity = null;

        
        try {

            userEntity = this.userDAO.readUserEntity(username);
            
            //set profile
            //userEntity.getProfiles().add(this.profileDAO.list(username));
            
             //1.definir o formato
            String token64 = username.concat(":").concat(userEntity.getCredential());
            
             //2.converte o formato Bearer para a base64
            token64 = Base64.getEncoder().encodeToString(token64.getBytes());
            
            return Response.ok(userEntity)
                .header("Content-Type", MediaType.APPLICATION_JSON)
                .header("Authorization", "Bearer ".concat(token64))
                .header("X-Token", token64)
                    .build();

        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return Response.status(Status.UNAUTHORIZED)
                .build();
    }

}
