package Bridgeport;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.util.*; 
import java.lang.Integer;


public class ListHandler extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response){
		execute(request, response);
	}
    
    public void execute(HttpServletRequest request, HttpServletResponse response){
     
        try{
						
		   HttpSession session = request.getSession();
           String url;
	  // pagina teste para ver se as insercoes estao ok
            url= "test.jsp";
           if(session.getAttribute("messageList")==null)session.setAttribute("messageList",new ArrayList<Message>());
           if(session.getAttribute("reservationList")==null)session.setAttribute("reservationList",new ArrayList<Reservation>());    
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
           
            
            ArrayList userList = (ArrayList) session.getAttribute("userList");
            ArrayList messageList = (ArrayList) session.getAttribute("messageList");
            ArrayList reservationList = (ArrayList) session.getAttribute("reservationList");
		// TODO linkar com a pagina de cadastro que o bruno fez
            if(request.getParameter("action").equals("add")){
                if(request.getParameter("origin").equals("user")){
                    User user = new User();
                    user.setName(request.getParameter("name"));
                    user.setCpf(request.getParameter("cpf"));
                    user.setDob(request.getParameter("dob"));
                    user.setGender(request.getParameter("gender"));
                    user.setCivilStatus(request.getParameter("civilstatus"));
                    user.setCity(request.getParameter("city"));
                    user.setState(request.getParameter("state"));
                    user.setZip(request.getParameter("zip"));
                    user.setEmail(request.getParameter("email"));
                    user.setPassword(request.getParameter("password"));
                    userList.add(user);
                    session.setAttribute("userList",userList);
                    
                }
                else if(request.getParameter("origin").equals("message")){
                    Message message = new Message();
                    message.setName(request.getParameter("name")); 
                    message.setEmail(request.getParameter("email"));
                    String[] known = request.getParameterValues("conheceu");
                    String know = new String();
                    for( String s: known){
                        know += s + ";";
                    }
     
                    message.setKnown(know);
                    message.setMessage(request.getParameter("message"));
                    messageList.add(message);
                    session.setAttribute("userList",userList);
                    
                }
                else if(request.getParameter("origin").equals("reservation")){
                    Reservation reservation = new Reservation();
                    reservation.setName(request.getParameter("name"));
                    reservation.setCheckin(request.getParameter("checkin"));
                    reservation.setCheckout(request.getParameter("chekout"));
                    reservation.setAdult(Integer.valueOf(request.getParameter("adult")));
                    reservation.setBaby(Integer.valueOf(request.getParameter("baby")));
                    reservation.setChild(Integer.valueOf(request.getParameter("child")));
                    
                                
                }
                url= "test.jsp";
                
            }
            /*if(request.getParameter("action").equals("remove"){
             if(request.getParameter("origin").equals("reservation"){//user pode consultar e remover apenas suas proprias reservas
                }   
            }
            if(request.getParameter("action").equals("consult"){
            if(request.getParameter("origin").equals("user"){//admin pode consultar e remover usuarios,mensagens reservas de todo mundo
                }
                else if(request.getParameter("origin").equals("admin"
                ){//pode consultar e remover qualquer reserva e usuario}
                else if(request.getParameter("origin").equals("reservation"){}
            }*/
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("../"+url);
			dispatcher.forward(request, response);
            
        
        }catch(Exception e){
			e.printStackTrace();
		}
    }
}
