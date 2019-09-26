package com.onvs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.onvs.util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
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
		doGet(request, response);
		
		
		System.out.println("BLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
		
		
		String Uname = request.getParameter("username");
		String Pass  = request.getParameter("pass");
		
		try {
			Connection con;
			con= DBConnection.getConnection();
			String sql="Select email,password from User where NIC='"+Uname+"' and password='"+Pass+"'";
			Statement state= con.createStatement();
			ResultSet result= state.executeQuery(sql);
		
			
			if(result.next()) {
				HttpSession session= request.getSession();
				session.setAttribute("Admin", Uname);
				session.setAttribute("type", "1");
				response.sendRedirect("UserDashBoard.jsp");
			}
			else
			{
				PrintWriter msg= response.getWriter();
				msg.println("<script>");
				msg.println("alert('Wrong UserName or Password')");
				msg.println("</script>");
				
				RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/UserLogin.jsp");
				HttpSession session= request.getSession();
				
				response.sendRedirect("UserLogin.jsp");
				
				dispatch.include(request, response);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
