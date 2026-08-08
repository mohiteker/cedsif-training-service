package mz.mohitek.trainee24xxshifu.appdevelopment.t1.jsr311.endpoint;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.ProfileDAO;

@Path(ProfileEndpoint.RESOURCE_NAME)
public class ProfileEndpoint {

    public static final String RESOURCE_NAME = "/profile";
    
    private ProfileDAO profileDAO;
    private java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName());


    @Path("/list")
    @GET
    public Response listProfile(){

        final Response respo = Response.ok(profileDAO.list(), MediaType.APPLICATION_JSON)
                .build();
        
        return respo;
}

}
