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
import javax.servlet.http.HttpSession;

import com.onvs.service.UserService;
import com.onvs.service.impl.UserServiceImpl;

/**
 * Servlet implementation class DeleteCandidateServlet
 */
@WebServlet("/DeleteCandidateServlet")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobServlet() {
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
		// TODO Auto-generated method stub
		
		
		String id= request.getParameter("deleteid");
		UserService canserv1=new UserServiceImpl();
		
		boolean isDeleted=false;
		try {
			isDeleted = canserv1.deleteUser(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(isDeleted==true) {
			
			HttpSession session= request.getSession();
			
			response.sendRedirect("AdminCandidate.jsp");
			
			System.out.println("Delete Success Service");
			
			PrintWriter msg= response.getWriter();
			msg.println("<script>");
			msg.println("alert('Candidate Details Deleted Successfull')");
			msg.println("</script>");
			
			RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/AdminCandidate.jsp");
			
			dispatch.include(request, response);
		}
	}

}
