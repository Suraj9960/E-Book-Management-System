
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>E Book</title>
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
        <%@include file="../Navbar/navbar.jsp" %>

        <div class="container mt-5">
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <a href="Edit_profile.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-user fa-2x"style="color:red;"></i>
                                <h4>Edit Profile</h4>
                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-4 mb-3">
                    <a href="My_order.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-2x"style="color:red;"></i>
                                <h4>My Order</h4>
                                <font>Track Your Order</font>

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-4 mb-3">
                    <a href="Help.jsp" style="text-decoration: none;color: black;">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-circle-user fa-2x"style="color:blue;"></i>
                                <h4>Help Center</h4>
                                <font>24*7 Service</font>
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
