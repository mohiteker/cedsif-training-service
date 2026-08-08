package mz.mohitek.trainee24xxshifu.appdevelopment.t1.jsr311.endpoint;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;


@ApplicationPath(ProfileEndpointConfiguration.ROOT_PATH)
public class ProfileEndpointConfiguration extends Application {

    public static final String ROOT_PATH ="/api-v2/";
    public static final String HOSTNAME ="http://localhost:8080";
    
    private Set<Class<?>> endpoints = new HashSet<>();

    @Override
    public Set<Class<?>> getClasses() {
        
        this.endpoints.add(ProfileEndpoint.class);

        return this.endpoints;
    }

}
