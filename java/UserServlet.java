package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import org.hibernate.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.*;


public class UserServlet extends HttpServlet {
	private static SessionFactory sessionFactory;

	public void init(){
		sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

	}

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		
		// Redireciona para opções corretas de Login e Logout
		if (request.getParameter("action").equals("login")){
			userLogin(request, response);	
		}
		else if (request.getParameter("action").equals("logout")){
			userLogout(request, response);
		}
		else if (request.getParameter("action").equals("searchDate")){
			userSearchDate(request, response);
		}
		else if (request.getParameter("action").equals("searchEmail")){
			userSearchEmail(request, response);
		}
		
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		
		if (request.getParameter("action").equals("add")){
			userSignUp(request, response);
		}
		else if(request.getParameter("action").equals("delete")){
			userDelete(request, response);
		}
	}

	private void userLogin (HttpServletRequest request, HttpServletResponse response){
		try{

			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			Transaction tx = hbSession.beginTransaction();
			String url="error.jsp";
			if(session.getAttribute("counter")==null){
				session.setAttribute("counter", new Integer(0));
			}
			
		
			Integer loginCounter= (Integer) session.getAttribute("counter");
			
			if(loginCounter >= 3){
				long lastAccessedTime = session.getLastAccessedTime();
				Date date = new Date();
				long currentTime = date.getTime();
				long timeDiff = currentTime - lastAccessedTime;
				// 60 minutes in milliseconds  
				if (timeDiff >= 3600000)
				{
					//invalidate user session, so they can try again
					loginCounter =0;
				}
			}

			if(loginCounter < 3){
				String email = request.getParameter("email");
				ArrayList <User> u = (ArrayList) hbSession.createQuery("from User u where u.email = '"+email+"'").list();
				User user = (User) hbSession.get(User.class, u.get(0).getId());
				if(request.getParameter("password").equals(user.getPassword())){
					session.setAttribute("user",user);
					loginCounter = 0;
					if( user.getIsSuper()){
						 url= "admin.jsp";
					}else{
					 url= "user.jsp";
					}
				}
				else{
					loginCounter= loginCounter +1;

				}	
			}

			
			session.setAttribute("counter",loginCounter);
			hbSession.close();
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

	private void userSignUp(HttpServletRequest request, HttpServletResponse response){
	 
		try{
				
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			String url = null;

			/* Recover userList from the DB */				
			ArrayList <User> userList = (ArrayList) hbSession.createQuery("from User").list();
			
			if (userList.isEmpty()){
				Transaction tx_populate = hbSession.beginTransaction();
				/* Cria David Ross user */
				User dross = new User();
				dross.setName("David Ross");
				dross.setEmail("dross@gmail.com");
				dross.setPassword("123456");
				dross.setReservationList(new ArrayList<Reservation>());
				Date date = new Date();
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String fDate = formatter.format(date);
				dross.setRegDate(fDate);
				hbSession.save(dross);

				/* Cria Admin Michael Jackson */
				User admin = new User();
				admin.setName("Michael Jackson");
				admin.setEmail("adminmj@gmail.com");
				admin.setPassword("adminadmin");
				admin.setReservationList(new ArrayList<Reservation>());
				admin.setIsSuper(true);
				date = new Date();
				formatter = new SimpleDateFormat("dd/MM/yyyy");
				fDate = formatter.format(date);
				admin.setRegDate(fDate);
				hbSession.save(admin);

				/* Cria vários outros mock users */
				for (int i=0; i<10; i++){
					User mock = new User();
					mock.setName("mock"+Integer.toString(i));
					mock.setEmail("mock" + Integer.toString(i) + "@gmail.com");
					mock.setPassword("mock" + Integer.toString(i));
					mock.setReservationList(new ArrayList<Reservation>());
					mock.setIsSuper(false);
					date = new Date();
					formatter = new SimpleDateFormat("dd/MM/yyyy");
					fDate = formatter.format(date);
					mock.setRegDate(fDate);
					hbSession.save(mock);
				}

				tx_populate.commit();
			}

			/* Searches userList to see if there is already a user with this email */
			Boolean hasUniqueEmail = true;
			ArrayList<User> usersIn = (ArrayList) hbSession.createQuery("from User").list(); 
			for (User u : usersIn){
				if (u.getEmail().equals(request.getParameter("email"))){
					hasUniqueEmail = false;
					session.setAttribute("registrationOK", false);
					break;
				}
			}

			if (hasUniqueEmail == true){
				Transaction tx_new_user = hbSession.beginTransaction();
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
				user.setReservationList(new ArrayList<Reservation>());
				Date date = new Date();
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String fDate = formatter.format(date);
				user.setRegDate(fDate);

				/* Adds user to userList and saves List to session */
				hbSession.save(user);
				tx_new_user.commit();
				session.setAttribute("origin", "signUp");
				url = "success.jsp";

			}else{
				url = "signUperror.jsp";
			}

			/* Set the correct response url */
			hbSession.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private void userSearchDate(HttpServletRequest request, HttpServletResponse response){
		try{		
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			Transaction tx = hbSession.beginTransaction();
			String url = null;

			ArrayList <User> userList = (ArrayList) hbSession.createQuery("from User").list();
			ArrayList <User> userQuery = new ArrayList();

			// Faz busca pela data
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date regDateBegin = format.parse(request.getParameter("regDateBegin"));
			Date regDateEnd = format.parse(request.getParameter("regDateEnd"));
			Date regDate;
			for (User u : userList){
				regDate = format.parse(u.getRegDate());
				if (regDateBegin.compareTo(regDate) <= 0 && regDateEnd.compareTo(regDate) >= 0){
					userQuery.add(u);
				}
			}
			request.setAttribute("userQuery", userQuery);
			
			
			if (userQuery.isEmpty() == true){
				url = "noUser.jsp";
			}
			else {
				url = "displayUser.jsp";
			}
			hbSession.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void userSearchEmail(HttpServletRequest request, HttpServletResponse response){
		try{		
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			Transaction tx = hbSession.beginTransaction();
			String url = null;

			ArrayList <User> userQuery = new ArrayList();
			ArrayList <User> userList = (ArrayList )hbSession.createQuery("from User").list();

			// Faz busca pelo email
			String email = request.getParameter("email");
			for (User u : userList){
				if (u.getEmail().equals(email)){
					userQuery.add(u);
					break;
				}
			}
			request.setAttribute("userQuery", userQuery);
			
			
			if (userQuery.isEmpty() == true){
				url = "noUser.jsp";
			}
			else {
				url = "displayUser.jsp";
			}
			hbSession.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void userDelete(HttpServletRequest request, HttpServletResponse response){
		try{		
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			Transaction tx = hbSession.beginTransaction();
			String url = null;
			ArrayList<User> userList = (ArrayList) hbSession.createQuery("from User").list();

			Integer count = 0;
			User usr;
			String id;
			for (User u : userList){
				id = request.getParameter("removeUser"+Integer.toString(count)); 
				if (id != null){
					usr = (User) hbSession.get(User.class, Integer.parseInt(id));
					hbSession.delete(usr);
				}			
				count++;
			}

			tx.commit();
			userList = (ArrayList) hbSession.createQuery("from User").list();			
			request.setAttribute("userQuery", userList);
			
			if (userList.isEmpty() == true){
				url = "noUser.jsp";
			}
			else {
				url = "displayUser.jsp";
			}
			hbSession.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}