/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.WishList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shree
 */
public class CartDAOImp implements CartDAO {
    private Connection conn;
    public CartDAOImp(Connection conn){
        this.conn = conn;
    }

    @Override
    public boolean add(Cart c) {
        boolean f  = false;
        try{
            String sql = "insert into cart (bid, uid, bookName, author, price, total) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1, c.getBid());
           ps.setInt(2, c.getUid());
           ps.setString(3, c.getBookName());
           ps.setString(4, c.getAuthor());
           ps.setDouble(5, c.getPrice());
           ps.setDouble(6,c.getPrice());
            
            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
            
            
        }catch(Exception er){
            er.printStackTrace();
            System.out.print("Exceptio at CARTDAOIMP: "+ er);
        }
      
        return f;
      
    }
    public boolean addWishlist(Cart l) {
        boolean f  = false;
        try{
            String sql = "insert into cart1 ( bid, uid, bookName, author, price) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1,l.getBid());
           ps.setInt(2, l.getUid());
           ps.setString(3, l.getBookName());
           ps.setString(4, l.getAuthor());
           ps.setDouble(5, l.getPrice());
            
            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
            
            
        }catch(Exception er){
            er.printStackTrace();
            System.out.print("Exceptio at CARTDAOIMP: "+ er);
        }
      
        return f;
      
    }
    public List<Cart> getBookByUser1(int id) {
        List<Cart> list = new ArrayList<Cart>();
        Cart l = null;
        double total = 0;
       try{
           String sql = "select * from cart1 where uid = ?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1,id);
           
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               l = new Cart();
               l.setCid(rs.getInt(1));
               l.setBid(rs.getInt(2));
               l.setUid(rs.getInt(3));
               l.setBookName(rs.getString(4));
               l.setAuthor(rs.getString(5));
               l.setPrice(rs.getDouble(6));
               list.add(l);
           }
       }catch(Exception er){
           er.printStackTrace();
       }
        return list ;
    }

    @Override
    public List<Cart> getBookByUser(int id) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        double total = 0;
       try{
           String sql = "select * from cart where uid = ?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1,id);
           
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               c = new Cart();
               c.setCid(rs.getInt(1));
               c.setBid(rs.getInt(2));
               c.setUid(rs.getInt(3));
               c.setBookName(rs.getString(4));
               c.setAuthor(rs.getString(5));
               c.setPrice(rs.getDouble(6));
               
               total = total + rs.getDouble(7);
               c.setTotal(total);
               list.add(c);
           }
           
       }catch(Exception er){
           er.printStackTrace();
       }
        return list ;
    }

    @Override
    public boolean deleteBookW(int bid , int uid) {
        boolean f  = false;
        
        try {
            String sql = "delete from cart1 where bid=? and  uid=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            int i = ps.executeUpdate();
            
            
            if(i == 1){
                f = true;
                System.out.print(i);
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
        
        return f;
        
    }
    public boolean deleteBook(int bid , int uid) {
        boolean f  = false;
        
        try {
            String sql = "delete from cart where bid=? and  uid=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            int i = ps.executeUpdate();
            
            
            if(i == 1){
                f = true;
                System.out.print(i);
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
        
        return f;
        
    }
    
}
