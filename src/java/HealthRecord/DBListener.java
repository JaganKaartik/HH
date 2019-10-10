/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;

/**
 *
 * @author jagankaartik58
 */
import javax.servlet.*; 
import java.sql.*; 


public class DBListener implements ServletContextListener 
{
    public void contextInitialized(ServletContextEvent event) 
    {            
		try{  
				
				Class.forName("org.postgresql.Driver");
				String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
	            String db_username = "postgres";
            	Connection con = DriverManager.getConnection(db_url,db_username,"qpalzmwer");  

				//storing connection object as an attribute in ServletContext  
				ServletContext ctx=event.getServletContext();  
				ctx.setAttribute("mycon", con);  
			}catch(Exception e)
			{e.printStackTrace();}  
	}  
	  
	public void contextDestroyed(ServletContextEvent arg0){}  
}