<%-- 
    Document   : Cart
    Created on : 19-Nov-2023, 6:00:19 pm
    Author     : Shree
--%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.entity.BookDtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImp"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>Cart Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                margin: 20px;
                font-family: Arial, sans-serif;
            }

            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }

            .card {
                flex: 1;
                background-color:white;
                border-radius:0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-top: 20px;
            }

            .big-card {
                flex: 2;
            }

            @media screen and (max-width: 768px) {
                .container {
                    flex-direction: column;
                    align-items: center;
                }

                .card {
                    flex: 1 1 100%;
                    margin-top: 10px;
                }

                .big-card {
                    flex: 1 1 100%;
                }
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty succ}">
            <div class="alert alert-success text-center" role="alert"><b>${succ}</b></div>
                    <c:remove var="succ" scope="session"/>
                </c:if>
                <c:if test="${not empty failed}">
            <div class="alert alert-danger text-center" role="alert"><b>${failed}</b></div>
                    <c:remove var="failed" scope="session"/>
                </c:if>

        <%@include file="../Navbar/navbar.jsp" %>
        <div class="container">
            <div class="card big-card">
                <div class="card-body">

                    <h5 style="text-align: center;color:black; font-weight:600;font-family: Arial, sans-serif;">MY CART</h5>
                    <br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Book Id</th>
                                <th scope="col">Book Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                CartDAOImp dao = new CartDAOImp(DBConnect.getConn());
                                List<Cart> cart1 = dao.getBookByUser(u.getId());
                                double total = 0;
                                for (Cart a : cart1) {
                                    total = a.getTotal();
                                    BookDAOImp da = new BookDAOImp(DBConnect.getConn());
                                    BookDtls b = da.getBook(a.getBid());
                            %>
                            <tr>
                                <td><%=a.getCid() %></td>
                                <td><%=a.getBookName()%></td>
                                <td><%=a.getAuthor()%></td>
                                <td><%=a.getPrice()%></td>
                                

                                <td><a href="remove?bid=<%=a.getBid()%>&&uid=<%=a.getUid()%>">
                                        <i class="fa-solid fa-trash-can-arrow-up" style="color: #db2e0f;font-size: 18px;"></i>
                                    </a>
                                </td>
                            </tr>


                            <%

                                }
                            %>
                            <tr>
                                
                            </tr>


                        </tbody>
                    </table>


                </div>


            </div>
            <div class="card " style="height: 300px;">
                <div class="modal-header">
                    <h5 class="modal-title">Cart Totals</h5>
                </div>
                <div class="modal-header">
                    <P><h6>Total Price :</h6><%=total%></P>
                </div>
                <div class="modal-footer">
                    <a href="checkout.jsp" class="btn">Proceed To Checkout</a>
                </div>


            </div>
        </div>

    </body>
</html>
