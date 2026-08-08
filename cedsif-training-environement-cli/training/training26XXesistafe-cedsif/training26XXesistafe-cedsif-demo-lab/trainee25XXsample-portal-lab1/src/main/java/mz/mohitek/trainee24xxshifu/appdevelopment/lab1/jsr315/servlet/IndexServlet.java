/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab1.jsr315.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shifu
 */
@WebServlet(urlPatterns = IndexServlet.URL_PATTERN, name = IndexServlet.NAME)
public class IndexServlet extends HttpServlet {
    
    public final static String NAME = "IndexServlet";
    
    public final static String URL_PATTERN= "/Index";
    
    private java.util.logging.Logger log = 
            java.util.logging.Logger.getLogger(IndexServlet.NAME);

    @Override
    public void init() throws ServletException {
        
        log.info("trainee24xxshifu - Iniciando o Servlet Index");
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //1. envia o parametro (Login) ou parametros iniciais da aplicacao
        req.setAttribute("login"   , "Login");
        req.setAttribute("loginUrl", "/trainee24xxshifu-lab1/Login");
        
        //2. redicionar o pedido do cliente para a pagina index.jsp
             // contendo o valor dinamico do estado do usuario (Login|Logout).
        final RequestDispatcher dispacher =
                getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp");
        
        //3. realiza o encaminha da pagina para o client (browser)
        dispacher.forward(req, resp);
    }
    
    
}
