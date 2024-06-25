<%@ page import="com.entity.BookDtls, com.entity.Cart, com.DAO.BookDAOImp, com.DAO.CartDAOImp, com.entity.User, com.DB.DBConnect" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="CSS/indexPage.css">
    <title>E Book</title>
</head>
<body>
    <%@include file="../Navbar/navbar.jsp" %>
    <c:if test="${not empty succ}">
        <div class="alert alert-success text-center" role="alert"><b>${succ}</b></div>
        <c:remove var="succ" scope="session"/>
    </c:if>
    <c:if test="${not empty failed}">
        <div class="alert alert-danger text-center" role="alert"><b>${failed}</b></div>
        <c:remove var="failed" scope="session"/>
    </c:if>
    <br>
    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>
    </c:if>
    <div class="container mt-4 mb-4">
        <h4 class="text-center mb-4 active">MY WISHLIST</h4>
        <div class="row mb-4">
            <%
                User user = (User) session.getAttribute("userobj");
                if (user != null) {
                    CartDAOImp dao = new CartDAOImp(DBConnect.getConn());
                    List<Cart> cart = dao.getBookByUser1(user.getId());
                    if (cart != null && !cart.isEmpty()) {
                        for (Cart a : cart) {
                            BookDAOImp da = new BookDAOImp(DBConnect.getConn());
                            BookDtls b = da.getBook(a.getBid());
                            if (b != null) {
            %>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <!-- Update the image source based on your file structure -->
                        <img src="BOOK/<%= b.getPhotoName() %>" width="150px" height="200px" alt="Book Image"/>
                        <p style="padding-top:5px;"><%= a.getBookName() %></p>
                        <p><%= a.getAuthor() %></p>
                        <p>Categories:<%= b.getBookCategory() %></p>
                    </div>
                    <div class="card-buttons">
                        <button class="card-button button">
                            <a href="Cart?bid=<%= b.getBookId() %>&&uid=<%= user.getId() %>" style="text-decoration: none; color: white;"><i class="fa-solid fa-cart-shopping"></i></a> 
                        </button>
                        <button class="card-button button">
                            <a href="orderSuccess_1.jsp" style="text-decoration: none;color:gold;"><i class="fa-solid fa-bag-shopping"></i></a> 
                        </button>
                        <button class="card-button button">
                            <a href="bookRemove?b=<%= a.getBid() %>&&u=<%= a.getUid() %>" style="text-decoration: none; color: red;"><i class="fa-solid fa-trash"></i></a>
                        </button>
                    </div>
                </div>
            </div>
            <%
                            }
                        }
                    }
                }
            %>
        </div> 
    </div>
        <%@include file="../Navbar/footer.jsp" %>
</body>
</html>
