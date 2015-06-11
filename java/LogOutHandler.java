package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class LogOutHandler extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
        try{
            String url="index.jsp";
            request.getSession().invalidate();
            
          RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
          dispatcher.forward(request, response);
           }catch(Exception e){
			e.printStackTrace();
		}
	}
}
	
	