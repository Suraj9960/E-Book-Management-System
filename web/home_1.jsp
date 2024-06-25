<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="mycss.css">
        <title>Admin Page</title>

        <!--css-->
        <style>
            .card {
                position: relative;
                border-radius:30px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease; /* Space between cards */
                height: 180px; /* Adjust card height */
                margin-top: 100px;
            }
            .card-body{
                margin-top: 30px;
            }

        </style>
    </head>
    <body>
        <%@include file="nav2.jsp" %>
        <br>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <h2 style="text-align:center;">Hello,Admin</h2>
        <div class="container mt-5">
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <a href="Add.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-medical fa-2x"style="color:red;"></i>
                                <h4>Add Books</h4>
                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-4 mb-3">
                    <a href="All_Book.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-open fa-2x"style="color:red;"></i>
                                <h4>All Books</h4>
                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-4 mb-3">
                    <a href="Order.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-gift fa-2x"style="color:blue;"></i>
                                <h4>Order</h4>
                            </div>
                        </div>
                    </a>

                </div>
            </div>
            <!--second row-->
        </div>
        <%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
