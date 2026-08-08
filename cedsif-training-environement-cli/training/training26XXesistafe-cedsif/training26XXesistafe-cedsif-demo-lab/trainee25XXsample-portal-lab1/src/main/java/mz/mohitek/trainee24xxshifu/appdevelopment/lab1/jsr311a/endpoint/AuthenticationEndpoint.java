/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311.endpoint.auth.AuthenticationType;
import java.sql.SQLException;
import java.util.Base64;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;
import static mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.configuration.EndpointDispatcherConfiguration.*;

/**
 *
 * @author shifu
 */
@Path(AuthenticationEndpoint.RESOURCE_NAME)
public class AuthenticationEndpoint implements AuthenticationType {

    public static final String RESOURCE_NAME = "/oauth";
    
    private final UserDAO userDAO;
    private java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName());


    public AuthenticationEndpoint() throws ClassNotFoundException, SQLException {
        
        this.userDAO = new UserDAOImpl();
        
        //adding resource info
        logger.log(Level.SEVERE, "moHitekframework v1.0.0 - Binding URL=[{0}] into Path=[{1}].",
                new Object[]{HOSTNAME, RESOURCE_NAME});
    }

    @Path("/token/{username}")
    @GET
    @Override
    public Response token(@PathParam("username") final String username) {
            
        /**
         * Filter only roles from a specific profile.
         */
        
        UserEntity user = null;
        
        //1.buscar o objecto apartir do username
        try {

            user = userDAO.readUserEntity(username);
            
        } catch (SQLException | ClassNotFoundException ex) {
            
            Logger.getLogger(AuthenticationEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        //1.1 get Profiles
        final String xProfiles = "";
        
        //1.2 get Roles
        final String xRoles = "";
        
        //2.generateToken
        final JwtBuilder jwtBuilder = Jwts.builder()
                .header()
                    .add("X-Profiles"   , "admin,user") //get all profiles
                    .add("X-Roles"      , "admin") //pattern [C]reate[R]ead[U]pdate[D]elete_admin
                        .and() //back to builder
                    .subject(user.getName())
                    .expiration(null)
                    .issuer(username)
                    .encodePayload(true);
        //
        final String generatedToken = jwtBuilder.compact();
        
        return Response.ok(generatedToken)
                .header("Content-Type" , MediaType.TEXT_PLAIN)//x-www-form-urlencoded")
                .header("X-TRAINEE25XXDEMOYYY-TOKEN", generatedToken)
                    .build();
    }
       
    
    @Path("/basicAuth/{username}/{password}")
    @GET
    @Override
    public Response basicAuth(@PathParam("username") final String username, @PathParam("password") final String password) {

        UserEntity user = null;
        //buscar o objecto apartir do username
        try {

            user = userDAO.readUserEntity(username);

            //authentication phase
            if(user !=null && password.equals(user.getCredential())){
            
                //authorization phase
                //https://datatracker.ietf.org/doc/html/rfc6749
           
                //set information Store.
                final NewCookie newCk = new NewCookie(new Cookie("session_id", UUID.randomUUID().toString()),null,
                                                10,
                                                null,
                                                false,false);
                
                return Response.ok("Access Granted to user ".concat(user.getName()))
                            .header("Authentication", "Basic")
                            .header("Content-Type" , MediaType.TEXT_PLAIN)
                            .cookie(newCk)
                                .build();
            }

        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
       //authentication failure.
        return Response.status(Status.FORBIDDEN)
                    .build();
    }
    
}
