/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr315.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.UserEntity;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAO;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;



/**
 *
 * @author shifu
 * 
 * Esta classe recebe as solicitacoes (pedidos) de 
 * usuario ao digitar a url http://localhost:8080/trainee24xxshifu-lab1/
 * e selecionar o link do LOGIN (login.jsp) e clicar no botao Ok.
 * 
 */
@WebServlet(urlPatterns = LoginServlet.URL_PATTERN, name = LoginServlet.NAME)
public class LoginServlet extends javax.servlet.http.HttpServlet implements Login {
    
    public final static String NAME = "LoginServlet";
    
    public final static Map<String,String> MENU_MAP = new HashMap<String, String>(){
    	
    };
    
    public final static String URL_PATTERN= "/Login";
    
    private java.util.logging.Logger log = 
            java.util.logging.Logger.getLogger(LoginServlet.NAME);

    @Override
    public void init() throws ServletException {
        
        log.info("trainee24xxshifu - Iniciando o Servlet Login");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        //
        final RequestDispatcher dispacher =
                getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        
        //3. realiza o foward da pagina
        dispacher.forward(req, resp);
    }

    
    
    @Override
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
       
       //0. criar um objecto que armazena as informacoes do contexto do servlet
       final ServletContext context = this.getServletContext();
       
       //1.  receber o parametro login-username
       final String loginUsername = req.getParameter("login-username");
       
       //2.  rebecer o parametro login-password
       final String loginPassword = req.getParameter("login-password");
       
       //3.  validar os parametros e retornar o objecto (UserAuthentication)
       final UserEntity userAuth = this.validateUserAthentication(loginUsername, loginPassword);
         
       //4.  redirecionar o pedido para a pagina success.jsp or fail.jsp
                //se success.jsp - na tela deve aparecer a mensagem "Usuario NNNNN com perfil PPPPP autenticado e autorizado com sucesso."
                //se fail.jsp    - na tela deve aparecer a mensagem "Usuario XXXX nao foi encontrado. Verificado a sua Senha ou o seu Nome de utilizador"
    
       try {
    	   
    	   //set logout instructions
    	   req.setAttribute("login", "Logout");
    	   req.setAttribute("loginUrl", "Index");
    	   
    	   //set menu by user profile
    	   java.util.List<String> menuList = new ArrayList<>();
    	   Map<String, String> menuMap =  new HashMap<String,String>();
    	   
    	   //preencher a lista
    	   menuList.add("About");
    	   menuList.add("Services");
    	   menuList.add("Contacts");
    	   menuList.add("My Trainings");
    	   
    	   //if it a map
    	   menuMap.put("About"			, "/trainee24xxshifu/about");
    	   menuMap.put("Services"		, "/trainee24xxshifu/service");
    	   menuMap.put("Contacts"		, "/trainee24xxshifu/contacts");
    	   menuMap.put("My Trainings"	, "/trainee24xxshifu/myTrainings");
    	   
    	   //enviar a list de menus para a tela
    	   req.setAttribute("menuMap", menuMap);
    	   
    	   //
    	   final RequestDispatcher dispacher = getServletContext()
    			   .getRequestDispatcher("/Index");
    	   
    	   //routing
    	   resp.sendRedirect("Index?sessionId="+req.getSession().getId());
    	   //dispacher.forward(req, resp);
    	   
       	} catch (NullPointerException e) {
       		// TODO: handle exception
       	}
    
    }

    @Override
    public UserEntity validateUserAthentication(final String username, 
            final String password)  {
    	
        UserEntity user=  null;
        
        try {
            //preparar uma instancia do dao
            final UserDAO userDao = new UserDAOImpl();
            //get user from database
            user = userDao.readUserEntity(username);
            
            
            
        } catch (ClassNotFoundException | SQLException ex) {
            
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        
        }
        
    	return user;
   }
    
    
    
    @Override
    public void destroy() {
       
        log.info("trainee24xxshifu - Removendo o Servlet Login do Garbadge Collector do JVM (GC)");
    }

    
 
    
}
