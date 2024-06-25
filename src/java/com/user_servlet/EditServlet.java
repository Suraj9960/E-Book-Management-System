/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shree
 */
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("status");
            
             BookDtls b = new BookDtls();
             b.setBookId(id);
             b.setBookName(bookName);
             b.setAuthor(author);
             b.setPrice(price);
             b.setStatus(status);
             
             BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
             boolean t = dao.updateBook(b);
             HttpSession session = req.getSession();
             if(t){
               
              session.setAttribute("succMsg", "Book Updated Successfully");
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
