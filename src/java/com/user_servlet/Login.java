/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user_servlet;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shree
 */
public class Login extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        try {
            UserDaoImp dao = new UserDaoImp(DBConnect.getConn());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

//            check it is admin
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                res.sendRedirect("home_1.jsp");
            } else {
                User us = dao.Login(email, password);

                if (us != null) {
//                    checking if user in not null then it is valid or invalid
                    session.setAttribute("userobj", us);
                    res.sendRedirect("index.jsp");

                } else {
//                    if it is invalid the this code is work
                    session.setAttribute("failedMsg", "Email & Password is Invalid");
                    res.sendRedirect("Login.jsp");

                }
//                send it to the user
                res.sendRedirect("index.jsp");

            }

        } catch (Exception er) {
            er.printStackTrace();
        }

    }

}
