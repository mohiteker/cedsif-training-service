/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author shifu
 */
public abstract class  EntityDAOImpl<T extends Serializable,PK extends Serializable> implements EntityDAO<T,PK> {
    
    //connection props
    private Connection connection;
    protected PreparedStatement preparedStmt;
    
    //shared variable
    protected String[] fieldNames = new String[] {"ID"}; //default
    protected String   parameters;
    
    
    //runtime class
    private Class<T> clazz;
    private String tablename;
    
    private T o;
    
    public static class JSR_221{
    }
    
    public static class JSR_315{
    }
    
    
    //values (?,?,?,?)
    public EntityDAOImpl(final String tablename, final Class<T> clazz) 
            throws ClassNotFoundException, SQLException {
      
        this.clazz =clazz;
        this.tablename = tablename;
        
        //carga do driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        this.connection = DriverManager.
        getConnection("jdbc:mysql://mysqldbshared-db-service:3305/trainee24xxshifu_db_grupo_x",
                "trainee24xxshifu", 
                "da");
        
        //criacao da conexao
        /*this.connection = DriverManager
                .getConnection("jdbc:mysql://".concat(HOST_IP)
                    .concat(":")
                    .concat(DATABASE_PORT)
                    .concat(USERNAME)
                    .concat(DATABASE)
                        , USERNAME, PASSWORD);*/
        
        
    }
    
    public EntityDAOImpl() throws SQLException {
        
        this.clazz=null;
        /**
         * Mapear os acessos da base de dados
         * atraves do Driver Conector.
         * 
         */
        this.connection = DriverManager.getConnection("jdbc:mysql://mysqldbshared-db-service:3305/trainee24xxshifu_db_grupo_x",
                "trainee24xxshifu", 
                "da");
    }

    @Override
    public ResultSet list(final String clauses) throws SQLException {
        
         //select an objectID
        final String query = Query.SELECT_QUERY.concat(this.tablename)
                //.concat(" WHERE ").concat(clauses) //add clause
                .concat(";");
        
        //
        ResultSet rSet =null;
 
        //after connection prepare a stament
        this.preparedStmt = connection.prepareStatement(query,fieldNames);
            
        //get the ResultSet
        rSet = this.preparedStmt.executeQuery();
            
            
        return rSet;
    }
    

    //
    @Override
    public ResultSet read(final PK id) throws SQLException {
        
        //select an objectID
        final String query = Query.SELECT_QUERY.concat(this.tablename)
                .concat(" WHERE ID = ? ") //add clause
                .concat(";");
        
        //
        ResultSet rSet =null;
                 
        //after connection prepare a stament
        this.preparedStmt = connection.prepareStatement(query,fieldNames);
        
        
        //add parameter dinamically by reflection
        this.<PK>addParameter(id);
        
        //get the ResultSet
        rSet = this.preparedStmt.executeQuery();
             
        return rSet;
    }

    
    @Override
    public ResultSet read(final String value, final String clauses) throws SQLException {
        
        //select an objectID
        final String query = Query.SELECT_QUERY.concat(this.tablename)
                .concat(" WHERE ").concat(clauses) //add clause
                .concat(";");
        
        //after connection prepare a stament
        this.preparedStmt = connection.prepareStatement(query,fieldNames);
        
        //add parameter dinamically by reflection
        this.<String>addParameter(value);
        
        //get the ResultSet
        return (this.preparedStmt.executeQuery());

    }
    
    
    
    
    @Override
    public void create(final T o, final String parameters) throws SQLException {
    
        //insert object into DB
        Query.INSERT_QUERY.concat(o.getClass().getSimpleName().replace("Entity", "")
                .toLowerCase())
                .concat(" ")
                .concat("values ("+parameters+")")  //a string of interogations (???,...)
                .concat(";");// )
        
        //criar um/a objecto/tupla na base
        this.preparedStmt = this.connection.prepareStatement(Query.INSERT_QUERY);
        
        
        //adiciona os dados
        this.addParameter(o);
        
    }

    
     /**
     * Force
     * Adiciona dinamicamente os campos
     */
    protected abstract <T> void addParameter(T o);
    /**
     * 
     * @param <T>
     * @param o 
     */
    //protected abstract <T> void addParameter(T ...o);

    /**
     * Force
     * Adiciona dinamicamente os campos
     * @param o 
     */
    //protected abstract void addParameter(T o);
    
    

    @Override
    public void update(T newO, T oldO) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(PK id, T o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
         /*
        int i = 0;
        //transform parameter
        String[] transformedParameter = parameters.split(",");
        for(String eachSymbol : transformedParameter){
            
            this.preparedStmt.setObject(++i, eachSymbol);
        }*/
     
}
