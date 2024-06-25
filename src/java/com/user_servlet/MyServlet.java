/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
public class MyServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            String a = req.getParameter("Name");
            String b = req.getParameter("emailId");
            String c = req.getParameter("PhNo");
            String d = req.getParameter("password");
            String check = req.getParameter("check");
            Part part = req.getPart("img");
            String filename = part.getSubmittedFileName();
//            System.out.println(filename);
//            
            User us = new User();
            us.setName(a);
            us.setEmail(b);
            us.setPhone(c);
            us.setPassword(d);
            us.setPhoto(filename);

            HttpSession session = req.getSession();
            if (check != null) {
                UserDaoImp dao = new UserDaoImp(DBConnect.getConn());
                boolean f2 = dao.checkUser(b);

                if (f2) {
                    boolean f = dao.UserRegister(us);
//                    String path = getServletContext().getRealPath("")+"User";
//                    System.out.println(path);
                    if (f) {
                        String path = getServletContext().getRealPath("") + "USER";
//                        System.out.println(path);
                        File file = new File(path);
                        part.write(path + File.separator + filename);
//                        System.out.println("Content of file: "+file);
                        session.setAttribute("succMsg", "Registred successfully");
                        res.sendRedirect("Register.jsp");

                    } else {
                        session.setAttribute("failedMsg", "Something went wrong");
                        res.sendRedirect("Register.jsp");

                    }
                } else {
                    session.setAttribute("failedMsg", "User Already Exists try another Email Id");
                    res.sendRedirect("Register.jsp");
                }

            } else {
                session.setAttribute("failedMsg", "please agree term's and condition");
                res.sendRedirect("Register.jsp");
            }

        } catch (Exception er) {
            er.printStackTrace();
        }

    }

}
