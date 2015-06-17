package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class MessageServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){		
		// Retorna todas as mensagens
		getMessages(request, response);
		
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		if (request.getParameter("action").equals("add")){
			newMessage(request, response);	
		}
		else if (request.getParameter("action").equals("delete")){
			deleteMessage(request, response);
		}
	}

	private void getMessages(HttpServletRequest request, HttpServletResponse response){
		
		try {
			HttpSession session = request.getSession();
			
			ArrayList<Message> messageList = (ArrayList) session.getAttribute("messageList");
			String url;
			// Checa se já existem mensagens no sistema
			if (messageList == null || messageList.isEmpty()){
				url = "noMessage.jsp";
			}

			else {
				url = "displayMessage.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void newMessage(HttpServletRequest request, HttpServletResponse response){
		try {
			HttpSession session = request.getSession();
			
			// Checa se já foi instanciado a messageList no sistema
			ArrayList<Message> messageList = (ArrayList) session.getAttribute("messageList");
			if (messageList == null){
				messageList = new ArrayList<Message>();
				session.setAttribute("messageList", messageList);
			}

			Message message = new Message();
			Date date = new Date();
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String fDate = formatter.format(date);
			message.setDate(fDate);
			message.setName(request.getParameter("name")); 
			message.setEmail(request.getParameter("email"));
			message.setMobile(request.getParameter("phone"));
			String[] known = request.getParameterValues("conheceu");
			String know = new String();
			for( String s: known){
				know += s + ";";
			}

			message.setKnown(know);
			message.setMessage(request.getParameter("message"));
			messageList.add(0, message);
			session.setAttribute("messageList",messageList);
			session.setAttribute("origin", "message");
			String url = "success.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void deleteMessage(HttpServletRequest request, HttpServletResponse response){
		try {
			HttpSession session = request.getSession();
			
			ArrayList <Message> messageList = (ArrayList) session.getAttribute("messageList");
			ArrayList <Message> messageQuery = (ArrayList) session.getAttribute("messageList");
			ArrayList <Message> messageCopy = new ArrayList<Message>(messageList);
			Integer count = 0;

			for (Message mQuery : messageQuery){
				if (request.getParameter("removeMessage"+Integer.toString(count)) != null){
					messageCopy.remove(mQuery);
				}			
				count++;
			}

			session.setAttribute("messageList", messageCopy);
			session.removeAttribute("messageQuery");
			
			String url;
			if (messageQuery.isEmpty() == true){
				url = "noMessage.jsp";
			}
			else {
				url = "displayMessage.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}
}