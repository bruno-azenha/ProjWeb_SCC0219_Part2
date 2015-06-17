package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;



public class ReservationServlet extends HttpServlet {

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
			ArrayList<Message> reservationList = (ArrayList) session.getAttribute("reservationList");
			
			String url;
			// Checa se já foi instanciado a reservationList no sistema
			if (reservationList == null || reservationList.isEmpty()){
				url = "noReservation.jsp";
			}

			else {

				User u = (User) session.getAttribute("user");
				if (u == null) {
					url = "noUser.jsp";
				}

				else{
					if (u.getIsSuper()){
						superSearch(request, response);
						url = "displayReservation.jsp";
					}

					else {
						normalSearch(request, response);
						url = "displayReservation.jsp";	

					}
				}
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void superSearch(HttpServletRequest request, HttpServletResponse response){
		try{

			HttpSession session = request.getSession();
			ArrayList <Reservation> reservationQuery = new ArrayList();
			ArrayList <Reservation> reservationList = (ArrayList )session.getAttribute("reservationList");
			// Checa opção de busca de reserva (Data ou usuário)
			
			if (request.getParameter("mode").equals("date")){
				

					DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
					Date dataQueryIn = format.parse(request.getParameter("dateIn"));
					Date dataQueryOut = format.parse(request.getParameter("dateOut"));
					Date reservationCheckin;
					for (Reservation r : reservationList){
						
						reservationCheckin = format.parse(r.getCheckin());
						if (dataQueryIn.compareTo(reservationCheckin) <= 0 && dataQueryOut.compareTo(reservationCheckin) >= 0){
							reservationQuery.add(r);
						}
					}
				
			}

			else if (request.getParameter("mode").equals("email")){
				String email = request.getParameter("email");

				for (Reservation r : reservationList){
					if (r.getUser().equals(email)){
						reservationQuery.add(r);
					}
				}
			}

			session.setAttribute("reservationQuery", reservationQuery);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void normalSearch(HttpServletRequest request, HttpServletResponse response){
		try{
			HttpSession session = request.getSession();

			ArrayList <Reservation> reservationQuery = new ArrayList();
			ArrayList <Reservation> reservationList = (ArrayList )session.getAttribute("reservationList");

			// Faz busca pela data
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dataQueryIn = format.parse(request.getParameter("dateIn"));
			Date dataQueryOut = format.parse(request.getParameter("dateOut"));
			Date reservationCheckin;
			for (Reservation r : reservationList){
				
				reservationCheckin = format.parse(r.getCheckin());
				if (dataQueryIn.compareTo(reservationCheckin) <= 0 && dataQueryOut.compareTo(reservationCheckin) >= 0){
					reservationQuery.add(r);
				}
			}
			session.setAttribute("reservationQuery", reservationQuery);
		}
		catch (Exception e){
			e.printStackTrace();
		}

		
	}

	private void newReservation (HttpServletRequest request, HttpServletResponse response){
		try{
			HttpSession session = request.getSession();

			ArrayList <Reservation> reservationList = (ArrayList) session.getAttribute("reservationList");
			if (reservationList == null){
				reservationList = new ArrayList<Reservation>();
				session.setAttribute("reservationList", reservationList);
			}

			ArrayList <TimeFrame> unavailableDays = (ArrayList) session.getAttribute("unavailableDays");
			if (unavailableDays == null){
				unavailableDays = new ArrayList<TimeFrame>();
				session.setAttribute("unavailableDays", unavailableDays);
			}

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
				User user = (User) session.getAttribute("user");
				Reservation reservation = new Reservation();
				reservation.setUser(user.getEmail());
				reservation.setCheckin(request.getParameter("iDate"));
				reservation.setCheckout(request.getParameter("oDate"));
				reservation.setAdult(Integer.valueOf(request.getParameter("adult")));
				reservation.setBaby(Integer.valueOf(request.getParameter("baby")));
				reservation.setChild(Integer.valueOf(request.getParameter("child")));
				
				/* Adiciona o timeframe da reservation à unavailableDays */
				TimeFrame tf = new TimeFrame();
				tf.setStartDate(reservation.getCheckin());
				tf.setEndDate(reservation.getCheckout());
				unavailableDays.add(tf);
				session.setAttribute("unavailableDays",unavailableDays);

				url = "success.jsp";
				reservationList.add(reservation);
				session.setAttribute("reservationList",reservationList);
			}

			else {
				url = "error.jsp";
			}
			
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

			ArrayList <Reservation> reservationList = (ArrayList) session.getAttribute("reservationList");
			ArrayList <Reservation> reservationQuery = (ArrayList) session.getAttribute("reservationList");
			ArrayList <TimeFrame> unavailableDays = (ArrayList) session.getAttribute("unavailableDays");
			ArrayList <Reservation> reservationCopy = new ArrayList<Reservation>(reservationList);
			ArrayList <Reservation> reservationQueryCopy = new ArrayList<Reservation>(reservationQuery);
			ArrayList <TimeFrame> unavailableDaysCopy = new ArrayList<TimeFrame>(unavailableDays);

			Integer count = 0;

			String reservationIn = "";
			String reservationOut = "";

			for (Reservation rQuery : reservationQuery){
				if (request.getParameter("removeReservation"+Integer.toString(count)) != null){
					reservationCopy.remove(rQuery);
					reservationQueryCopy.remove(rQuery);
					reservationIn = rQuery.getCheckin();
					reservationOut = rQuery.getCheckout();
					break;
				}			
				count++;
			}

			/* torna o período disponível novamente */
			for (TimeFrame tf : unavailableDays){
				if (tf.getStartDate().equals(reservationIn) && tf.getEndDate().equals(reservationOut)){
					unavailableDaysCopy.remove(tf);
					break;
				}
			}


			session.setAttribute("unavailableDays", unavailableDaysCopy);
			session.setAttribute("reservationList", reservationCopy);
			session.setAttribute("reservationQuery", reservationQueryCopy);


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