
package com.onvs.servlet;

import com.onvs.config.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.onvs.model.Parties;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = (String) request.getParameter("partyName");
            String address = (String) request.getParameter("partyAddress");
            String nic = (String) request.getParameter("nic");
            String mail = (String) request.getParameter("partyMail");
            String tel = (String) request.getParameter("partyTel");
            
            HttpSession se=request.getSession();
            int id = (Integer)se.getAttribute("editID");
            
            try {
                SessionFactory sf = NewHibernateUtil.getSessionFactory();
                Session sess = sf.openSession();
                Transaction tr = sess.beginTransaction();

                Parties party = (Parties) sess.get(Parties.class, id);
                party.setName(name);
                party.setAddress(address);
                party.setPresidentNic(nic);
                party.setEmail(mail);
                party.setTel(tel);

                sess.update(party);

                tr.commit();
                response.sendRedirect("overview.jsp");

            } catch (Exception e) {
                System.out.println("Problem is ---------- " + e.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
