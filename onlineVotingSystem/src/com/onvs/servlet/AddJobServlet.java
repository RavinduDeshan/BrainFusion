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

import com.onvs.model.Job;
import com.onvs.model.User;
import com.onvs.service.JobService;
import com.onvs.service.UserService;
import com.onvs.service.impl.JobServiceImpl;
import com.onvs.service.impl.UserServiceImpl;




@WebServlet("/AddJobServlet")
public class AddJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJobServlet() {
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
		
		
		String title= request.getParameter("title");
		String code= request.getParameter("code");
		String email= request.getParameter("email");
		String phone_number= request.getParameter("phone_number");
		String web= request.getParameter("web");
		String type= request.getParameter("jobType");
		String gender= request.getParameter("gender");
		String note= request.getParameter("note");
		String cname= request.getParameter("cname");
		String cnote= request.getParameter("cnote");
		String cemail= request.getParameter("cemail");
		
		
		
		
		
		
		
		Job can1 = new Job(title, code, email, phone_number, web, type, gender, note, cname, cnote,cemail);
		
		
		
		JobService canserv1=new JobServiceImpl();
		
		try {
			boolean isAdded= canserv1.addNewJob(can1);
			if (isAdded=true) {
				
				
				
				System.out.println("Success Service");
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addJob.jsp");
				
				dispatch.include(request, response);
			
				
				
			}
			
			else {
				
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Candidate Registration is not Successfull')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/addJob.jsp");
				
				dispatch.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
