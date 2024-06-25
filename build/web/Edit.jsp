<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>

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
        <style>
            .logo img {
                width: 60px;
                height: 60px;

            }
        </style>
    </head>
    <body>
        <%@include file="nav2.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card m-3">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>
                            <div class="logo text-center">
                                <img src="data:image/png;base64,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" alt="">
                            </div>
                            
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
                                BookDtls b = dao.getBook(id);
                            %>



                            <form action="EditServlet" method="post">
                                <input type="hidden"name="id" value="<%=b.getBookId()%>">
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Book Name</label>
                                    <input type="text" name="bname" class="form-control" id="exampleFormControlInput1" value="<%=b.getBookName()%>" >
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Author Name</label>
                                    <input type="text" name="author" class="form-control" id="exampleFormControlInput1" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Price</label>
                                    <input type="number" name="price" class="form-control" id="exampleFormControlInput1" value="<%=b.getPrice()%>">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <%
                                            if ("Active".equals(b.getStatus())) {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                            }
                                        %>

                                        
                                        
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-info" style="margin-left: 30px;width: 80%;">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
