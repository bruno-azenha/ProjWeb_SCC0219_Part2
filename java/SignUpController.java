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

			/* If we don't have a user list on this session, create it */				
			if(session.getAttribute("userList")==null) session.setAttribute("userList",new ArrayList());
		
			/* Recover the userList from session */
			ArrayList<User> userList = (ArrayList) session.getAttribute("userList");

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
}