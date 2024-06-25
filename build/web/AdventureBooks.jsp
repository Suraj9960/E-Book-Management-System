
<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/indexPage.css">
        <title>E Book</title>

        <!--css-->
        
    </head>
    <body>

        <%@include file="../Navbar/navbar.jsp" %>

        <br>
    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>
    </c:if>
    <!--second row of book-->

    <div class="container mt-4 mb-4">
        <h4 class="text-center mb-4 active">All Adventure Books</h4>
        <div class="row mb-4">
            <% 
                BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
                List<BookDtls> list = dao.getAllAdventureBook();
                for (BookDtls b : list){
            %>
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
                            if (u == null) {
                        %>
                        <button class="card-button button">
                            <a href="Login.jsp" style="text-decoration: none; color: white;"><i class="fa-solid fa-cart-shopping"></i></a> 
                        </button>
                        <button class="card-button button">
                            <a href="Login.jsp" style="text-decoration: none; color:white;"><i class="fa-regular fa-heart"></i></a> 
                        </button>
                        <%
                        } else {
                        %>
                        <button class="card-button button">
                            <a href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" style="text-decoration: none; color: white;"><i class="fa-solid fa-cart-shopping"></i></a> 
                        </button>
                        <button class="card-button button">
                            <a href="wishlist?b=<%=b.getBookId()%>&&u=<%=u.getId()%>" style="text-decoration: none;color: white;"><i class="fa-regular fa-heart"></i></a> 
                        </button>
                        <%
                            }
                        %>
                        <button class="card-button button">
                            <a href="details.jsp?id=<%=b.getBookId()%>" style="text-decoration: none; color: white;"><i class="fa-solid fa-eye"></i></a>
                        </button>
                    </div>
                </div>
            </div>
            <% }%>
        </div> 
    </div>
         <%@include file="../Navbar/footer.jsp" %>   
</body>
</html>

