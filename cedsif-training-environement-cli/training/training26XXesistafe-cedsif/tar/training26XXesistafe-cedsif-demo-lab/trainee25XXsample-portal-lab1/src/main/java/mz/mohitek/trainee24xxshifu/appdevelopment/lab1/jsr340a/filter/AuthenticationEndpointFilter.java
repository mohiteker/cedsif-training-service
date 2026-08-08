/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr340a.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr311a.endpoint.configuration.EndpointDispatcherConfiguration;

/**
 *
 * @author shifu
 */
@WebFilter(urlPatterns = EndpointDispatcherConfiguration.ROOT_PATH)
public class AuthenticationEndpointFilter extends EndpointFilterConfiguration{


    @Override
    public void doFilter(final ServletRequest request, 
            final ServletResponse response, 
            final FilterChain chain) throws IOException, ServletException {
        
                request.getRequestDispatcher("/api/auth/");
        
    }
    
}
