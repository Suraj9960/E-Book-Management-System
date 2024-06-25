/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

public class User {
    private int Id;
    private String Name;
    private String Email;
    private String Phone;
    private String Password;
    private String Photo;

    public String getPhoto() {
        return Photo;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }
//    default constructor
    public User() {
        super();
    }
//getter and setter
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
//    to string method

    @Override
    public String toString() {
        return "User{" + "Id=" + Id + ", Name=" + Name + ", Email=" + Email + ", Phone=" + Phone + ", Password=" + Password + ", Photo=" + Photo + '}';
    }

    
    
    
    
    
}
