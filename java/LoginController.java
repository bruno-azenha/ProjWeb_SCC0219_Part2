package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class LoginController extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response){
	 
		try{

			HttpSession session = request.getSession();
			String url="error.jsp";
			if(session.getAttribute("counter")==null){
				session.setAttribute("counter", new Integer(0));
			}
			Integer loginCounter= (Integer) session.getAttribute("counter");

			ArrayList<User> userList = (ArrayList) session.getAttribute("userList");
			for(User c : userList){
				if(request.getParameter("email").equals(c.getEmail())){
					if(request.getParameter("password").equals(c.getPassword())){
						session.setAttribute("user",c);
						loginCounter= loginCounter -1;
						if( c.getIsSuper()){
							url= "admin.jsp";
						}else
							url= "user.jsp";
						break;
					}
				}
			}

			loginCounter= loginCounter +1;
			session.setAttribute("counter",loginCounter);
			if(loginCounter == 6) url = "error2.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}