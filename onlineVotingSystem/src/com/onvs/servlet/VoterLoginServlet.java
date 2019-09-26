package com.onvs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onvs.util.DBConnection;

/**
 * Servlet implementation class VoterLoginServlet
 */
@WebServlet("/VoterLoginServlet")
public class VoterLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoterLoginServlet() {
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
		
		String Uname = request.getParameter("username");
		String Pass  = request.getParameter("pass");
		
		try {
			Connection con;
			con= DBConnection.getConnection();
			String sql="Select Voters_NIC,Password from Voters where Voters_NIC='"+Uname+"' and Password='"+Pass+"'";
			Statement state= con.createStatement();
			ResultSet result= state.executeQuery(sql);
		
			
			if(result.next()) {
				HttpSession session= request.getSession();
				session.setAttribute("Voter", Uname);
				response.sendRedirect("Vote.jsp");
			}
			else
			{
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Wrong UserName or Password')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/VoterLogin.jsp");
				
				dispatch.include(request, response);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
