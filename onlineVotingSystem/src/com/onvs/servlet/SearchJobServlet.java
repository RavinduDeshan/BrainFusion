package com.onvs.servlet;

import java.io.IOException;
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
 * Servlet implementation class SearchCandidateServlet
 */
@WebServlet("/SearchCandidateServlet")
public class SearchJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchJobServlet() {
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
		
		String Id= request.getParameter("editid");
		
		UserService canserv1=new UserServiceImpl();
		
		try {
			
			
			User can = canserv1.getUserDetails(Id) ;
			
			request.setAttribute("Candidate", can);
			
			RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/UpdateCandidate.jsp");
			dispatch.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
