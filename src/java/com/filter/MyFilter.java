/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.filter;

import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MyFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession s = req.getSession(); 
        User user = (User)s.getAttribute("userobj");
        
        if(user != null){
            chain.doFilter(request, response);
            
        }else{
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1>Invalid User, please login ...</h1>");
            res.sendRedirect("Login.jsp");
        }
    }

    @Override
    public void destroy() {
    }
    
}
