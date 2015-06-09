package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class SignUpController extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response){

		try{
				
		HttpSession session = request.getSession();
		String url="index.html";
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
		dispatcher.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}