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
				url = "noReservations.jsp";
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
		HttpSession session = request.getSession();
		ArrayList <Reservation> reservationQuery = new ArrayList();
		ArrayList <Reservation> reservationList = (ArrayList )session.getAttribute("reservationList");
		// Checa opção de busca de reserva (Data ou usuário)
		
		if (request.getParameter("mode").equals("date")){
			
			try{
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
			catch (Exception e){
				e.printStackTrace();
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

			User user = (User) session.getAttribute("user");
			Reservation reservation = new Reservation();
			reservation.setUser(user.getEmail());
			reservation.setCheckin(request.getParameter("iDate"));
			reservation.setCheckout(request.getParameter("oDate"));
			reservation.setAdult(Integer.valueOf(request.getParameter("adult")));
			reservation.setBaby(Integer.valueOf(request.getParameter("baby")));
			reservation.setChild(Integer.valueOf(request.getParameter("child")));
			reservationList.add(reservation);
			session.setAttribute("reservationList",reservationList);

			String url = "test.jsp";
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
			ArrayList <Reservation> reservationCopy = new ArrayList<Reservation>(reservationList);
			Integer count = 0;

			for (Reservation rQuery : reservationQuery){
				if (request.getParameter("removeReservation"+Integer.toString(count)) != null){
					reservationCopy.remove(rQuery);
				}			
				count++;
			}

			session.setAttribute("reservationList", reservationCopy);
			String url = "viewr.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}