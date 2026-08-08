/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr340a.filter;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;

/**
 *
 * @author shifu
 */
public abstract class EndpointFilterConfiguration implements Filter {

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void destroy() {
       
    }
    
    
    
}
