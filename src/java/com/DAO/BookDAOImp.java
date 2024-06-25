/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shree
 */
public class BookDAOImp implements BookDAO {

    private Connection conn;

    public BookDAOImp(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean add(BookDtls b) {
        boolean f = false;

        try {
            String sql = "insert into book(bookname,author,price,bookCategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, b.getBookName());
            psmt.setString(2, b.getAuthor());
            psmt.setString(3, b.getPrice());
            psmt.setString(4, b.getBookCategory());
            psmt.setString(5, b.getStatus());
            psmt.setString(6, b.getPhotoName());
            psmt.setString(7, b.getEmail());

            int i = psmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }
//    for getting all books

    public List<BookDtls> getAllBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book";
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName (rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
        } catch (Exception er) {
            er.printStackTrace();
        }

        return list;
    }

    public BookDtls getBook(int id) {
        BookDtls b = null;
        try {
            String sql = "select * from book where bookId =?";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        } catch (Exception er) {
            er.printStackTrace();
        }

        return b;

    }

    public boolean updateBook(BookDtls b) {
        boolean f = false;
        try {
//            write the sql query
            String sql = "Update book set bookName=?,author=?,price=?,status=? where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());

            int res = ps.executeUpdate();
            if (res == 1) {
                f = true;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }

    public boolean deleteBook(int id) {
        boolean f = false;
        try {
            String sql = "delete from book where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return f;
    }

    public List<BookDtls> getStoryBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Story");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getProgrammingBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Programming");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getFrictionBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Friction");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getHistoricalBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Historical");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getAdventureBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Adventure");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
//    Getting List of books
    public List<BookDtls> getAllStoryBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Story");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
      
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getAllProgrammingBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Programming");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
      
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getAllFrictionBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Friction");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
      
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getAllHistoricalBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Historical");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
      
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    public List<BookDtls> getAllAdventureBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Adventure");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
      
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
    
    public BookDtls ViewBook(int id) {
        BookDtls b = null;
        try {
            String sql = "select * from book where bookId =?";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        } catch (Exception er) {
            er.printStackTrace();
        }

        return b;

    }
    public List<BookDtls> getBookSearch(String ch){
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book  where bookName like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"%"+ ch +"%");
            ps.setString(2, "%"+ ch +"%");
            ps.setString(3, "%"+ ch +"%");
            ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception er) {
            er.printStackTrace();
        }
        return list;
    }
}

