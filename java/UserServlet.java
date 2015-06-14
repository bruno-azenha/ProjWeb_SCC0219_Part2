package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class UserServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		
		// Redireciona para opções corretas de Login e Logout
		if (request.getParameter("action").equals("login")){
			userLogin(request, response);	
		}
		else if (request.getParameter("action").equals("logout")){
			userLogout(request, response);
		}
		
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		
		if (request.getParameter("action").equals("add")){
			userSignUp(request, response);
		}
		else if(request.getParameter("action").equals("remove")){
			userRemove(request, response);
		}
	}

	private void userLogin (HttpServletRequest request, HttpServletResponse response){
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
			
			if(loginCounter >= 3){
				long lastAccessedTime = session.getLastAccessedTime();
				Date date = new Date();
				long currentTime = date.getTime();
				long timeDiff = currentTime - lastAccessedTime;
				// 20 minutes in milliseconds  
				if (timeDiff >= 3600000)
				{
					//invalidate user session, so they can try again
					loginCounter =0;
				}
			}

			if(loginCounter < 3){
				ArrayList<User> userList = (ArrayList) session.getAttribute("userList");
				for(User c : userList){
					if(request.getParameter("email").equals(c.getEmail())){
					   if(request.getParameter("password").equals(c.getPassword())){
						  session.setAttribute("user",c);
						   loginCounter = 0;
						  
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
	
	private void userLogout (HttpServletRequest request, HttpServletResponse response){
		try{
			String url="index.jsp";
			request.getSession().invalidate();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void userSignUp(HttpServletRequest request, HttpServletResponse response){
	 
		try{
				
			HttpSession session = request.getSession();

			/* If we don't have a user list on this session, create it */				
			ArrayList <User> userList = (ArrayList) session.getAttribute("userList");
			if (userList == null){
				userList = new ArrayList<User>();
				session.setAttribute("userList", userList);
			}

			/* Searches userList to see if there is already a user with this email */
			Boolean hasUniqueEmail = true;
			for (User u : userList){
				if (u.getEmail().equals(request.getParameter("email"))){
					hasUniqueEmail = false;
					session.setAttribute("registrationOK", false);
					break;
				}
			}

			if (hasUniqueEmail == true){
				/* Creates new user with correct attributes */
				User user = new User();
				user.setName(request.getParameter("name"));
				user.setCpf(request.getParameter("cpf"));
				user.setDob(request.getParameter("dob"));
				user.setGender(request.getParameter("gender"));
				user.setCivilStatus(request.getParameter("civilStatus"));
				user.setCity(request.getParameter("city"));
				user.setState(request.getParameter("state"));
				user.setZip(request.getParameter("zip"));
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));

				/* Adds user to userList and saves List to session */
				userList.add(user);
				session.setAttribute("userList", userList);
				session.setAttribute("registrationOK", true);
			}

			/* Set the correct response url */
			String url = "test.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private void userRemove(HttpServletRequest request, HttpServletResponse response){
		try{		
			HttpSession session = request.getSession();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}