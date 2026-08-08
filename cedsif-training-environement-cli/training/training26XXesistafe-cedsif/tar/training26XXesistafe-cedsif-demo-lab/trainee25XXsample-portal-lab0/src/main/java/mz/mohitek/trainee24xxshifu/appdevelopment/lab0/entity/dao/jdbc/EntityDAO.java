/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author shifu
 */
interface EntityDAO<T extends Serializable,PK extends Serializable> {
    
    //props
    /*
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_i";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_ii";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_iii";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_iv";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_v";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_vi";
    private static final String DATABASE       = "training24XXappdevelopment_db_grupo_x";
    */
    static final String DATABASE       = "trainee24xxshifu_db_grupo_x";
    static final String DATABASE_PORT  = "3305";
    static final String USERNAME       = "trainee24xxshifu";
    static final String PASSWORD       = "da";
    /**
     *  This host must be configured in the cloud
     *  with the "openTraining.net" | "training.net"
     */
    static final String HOST_IP        = "mysqldbshared-db-service/";
    
    /**
     * 
     * Intermediate class
     * @author Shifu
     *
     */
    interface Query {
    	
        //queries
        static String INSERT_QUERY = "INSERT  INTO ";
        
        static String SELECT_QUERY = "SELECT  *  FROM  ";
    }
    /*
    C-reate
    R-read
    U-update
    D-elete
    */
    
    /**
     * 
     * @param o
     * @throws SQLException 
     */
    public abstract void create(final T o) throws SQLException;
    /**
     * 
     * @param id
     * @return 
     */
    //public abstract  T read(final PK id);
    /**
     * 
     * @param o
     * @param parameters
     * @throws SQLException 
     */
    public void create(final T o, final String parameters) throws SQLException;
    /**
     * 
     * @param id
     * @return 
     */
    public abstract  ResultSet read(final PK id) throws SQLException;
    /**
     * 
     * @param id
     * @return 
     */
    public abstract ResultSet read(final String id, final String clauses) throws SQLException;
    /**
     * list a set of objects
     * @param clauses
     * @return 
     */
    public abstract  ResultSet list(final String clauses) throws SQLException;
    /**
     * 
     * @param newO
     * @param oldO 
     */
    public abstract void update(final T newO, final T oldO);
    /**
     * 
     * @param newO
     * @param oldO 
     */
    public abstract boolean delete(final PK id, final T o);
    
}
