/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr315.servlet;

/**
 *
 * @author shifu
 */
public interface Login {

    /**
     * Este contracto deve retornar o objeto de uma
     * UserEntity que corresponde as credencias enviadas pela tela.
     * 
     * HW.
     * 
     * @param username
     * @param password
     * @return 
     */
    Object validateUserAthentication(final String username, final String password);

}
