package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class UserServlet extends HttpServlet {

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
           	if(session.getAttribute("userList")==null){
				session.setAttribute("userList",new ArrayList<User>());
				ArrayList userList = (ArrayList) session.getAttribute("userList");
				User user = new User();
				user.setName("David Ross");
				user.setEmail("dross@gmail.com");
				user.setPassword("123456");
				userList.add(user);
				
				User admin = new User();
				admin.setName("Michael Jackson");
				admin.setEmail("adminmj@gmail.com");
				admin.setPassword("adminadmin");
				admin.setIsSuper(true);
				userList.add(admin);
				/* atualiza lista na sessao */
				session.setAttribute("userList",userList);
		}
			Integer loginCounter= (Integer) session.getAttribute("counter");
            
            if(loginCounter >= 5){
                long lastAccessedTime = session.getLastAccessedTime();
                Date date = new Date();
                long currentTime = date.getTime();
                long timeDiff = currentTime - lastAccessedTime;
                // 20 minutes in milliseconds  
                if (timeDiff >= 1200000)
                {
                    //invalidate user session, so they can try again
                    loginCounter =0;
                }else{
                    url = "error2.jsp";
                }
            }

            if(loginCounter < 5){
                ArrayList<User> userList = (ArrayList) session.getAttribute("userList");
			    for(User c : userList){
				    if(request.getParameter("email").equals(c.getEmail())){
					   if(request.getParameter("password").equals(c.getPassword())){
						  session.setAttribute("user",c);
						  
                           if( c.getIsSuper()){
							 url= "admin.jsp";
						  }else
							 url= "user.jsp";
						  break;
					}
				}
            }
            }

			loginCounter= loginCounter +1;
			session.setAttribute("counter",loginCounter);
            RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}