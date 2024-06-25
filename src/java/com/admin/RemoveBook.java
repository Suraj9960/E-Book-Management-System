/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin;

import com.DAO.CartDAOImp;
import com.DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shree
 */
@WebServlet("/remove")
public class RemoveBook extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            CartDAOImp dao = new CartDAOImp(DBConnect.getConn());
            boolean res = dao.deleteBook(bid,uid);
            HttpSession ses = req.getSession();

            if (res) {
                ses.setAttribute("succ", "Book Removed From Cart");
                resp.sendRedirect("Cart.jsp");
            } else {
                ses.setAttribute("failed", "Book is not Removed From Cart");
                resp.sendRedirect("Cart.jsp");
            }

        } catch (Exception er) {
            er.printStackTrace();
        }

    }

}
