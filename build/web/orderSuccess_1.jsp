<%-- 
    Document   : Cart
    Created on : 19-Nov-2023, 6:00:19 pm
    Author     : Shree
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="mycss.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <title>E Book</title>
        <style>

        </style>
    </head>
    <body>
        <%@include file="../Navbar/navbar.jsp" %>
       
        <br>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        
        <br>
         <div class="container">

            <div class="row">
                <div class="col-md-6 offset-md-3">
                   
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-circle-check fa-3x" style="color: #217f15;"></i><br><br>
                               <h3>Thank You</h4>
                               <h5>Your Order Placed Successfully</h5>
                               <font>Within 7 Days Your Order is Delivered</font>
                               <br><!-- comment --><br>
                               <a href="index.jsp" class="btn btn-success">Home</a>
                            </div>
                        </div>
                    

                </div>

            </div>
        </div>
        <br><br>
 <%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
