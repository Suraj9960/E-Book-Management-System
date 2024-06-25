<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>E Book</title>

        <!--css-->
        <style>
            body{
                margin: 0;
                padding: 0;
            }
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
                text-align: center;
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
                color: black;
                text-align: center;

            }
            td {
                text-align: center;
            }


        </style>
    </head>
    <body>
        <%@include file="nav2.jsp" %>

    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>
    </c:if>
    <c:if test="${not empty succMsg}">
        <p class="text-center text-succes mt-4">${succMsg}</p>
        <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failedMsg}">
        <p class="text-center text-danger mt-4">${failedMsg}</p>
        <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <div class="class mt-4 mb-3">
        <h3 class="text-center">All Available Books</h3>

    </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th>Book Categories</th>
                    <th>Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <!--logic for display all the books-->
                <%
//                       
                    BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
                    List<BookDtls> list = dao.getAllBook();
                    for (BookDtls b : list) {
                %>
                <tr>
                    <td><%=b.getBookId()%></td>
                    <td><img src="BOOK/<%=b.getPhotoName()%>" style="width:50px; height: 50px;"></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td>
                        <a href="Edit.jsp?id=<%=b.getBookId()%>" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i></a>&nbsp;
                        <a href="delete?id=<%=b.getBookId()%>" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                </tr>

                <%

                    }
                %>
            </tbody>
        </table>
</body>
</html>
