/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.CartDAOImp;
import com.DAO.OrderDAOImp;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("userId"));

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String payment = req.getParameter("payment");

            String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;

//           System.out.println(name+" "+email+" "+phno+" "+fullAddress+" "+payment);
            CartDAOImp dao = new CartDAOImp(DBConnect.getConn());
            List<Cart> blist = dao.getBookByUser(id);
            
            HttpSession session = req.getSession();
            
            if (blist.isEmpty()) {
                session.setAttribute("failed", "Please Add Book in Cart");
                resp.sendRedirect("Cart.jsp");

            } else {
                OrderDAOImp dao2 = new OrderDAOImp(DBConnect.getConn());
                int i = dao2.getOrderNO();

                BookOrder o = null;

                ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
                for (Cart c : blist) {
                    o = new BookOrder();
                    o.setOrder_id("BOOK-ORD 00" + i);
                    o.setUsername(name);
                    o.setEmail(email);
                    o.setPhone(phno);
                    o.setFulladdress(fullAddress);
                    o.setBookname(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice() + "");
                    o.setPayment(payment);
                    orderList.add(o);
                    i++;
                }
                
                if ("noselect".equals(payment)) {
                    session.setAttribute("failed", "Please Choose Payment Method");
                    resp.sendRedirect("Cart.jsp");
                } else {
                    boolean res = dao2.saveOrder(orderList);

                    if (res) {
                        resp.sendRedirect("orderSuccess_1.jsp");
                    } else {
                        resp.sendRedirect("Cart.jsp");

                    }
                }
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
    }

}
