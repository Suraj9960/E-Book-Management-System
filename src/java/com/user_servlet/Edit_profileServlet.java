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
public class Edit_profileServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String a = req.getParameter("Name");
            String b = req.getParameter("emailId");
            String c = req.getParameter("PhNo");
            String d = req.getParameter("password");
          

            User u = new User();
            u.setId(id);
            u.setName(a);
            u.setEmail(b);
            u.setPhone(c);

            UserDaoImp dao = new UserDaoImp(DBConnect.getConn());
            boolean us = dao.checkPassword(id, d);
            
             HttpSession session = req.getSession();
            if (us) {
                boolean f2 = dao.UpdateProfile(u);
                if(f2){
                     session.setAttribute("succMsg", "Updated successfully");
                    res.sendRedirect("Edit_profile.jsp");
                }else{
                     session.setAttribute("failedMsg", "Something went wrong");
                    res.sendRedirect("Edit_profile.jsp");  
                }
            } else {
                session.setAttribute("failedMsg", "Your password is incorrect ");
                res.sendRedirect("Edit_profile.jsp");

            }
//            

        } catch (Exception er) {
            er.printStackTrace();
        }

    }

}
