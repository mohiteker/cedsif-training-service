package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.dao.jdbc.UserDAOImpl;
import org.junit.After;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
//848613836 - Luisa Antono
/**
 * 
 * @author shifu
 *
 */
@RunWith(JUnit4.class)
public class UserDAOImplTest {

        private Connection connection;
        
	@Before
	public void setUp() throws Exception {
            
            	
		//new UserDAOImpl();
		//carga do driver
		
		/**
		 *  Note:
		 *  
		 *  /opt/netbeans-8.2/ide/modules/ext/postgresql-9.4.1209.jar
		 *  must be loaded over netbeans to allow hostname parameter visibility.
		 */
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        //redir --laddr=192.168.122.1 --lport=3305 --caddr=172.18.0.1 --cport=3305
        //redir --laddr=192.168.122.1 --lport=3305 --caddr=10.10.11.1 --cport=3305
        //https://askubuntu.com/questions/104400/how-to-put-all-traffic-and-on-one-interface-and-some-traffic-on-another-interfac
        //http://www.linuxhorizon.ro/iproute2.html
        
            this.connection =  DriverManager.getConnection("jdbc:mysql://mysqldbshared-db-service:3305/trainee24xxshifu_db_grupo_x", 
        		"trainee24xxshifu", 
        		"da");
	} 
        
        @Test
        public void testReadUserEntityById() throws ClassNotFoundException, SQLException{
            //
            new UserDAOImpl()
                    .read(1L);
                 
        }
        
        @Test
        public void testReadUserByAccount() throws ClassNotFoundException, SQLException{
            
            //
            new UserDAOImpl()
                    .readUserEntity("trainee24xxshifu");
            
                 
        }

	@Test
	public void testConnectionWithDBWhenUserIsShifuAndPasswordShifu() throws ClassNotFoundException, SQLException {
	
	}
        
        
        
        @After
        public void onClose() throws SQLException{
        
            //
            this.connection.close();
        
        }

}
