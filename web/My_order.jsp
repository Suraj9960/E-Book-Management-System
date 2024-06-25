<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.OrderDAOImp"%>
<%@page import="com.entity.User"%>
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
        <link rel="stylesheet" href="mycss.css">
        <title>E Book</title>

        <!--css-->
        <style>
            .table-container {
                margin-top: 50px;
                overflow-x: auto; /* Enable horizontal scrolling on small screens */
                padding: 0 20px; /* Add space to the left and right sides */
            }

            table {
                width: 100%;
                border-collapse: collapse;
                border: 2px solid #000; /* Add border around the table */
            }

            th, td {
                padding: 8px;
                border-top: 1px solid #000; /* Add top border for all cells */
            }

            th:first-child,
            td:first-child {
                border-left: 1px solid #000; /* Add left border for the first column */
            }

            th:last-child,
            td:last-child {
                border-right: 1px solid #000; /* Add right border for the last column */
            }

            th {
                background-color: black;
                color: white;
            }


        </style>
    </head>
    <body style="background-color:white;">
        <%@include file="../Navbar/navbar.jsp" %>
    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>

    </c:if>
    <h4 style="text-align:center;padding-top:30px;">All Ordered Books</h4>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                   OrderDAOImp dao = new OrderDAOImp(DBConnect.getConn());
                   List<BookOrder> list = dao.getBook(u.getEmail());

                   for (BookOrder b : list) {
                %>
                <tr>
                    <td scope="row"><%=b.getOrder_id()%></td>
                    <td><%=b.getUsername()%></td>
                    <td><%=b.getBookname() %></td>
                    <td><%=b.getAuthor() %></td>
                    <td><%=b.getPrice() %></td>
                    <td><%=b.getPayment() %></td>

                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
