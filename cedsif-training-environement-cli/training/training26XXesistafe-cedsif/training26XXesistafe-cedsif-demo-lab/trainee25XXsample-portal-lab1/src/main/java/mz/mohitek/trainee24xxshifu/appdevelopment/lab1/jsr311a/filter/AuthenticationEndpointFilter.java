/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.filter;

import java.io.IOException;
import java.util.logging.Level;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.ext.Provider;
import static mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.AuthenticationEndpoint.RESOURCE_NAME;
import static mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.configuration.EndpointDispatcherConfiguration.HOSTNAME;

/**
 *
 * @author shifu
 */
@Provider
public class AuthenticationEndpointFilter implements ContainerResponseFilter {

    private final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(this.getClass().getName()); 

    public AuthenticationEndpointFilter() {
        
        logger.log(Level.SEVERE, "moHitekframework v1.0.0 - [{0}]",
                new Object[]{this.getClass().getName()});
    }
    
    
    @Override
    public void filter(final ContainerRequestContext requestContext, final ContainerResponseContext responseContext) throws IOException {
        
        requestContext.getUriInfo().getRequestUri().getPath();
    }
    
}
