/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.BookDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.WishList;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/wishlist")
public class likeServlet extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            int bid = Integer.parseInt(req.getParameter("b"));
            int uid = Integer.parseInt(req.getParameter("u"));

            BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
            BookDtls b = dao.getBook(bid);
            Cart l = new Cart();
            l.setBid(bid);
            l.setUid(uid);
            l.setBookName(b.getBookName());
            l.setAuthor(b.getAuthor());
            l.setPrice(Double.parseDouble(b.getPrice()));

            CartDAOImp dao2 = new CartDAOImp(DBConnect.getConn());
            boolean result = dao2.addWishlist(l);

            HttpSession session = req.getSession();
            if (result) {
                session.setAttribute("succ", "Added to wishlist  Successfully");
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failed", "Something Went Wrong");
                resp.sendRedirect("index.jsp");

            }

        } catch (Exception er) {
            er.printStackTrace();
            out.print("Excepption : " + er);

        }
    }

}
