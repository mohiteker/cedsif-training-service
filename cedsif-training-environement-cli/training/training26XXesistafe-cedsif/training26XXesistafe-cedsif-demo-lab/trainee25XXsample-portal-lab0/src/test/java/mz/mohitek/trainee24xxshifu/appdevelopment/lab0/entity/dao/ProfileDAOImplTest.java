package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.ProfileDAOImpl;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * 
 * @author shifu
 *
 */
public class ProfileDAOImplTest {

	private Connection connection;
        
	//@Before
	public void setUp() throws Exception {
 
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        //redir --laddr=192.168.122.1 --lport=3305 --caddr=172.18.0.1 --cport=3305
        //redir --laddr=192.168.122.1 --lport=3305 --caddr=10.10.11.1 --cport=3305
        //https://askubuntu.com/questions/104400/how-to-put-all-traffic-and-on-one-interface-and-some-traffic-on-another-interfac
        //http://www.linuxhorizon.ro/iproute2.html
        
            this.connection =  DriverManager.getConnection("jdbc:mysql://mysqldbshared-db-service:3305/trainee24xxshifu_db_grupo_x", 
        		"trainee24xxshifu", 
        		"da");
	} 
        
        
	//@Test
        public void testReadProfileByCode() throws ClassNotFoundException, SQLException{
            
            //
            new ProfileDAOImpl()
                    .readProfileEntity("trainee");
            
                 
        }
        
        @After
        public void onClose() throws SQLException{
        
            //
            this.connection.close();
        
        }

}
