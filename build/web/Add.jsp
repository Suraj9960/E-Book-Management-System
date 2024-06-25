<%-- 
    Document   : Recent
    Created on : 07-Oct-2023, 4:31:40 pm
    Author     : Shree
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
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
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card m-3">
                        <div class="card-body">
                            <h4 class="text-center mb-3">Add Books</h4>
                            <div class="logo text-center">
                                <img src="data:image/png;base64,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" alt="">
                            </div>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="AddBook" method="post" enctype="multipart/form-data">
                                
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Book Name</label>
                                    <input type="text" name="bname" class="form-control" id="exampleFormControlInput1" >
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Author Name</label>
                                    <input type="text" name="author" class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Price</label>
                                    <input type="number" name="price" class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputState">Book Categories</label>
                                    <select id="inputState" name="categories" class="form-control">
                                        <option selected="">Select Book Category</option>
                                        <option value="Story">Story Book</option>
                                        <option value="Programming">Programming Book</option>
                                        <option value="Friction">Friction Book</option>
                                        <option value="Adventure">Adventure Book</option>
                                        <option value="Historical">Historical Book</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <option selected="">Select Book Status</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1">

                                </div>
                                <button type="submit" class="btn btn-success text-center" style="margin-left:30px;border-radius: 25px;width: 80%;">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
