<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>HomePage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet"  href="CSS/indexPage.css" >
    </head>
    <body>
        <!--Code for getting all book with category from database-->
        <%
            User us = (User)session.getAttribute("userobj");
            Connection conn = DBConnect.getConn();
            BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
            List<BookDtls> list1 = dao.getStoryBook();
            List<BookDtls> list2 = dao.getProgrammingBook();
            List<BookDtls> list3 = dao.getFrictionBook();
            List<BookDtls> list4 = dao.getAdventureBook();
            List<BookDtls> list5 = dao.getHistoricalBook();
            List<BookDtls> allBook = dao.getAllBook(); 
        %>

        <%@include file="../Navbar/navbar.jsp" %>
        <c:if test="${not empty succ}">
            <div class="alert alert-success text-center mt-4" role="alert"><b>${succ}</b></div>
                    <c:remove var="succ" scope="session"/>
                </c:if>
                <c:if test="${not empty failed}">
            <div class="alert alert-danger text-center" role="alert"><b>${failed}</b></div>
                    <c:remove var="failed" scope="session"/>
                </c:if>
        <!--<!-- Card 1 -->
        <div class="container mt-4 mb-4">
            <div class="row mb-4">
                <% for (BookDtls b : allBook) {%>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="BOOK/<%=b.getPhotoName()%>" width="150px" height="200px" alt="alt"/>
                            <p style="padding-top:5px;"><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                        </div>
                        <div class="card-buttons">
                            <%
                                if (us == null) {
                            %>
                            <button class="card-button button">
                                <a href="Login.jsp" style="text-decoration: none; color: white; "><i class="fa-solid fa-cart-shopping"></i></a> 
                            </button>
                            <button class="card-button button">
                                <a href="Login.jsp" style="text-decoration: none; color: white;"><i class="fa-regular fa-heart"></i></a> 
                            </button>
                            <button class="card-button button">
                                <a href="Login.jsp" style="text-decoration: none; color: white;"><i class="fa-solid fa-eye"></i></a>
                            </button>
                            <%
                            } else {

                            %>

                            <button class="card-button button">
                                <a href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" style="text-decoration: none; color: white;"><i class="fa-solid fa-cart-shopping"></i></a> 
                            </button>
                            <button class="card-button button">
                                <a href="wishlist?b=<%=b.getBookId()%>&&u=<%=u.getId()%>" style="text-decoration: none; color: white;"><i class="fa-regular fa-heart"></i></a> 
                            </button>
                            <button class="card-button button">
                                <a href="details.jsp?id=<%=b.getBookId()%>" style="text-decoration: none; color: white;"><i class="fa-solid fa-eye"></i></a>
                            </button>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <% }%>
            </div> 
        </div>
        
            
                <%@include file="../Navbar/footer.jsp" %>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const heartIcons = document.querySelectorAll('.heart-icon');

                heartIcons.forEach(icon => {
                    icon.addEventListener('click', function () {
                        icon.classList.toggle('active');
                    });
                });
            });
        </script>

    </body>
</html>

