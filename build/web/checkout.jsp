<%-- 
    Document   : checkout
    Created on : 09-Feb-2024, 8:08:34 pm
    Author     : Shree
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>Navbar's Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            .container{
                margin-top: 100px;
            }
            .c {
                margin-left: 30px;
            }


        </style>

    </head>
    <body>
        <%@include file="../Navbar/navbar.jsp" %>
        <div class="container">
            <div class='row'>
                <div class='col-md-7 mb-4'>
                    <div class="card">
                        <div class="card-body">

                            <h3 style="text-align: center;color:#413E65;">Customer Information</h3>
                            <br>
                            <form action="OrderServlet" method="post">
                                <input type="hidden" value="${userobj.id}"  name="userId">
                                <div class="row">

                                    <div class="col">
                                        <label>Name</label>
                                        <input type="text" name="name" class="form-control" value="${userobj.name}">
                                    </div>
                                    <div class="col">
                                        <label>Email</label>
                                        <input type="text" name="email" class="form-control" value="${userobj.email}">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col">
                                        <label>Mobile No</label>
                                        <input type="number" name="phno" class="form-control" value="${userobj.phone}">
                                    </div>
                                    <div class="col">
                                        <label>Address</label>
                                        <input type="text" name="address" class="form-control" required="required">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col">
                                        <label>Landmark</label>
                                        <input type="text" name="landmark" class="form-control" required="required">
                                    </div>
                                    <div class="col">
                                        <label>City</label>
                                        <input type="text" name="city" class="form-control" required="required">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col">
                                        <label>State</label>
                                        <input type="text" name="state" class="form-control" required="required">
                                    </div>
                                    <div class="col">
                                        <label>Pin Code</label>
                                        <input type="number" name="pincode" class="form-control" required="required">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Payment Method</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="payment" required="required">
                                        <option value="noselect" required="required">-- Select One --</option>
                                        <option value="COD" required="required">Cash on Delivery</option>
                                        <option value="Online" required="required">Online Payment</option>

                                    </select>
                                </div>
                                <br>
                                <br>
                                <div class='text-center'>
                                    <button class="btn btn-warning">Place Order</button> &nbsp;&nbsp;&nbsp;
                                    <a href="index.jsp" class='btn btn-success'>Continue Shopping</a>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>

                <div class='col-md-5 mb-4'>
                    <div class="card">


                        <div class="card-body">

                            <h5 style="text-align: center;color:black; font-weight:600;font-family: Arial, sans-serif;">Your Order</h5>
                            <br>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Id</th>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Price</th>
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
                                        <td><%=a.getPrice()%></td>

                                    </tr>


                                    <%

                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><b>Total Price:</b> </td>
                                        <td><%=total%></td>
                                    </tr>


                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>               
            </div>
        </div>
        <%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
