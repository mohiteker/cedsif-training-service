/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0;

import java.sql.SQLException;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;

/**
 *
 * @author shifu
 */
public class Main {
     
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        
        System.out.println("Lab0-Bem vindo ao Lab0 de Treinamento de Desenvolvimento de Aplicacoes 1a. Edicao 2024 - IISemestre.");
        
        //Testando a busca de um user
        UserDAO userDao = new UserDAOImpl();
        
        //invoque o metodo de busca que deseja
        //userDao.list("account = ".concat("trainee24xxshifu"));
        
        UserEntity user1 = userDao.readUserEntity(1L);
        System.out.println(user1);
        
        UserEntity user2 = userDao.readUserEntity("trainee24xxshifu");
        System.out.println(user2);
        
        
    
    }
}
