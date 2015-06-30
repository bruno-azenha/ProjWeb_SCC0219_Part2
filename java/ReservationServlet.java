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


public class ReservationServlet extends HttpServlet {
	private static SessionFactory sessionFactory;

	public void init(){
		sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

	}

	public void doGet (HttpServletRequest request, HttpServletResponse response){		
		// Retorna todas as mensagens
		getReservations(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		if (request.getParameter("action").equals("add")){
			newReservation(request, response);	
		}
		else if (request.getParameter("action").equals("delete")){
			deleteReservation(request, response);
		}
	}

	private void getReservations(HttpServletRequest request, HttpServletResponse response){
		try {

			HttpSession session = request.getSession();
			//ArrayList<Message> reservationList = (ArrayList) session.getAttribute("reservationList");
			
			String url;
			Boolean found = false;
			// Checa se já foi instanciado a reservationList no sistema
			User u = (User) session.getAttribute("user");
				if (u == null) {
					url = "noUser.jsp";
				}

				else{
					if (u.getIsSuper()){
						found = superSearch(request, response);
					}

					else {
						found = normalSearch(request, response);
					}

					url = (found == false)? "noReservation.jsp": "displayReservation.jsp";
				}
			

			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}

	private Boolean superSearch(HttpServletRequest request, HttpServletResponse response){
		try{

			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();

			ArrayList <Reservation> reservationQuery = new ArrayList();
			//ArrayList <Reservation> reservationList = (ArrayList )session.getAttribute("reservationList");
			// Checa opção de busca de reserva (Data ou usuário)
			
			Boolean found = false;
			if (request.getParameter("mode").equals("date")){
				

					DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
					Date dataQueryIn = format.parse(request.getParameter("dateIn"));
					Date dataQueryOut = format.parse(request.getParameter("dateOut"));
					Date reservationCheckin, reservationCheckout;
					reservationQuery = (ArrayList) hbSession.createQuery("from Reservation reservation where reservation.checkin < "+dataQueryIn+" and reservation.checkout > "+ dataQueryOut+"").list();
					if(reservationQuery!= null ){
						found= true;
					}

					for (Reservation r : reservationQuery){
						System.out.println(r.getUserEmail());
						System.out.println(r.getCheckin());
						System.out.println(r.getCheckout());
							
					}
				
			}

			else if (request.getParameter("mode").equals("email")){
				String email = request.getParameter("email");

				reservationQuery = (ArrayList) hbSession.createQuery("select reservation from reservation where reservation.useremail like "+email).list();
				if(reservationQuery!= null ){
						found= true;
					}
				for (Reservation r : reservationQuery){
						System.out.println(r.getUserEmail());
						System.out.println(r.getCheckin());
						System.out.println(r.getCheckout());
							
					}
			}
			hbSession.close();
			request.setAttribute("reservationQuery", reservationQuery);
			return found;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	private Boolean normalSearch(HttpServletRequest request, HttpServletResponse response){
		try{
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();

			Boolean found = false;

			ArrayList <Reservation> reservationQuery = new ArrayList();

			// Faz busca pela data
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dataQueryIn = format.parse(request.getParameter("dateIn"));
			Date dataQueryOut = format.parse(request.getParameter("dateOut"));
			Date reservationCheckin, reservationCheckout;
			reservationQuery = (ArrayList) hbSession.createQuery("from Reservation reservation where reservation.checkin < "+dataQueryIn+" and reservation.checkout > "+ dataQueryOut+"").list();
			if(reservationQuery!= null){
				found= true;
			}

			request.setAttribute("reservationQuery", reservationQuery);
			return found;
		}
		catch (Exception e){
			e.printStackTrace();
		}

		return false;
		
	}

	private void newReservation (HttpServletRequest request, HttpServletResponse response){
		try{
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			

			// ArrayList <Reservation> reservationList = (ArrayList) session.getAttribute("reservationList");
			// if (reservationList == null){
			// 	reservationList = new ArrayList<Reservation>();
			// 	session.setAttribute("reservationList", reservationList);
			// }

			ArrayList <TimeFrame> unavailableDays = (ArrayList) hbSession.createQuery("from TimeFrame").list();
			
			/*if (unavailableDays == null){
				unavailableDays = new ArrayList<TimeFrame>();
				session.setAttribute("unavailableDays", unavailableDays);
			}*/

			DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dateIn = format.parse(request.getParameter("iDate"));
			Date dateOut = format.parse(request.getParameter("oDate"));
			Date tfStart, tfEnd;

			/* Verifica se o período está disponível */
			Boolean periodOk = true;
			for (TimeFrame tf : unavailableDays){
				tfStart = format.parse(tf.getStartDate());
				tfEnd = format.parse(tf.getEndDate());

				if ((dateIn.compareTo(tfStart) <= 0 && dateOut.compareTo(tfStart) >=0 ) 
					 || (dateIn.compareTo(tfEnd) <= 0 && dateOut.compareTo(tfEnd) >= 0)){
					periodOk = false;
				}
			}

			/* url de retorno */
			String url;

			if (periodOk == true){
				Transaction tx = hbSession.beginTransaction();
				User user = (User) session.getAttribute("user");
				Reservation reservation = new Reservation();
				reservation.setUserEmail(user.getEmail());
				reservation.setCheckin(request.getParameter("iDate"));
				reservation.setCheckout(request.getParameter("oDate"));
				reservation.setAdult(Integer.valueOf(request.getParameter("adult")));
				reservation.setBaby(Integer.valueOf(request.getParameter("baby")));
				reservation.setChild(Integer.valueOf(request.getParameter("child")));
				
				/* Adiciona o timeframe da reservation à unavailableDays */
				TimeFrame tf = new TimeFrame();
				tf.setStartDate(reservation.getCheckin());
				tf.setEndDate(reservation.getCheckout());

				url = "success.jsp";
				hbSession.save(tf);
				hbSession.save(reservation);
				tx.commit();

			}

			else {
				url = "invalidDate.jsp";
				
			}
			hbSession.close();
			
			session.setAttribute("origin", "reservation");
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

	private void deleteReservation (HttpServletRequest request, HttpServletResponse response){
		try{
			HttpSession session = request.getSession();
			Session hbSession = sessionFactory.openSession();
			Transaction tx = hbSession.beginTransaction();

			ArrayList <Reservation> reservationList = (ArrayList) hbSession.createQuery("from Reservation").list();
			ArrayList <Reservation> reservationQuery = (ArrayList<Reservation>) session.getAttribute("reservationQuery");

			Reservation reservation;
			String id;
			Integer count = 0;
			for (Reservation rQuery : reservationList){
				id = request.getParameter("removeReservation"+Integer.toString(count));
				if (id != null){
					reservation = (Reservation) hbSession.get(Reservation.class, Integer.parseInt(id));
					reservationQuery.remove(reservation);
					hbSession.delete(reservation);
				}				
				count++;
			}

			tx.commit();
			session.setAttribute("reservationQuery", reservationQuery);

			String url;
			if (reservationQuery.isEmpty() == true){
				url = "noReservation.jsp";
			}
			else {
				url = "displayReservation.jsp";
			}
			 
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}