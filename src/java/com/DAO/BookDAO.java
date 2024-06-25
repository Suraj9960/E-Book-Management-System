/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import java.util.List;
/**
 *
 * @author Shree
 */
public interface BookDAO {
    public boolean add(BookDtls b);
    public List<BookDtls> getAllBook();
    public BookDtls getBook(int id);
    public boolean updateBook(BookDtls b);
    public boolean deleteBook(int id);
    
    public List<BookDtls> getStoryBook();
    public List<BookDtls> getProgrammingBook();
    public List<BookDtls> getFrictionBook();
    public List<BookDtls> getHistoricalBook();
    public List<BookDtls> getAdventureBook();
    
    public List<BookDtls> getAllStoryBook();
    public List<BookDtls> getAllProgrammingBook();
    public List<BookDtls> getAllFrictionBook();
    public List<BookDtls> getAllHistoricalBook();
    public List<BookDtls> getAllAdventureBook();
 
    public BookDtls ViewBook(int id);
    public List<BookDtls> getBookSearch(String ch);
    
}
