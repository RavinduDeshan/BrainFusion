package com.onvs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onvs.model.User;
import com.onvs.service.UserService;
import com.onvs.service.impl.UserServiceImpl;

/**
 * Servlet implementation class AddCandidateServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("FUCKKKKKKKKKKKKKKKKKKKKKKK");

		String full_name= request.getParameter("full_name");
		String initial_name= request.getParameter("initial_name");
		String nic= request.getParameter("nic");
		String address= request.getParameter("address");
		String email= request.getParameter("email");
		String phone_number= request.getParameter("phone_number");
		String school= request.getParameter("school");
		String uni= request.getParameter("uni");
		String gender= request.getParameter("gender");
		String note= request.getParameter("note");
		String password= request.getParameter("password");
		
		User can1 = new User(nic, full_name, initial_name, email, address, phone_number, school,
				uni, gender, note,password);
		
		
		
		UserService canserv1=new UserServiceImpl();
		
		try {
			boolean isAdded= canserv1.addNewUser(can1);
			if (isAdded=true) {
				
				
				
				System.out.println("Success Service");
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addUser.jsp");
				
				dispatch.include(request, response);
			
				
				
			}
			
			else {
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration is not Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addUser.jsp");
				
				dispatch.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
