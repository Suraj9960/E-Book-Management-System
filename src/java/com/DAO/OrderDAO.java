/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.BookOrder;
import java.util.List;

/**
 *
 * @author Shree
 */
public interface OrderDAO {
    public int getOrderNO();
    public boolean saveOrder(List<BookOrder> blist);
    public List<BookOrder>getBook(String email);
    public List<BookOrder>getBook();
}
