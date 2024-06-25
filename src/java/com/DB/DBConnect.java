/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Shree
 */
public class DBConnect {
    private static Connection conn;
    public static Connection getConn(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","root");  
        }catch(Exception er){
            er.printStackTrace();
        }
        return conn;
    }
}
