/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.DB.DBConnect;

import com.entity.BookDtls;
import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shree
 */
public class UserDaoImp implements UserDAO {

    private Connection conn;

    public UserDaoImp(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean UserRegister(User us) {
        boolean f = false;
        try {
            //inser the query;
            String data = "insert into user(Name,Email,Phone,Password,Photo) values(?,?,?,?,?)";
            PreparedStatement psmt = conn.prepareStatement(data);
            psmt.setString(1, us.getName());
            psmt.setString(2, us.getEmail());
            psmt.setString(3, us.getPhone());
            psmt.setString(4, us.getPassword());
            psmt.setString(5, us.getPhoto());

            int i = psmt.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }

        return f;
    }

    public User getUser(int id) {
        User b = null;
        try {
            String sql = "select * from user where Id =?";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                b = new User();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setEmail(rs.getString(3));
                b.setPhone(rs.getString(4));
                b.setPassword(rs.getString(5));
                b.setPhoto(rs.getString(6));
                
            }
        } catch (Exception er) {
            er.printStackTrace();
        }

        return b;

    }

    @Override
    public User Login(String email, String password) {
        User us = null;
        try {
            String sql = "select * from user where Email = ? and Password=?";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));

            }

        } catch (Exception er) {
            er.printStackTrace();
        }

        return us;
    }

    public boolean checkPassword(int id, String ps) {
        boolean f = false;
        try {
            String sql = "select * from user where Id = ? and Password=?";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            psmt.setString(2, ps);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                f = true;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }

    public boolean UpdateProfile(User us) {
        boolean f = false;
        try {
            //inser the query;
            String data = "update user set Name= ? ,Email= ? ,Phone=? where Id=?";
            PreparedStatement psmt = conn.prepareStatement(data);
            psmt.setString(1, us.getName());
            psmt.setString(2, us.getEmail());
            psmt.setString(3, us.getPhone());
            psmt.setInt(4, us.getId());

            int i = psmt.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean checkUser(String em) {
        boolean f = true;
        try {
            //inser the query;
            String data = "select * from user where email=?";
            PreparedStatement psmt = conn.prepareStatement(data);
            psmt.setString(1, em);

            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                f = false;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }

}
