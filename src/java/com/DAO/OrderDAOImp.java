/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shree
 */
public class OrderDAOImp implements OrderDAO {

    private Connection conn;

    public OrderDAOImp(Connection conn) {
        this.conn = conn;
    }

    @Override
    public int getOrderNO() {
        int i = 1;
        try {
            String sql = "select * from orderbook ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                i++;

            }
        } catch (Exception er) {
            er.printStackTrace();
        }
        return i;
    }

    @Override
    public boolean saveOrder(List<BookOrder> blist) {
        boolean f = false;
        try {
            String sql = "insert into orderbook(order_id,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (BookOrder b : blist) {
                ps.setString(1, b.getOrder_id());
                ps.setString(2, b.getUsername());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFulladdress());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getBookname());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPayment());
                ps.addBatch();

            }
            int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);

        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookOrder> getBook(String email) {
        List<BookOrder> list = new ArrayList<BookOrder>();
        BookOrder b = null;
        try {
            String sql = "select * from orderbook where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookOrder();
                b.setId(rs.getInt(1));
                b.setOrder_id(rs.getString(2));
                b.setUsername(rs.getString(3));
                b.setEmail(rs.getString(4));
                b.setFulladdress(rs.getString(5));
                b.setPhone(rs.getString(6));
                b.setBookname(rs.getString(7));
                b.setAuthor(rs.getString(8));
                b.setPrice(rs.getString(9));
                b.setPayment(rs.getString(10));
                list.add(b);
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookOrder> getBook() {
        List<BookOrder> list = new ArrayList<BookOrder>();
        BookOrder b = null;
        try {
            String sql = "select * from orderbook";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookOrder();
                b.setId(rs.getInt(1));
                b.setOrder_id(rs.getString(2));
                b.setUsername(rs.getString(3));
                b.setEmail(rs.getString(4));
                b.setFulladdress(rs.getString(5));
                b.setPhone(rs.getString(6));
                b.setBookname(rs.getString(7));
                b.setAuthor(rs.getString(8));
                b.setPrice(rs.getString(9));
                b.setPayment(rs.getString(10));
                list.add(b);
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;

    }

}
