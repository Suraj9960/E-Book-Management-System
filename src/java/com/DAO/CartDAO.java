/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.WishList;
import java.util.List;

/**
 *
 * @author Shree
 */
public interface CartDAO {
    public boolean add(Cart c);
    public List<Cart> getBookByUser(int id);
    public boolean deleteBook(int bid, int uid);
    public boolean deleteBookW(int bid, int uid);
    public boolean addWishlist(Cart l);
}
