/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.configuration;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.UserAuthenticationEndpoint;
import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.ApplicationPath;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.AuthenticationEndpoint;

/**
 *
 * @author shifu
 */
@ApplicationPath(EndpointDispatcherConfiguration.ROOT_PATH)
public class EndpointDispatcherConfiguration  extends javax.ws.rs.core.Application {
    
    public static final String ROOT_PATH ="/api";
    public static final String HOSTNAME ="http://localhost:8080";
    
    private Set<Class<?>> endpoints = new HashSet<>();

    /**
     *  TODO: add endpoints dynamically. Just once at load.
     *  use spring/beans
     *  
     *  @return 
     */
    @Override
    public Set<Class<?>> getClasses() {
        
        this.endpoints.add(AuthenticationEndpoint.class);
        this.endpoints.add(UserAuthenticationEndpoint.class);
        
        return this.endpoints;
    }  
    
}