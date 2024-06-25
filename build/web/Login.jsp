<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="CSS/loginPage.css"/>
        <title>E Book</title>

    </head>
    <body>
        <%@include file="../Navbar/navbar.jsp" %>
        <!--login start-->
        <div class="wrapper" style="border:1px solid black;">
        <div class="logo">
            <img src="data:image/jpeg;base64,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" alt="">
        </div>
        <div class="text-center mt-4 name">
            Login Page
        </div>
            <!--displaying failed message-->
            <c:if test="${not empty failedMsg}">
                <p class="text-center text-danger">${failedMsg}</p>
                <c:remove scope="session" var="failedMsg"/>   
            </c:if>
                
                <c:if test="${not empty succMsg}">
                <p class="text-center text-danger">${succMsg}</p>
                <c:remove scope="session" var="succMsg"/>   
            </c:if>
            <form class="p-3 mt-3" action="Login" method="Post">
             <div class="form-field d-flex align-items-center">
                    <span class="fa-solid fa-envelope"></span>
                    <input type="email" name="email" id="emailId" placeholder="Enter Email Id Here" required="required" style="font-size:13px;color:red;">
                </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="pwd" placeholder="Password" required="required"  style="font-size:13px;color:red;">
            </div>
            <button class="btn mt-3">Login</button>
        </form>
        <div class="text-center fs-6">
            <font class="res">Not registered yet?<font><a href="Register.jsp">Create an account&nbsp;<i class="fa-solid fa-arrow-up-right-from-square"></i></a>
        </div>
    </div>

    </body>
</html>
