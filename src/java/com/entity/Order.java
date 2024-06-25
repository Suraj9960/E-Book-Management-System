/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Shree
 */
public class Order {
    private int Id;
    private String order_Id;
    private String username;
    private String email;
    private String phone;
    private String address;
    private String bookname;
    private String author;

    @Override
    public String toString() {
        return "Order{" + "Id=" + Id + ", order_Id=" + order_Id + ", username=" + username + ", email=" + email + ", phone=" + phone + ", address=" + address + ", bookname=" + bookname + ", author=" + author + ", price=" + price + ", payment=" + payment + '}';
    }

    public Order(String order_Id, String username, String email, String phone, String address, String bookname, String author, String price, String payment) {
        this.order_Id = order_Id;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.bookname = bookname;
        this.author = author;
        this.price = price;
        this.payment = payment;
    }
    private String price;
    private String payment;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getOrder_Id() {
        return order_Id;
    }

    public void setOrder_Id(String order_Id) {
        this.order_Id = order_Id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
    
}
