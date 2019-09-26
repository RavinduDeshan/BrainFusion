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

import com.onvs.model.JobHost;
import com.onvs.model.User;
import com.onvs.service.JobHostService;
import com.onvs.service.UserService;
import com.onvs.service.impl.JobHostServiceImpl;
import com.onvs.service.impl.UserServiceImpl;




@WebServlet("/AddJobHostServlet")
public class AddJobHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJobHostServlet() {
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

		String cname= request.getParameter("cname");
		String address= request.getParameter("address");
		String email= request.getParameter("email");
		String phone_number= request.getParameter("phone_number");
		String web= request.getParameter("web");
		String note= request.getParameter("note");
		String password= request.getParameter("password");
		
		JobHost can1 = new JobHost(cname, email, web, phone_number, note, password, address);
		
		
		
		JobHostService canserv1=new JobHostServiceImpl();
		
		try {
			boolean isAdded= canserv1.addNewJobHost(can1);
			if (isAdded=true) {
				
				
				
				System.out.println("Success Service");
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addJobHost.jsp");
				
				dispatch.include(request, response);
			
				
				
			}
			
			else {
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration is not Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addJobHost.jsp");
				
				dispatch.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
