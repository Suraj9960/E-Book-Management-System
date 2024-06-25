/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Shree
 */
@MultipartConfig
public class addOldBook extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        try {

            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String Categories = "Old";
            String status = "Active";
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();
            String useremain = req.getParameter("user");
            BookDtls b = new BookDtls(bookName, author, price, Categories, status, fileName, useremain);

            BookDAOImp dao = new BookDAOImp(DBConnect.getConn());

            boolean f = dao.add(b);
            HttpSession session = req.getSession();
            if (f) {
//                getting the folder path to save the image
                String path = getServletContext().getRealPath("")+"BOOK";
                File file = new File(path);
                part.write(path + File.separator + fileName);

                session.setAttribute("succMsg", "Book Selled Successfully");
                res.sendRedirect("sell_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong");
                res.sendRedirect("sell_book.jsp");

            }

        } catch (Exception er) {
            er.printStackTrace();
        }

    }

}
