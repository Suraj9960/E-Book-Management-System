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
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out= resp.getWriter();
        
       try{
           int  bid = Integer.parseInt(req.getParameter("bid"));
           int  uid = Integer.parseInt(req.getParameter("uid"));
           
           BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
           BookDtls b = dao.getBook(bid);
           Cart c = new Cart();
           c.setBid(bid);
           c.setUid(uid);
           c.setBookName(b.getBookName());
           c.setAuthor(b.getAuthor());
           c.setPrice(Double.parseDouble(b.getPrice()));
           c.setTotal(Double.parseDouble(b.getPrice()));
           
           CartDAOImp dao2 = new CartDAOImp(DBConnect.getConn());
           boolean result = dao2.add(c);
           
           HttpSession session = req.getSession();
           if(result){
               session.setAttribute("succ", "Added to Cart  Successfully");
                resp.sendRedirect("index.jsp");
           }else{
               session.setAttribute("failed", "Something Wen Wrong");
                resp.sendRedirect("index.jsp");
               
           }
           
           
          
       }catch(Exception er){
           er.printStackTrace();
           out.print("Excepption : "+ er);
           
       }
    }
    
    
}
