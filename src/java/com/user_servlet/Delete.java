/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shree
 */
public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id =  Integer.parseInt(req.getParameter("id"));
            BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
            boolean f = dao.deleteBook(id);

            HttpSession session = req.getSession();
            if (f) {

                session.setAttribute("succMsg", "Book Deleted Successfully");
                resp.sendRedirect("All_Book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong");
                resp.sendRedirect("All_Book.jsp");
            }
        }catch(Exception er){
            er.printStackTrace();
        }
    }

}
