
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@page import="com.DAO.UserDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%-- 
    Document   : newPage.jsp
    Created on : 06-Feb-2024, 7:59:03 pm
    Author     : Shree
--%>

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
            .navbar {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow to navbar */
            }
            .nav-link{
                font-weight: 600;
                margin: 7px;
                font-family:'Times New Roman', serif;

            }
            .navbar-brand{
                margin: 10px;
            }
            .dropdown-menu li{
                margin: 10px;
            }
            .dropdown-menu li a{
                font-weight: 600;
                font-family:'Times New Roman', serif;
                color:#413E65;
            }
            .dropdown-menu{
                border-top:5px solid #413e65;
            }
            /* Custom CSS for positioning the modal */
            /* Custom CSS for positioning the modal */
            .modal.right .modal-dialog {
                position: fixed;
                top:0; /* Adjust top position according to your navbar height */
                right: 0;
                margin: 0;
                width:80vw;
            }

            /* Adjust modal body height */
            .modal-body {
                height: 560px; /* Adjust height as needed */
                overflow-y: auto; /* Enable vertical scrolling if content exceeds height */
            }
            .modal-title{
                font-family:'Times New Roman', serif;
                font-size: 16px;
                font-weight: 600;
            }
            .modal-footer .btn {
                width: calc(100% - 40px); /* Button width, subtracting margins from left and right */
                margin-left: 20px; /* Left margin */
                margin-right: 20px; /* Right margin */
                border-radius: 0;
                font-weight: 600;
                font-family: "Gill Sans Extrabold", sans-serif;
                background-color:#413E65;
                color: white;
                font-size: 12px;

            }

            .modal-footer {
                margin-bottom: 30px; /* Bottom margin */
            }
            .navbar-nav .dropdown:hover .dropdown-menu {
                display: block;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }

            /* Custom CSS for search bar */
            .search-container {
                position: relative;
                display: inline-block;
            }

            .search-input {
                display: none;
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                width: 200px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                z-index: 9999;
            }

            .search-input.active {
                display: block;
            }
            .ing img {
                border-radius: 50%;
                border:3px solid #413e65;
            }
            .tag{
                margin-right: 20px;
            }
        </style>
    </head> 
    <body>
        <%
            User u = (User) session.getAttribute("userobj");
            UserDaoImp d = new UserDaoImp(DBConnect.getConn());
        %>
        <!-- Navbar Module -->
        <nav class="navbar navbar-expand-sm navbar-light "style="background-color:white;">
            <div class="container-fluid">
                <div class="mx-auto">
                    <a class="navbar-brand " href="#">
                        <img src="data:image/png;base64,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" height="55px" width="170px"/>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <div class="mx-auto">
                    </div>
                    <ul class="navbar-nav me-auto order-0 ">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item  dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                Shop by Category
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="StoryBooks.jsp">Story Books</a></li>
                                <li><a class="dropdown-item" href="ProgrammingBooks.jsp">Programming Books</a></li>
                                <li><a class="dropdown-item" href="AdventureBooks.jsp">Adventure Books</a></li>
                                <li><a class="dropdown-item" href="HistoricalBooks.jsp">Historical Books</a></li>
                                <li><a class="dropdown-item" href="FrictionBooks.jsp">Friction Books</a></li>

                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Contact.jsp">Contact Us</a>
                        </li>

                    </ul>

                    <div class="mx-auto">
                        <ul class="navbar-nav me-auto order-0 ">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">
                                    <div class="search-container">
                                        <form action="Search.jsp">
                                            <span class="bi bi-search" id="searchIcon"></span>
                                            <input type="search" class="search-input" id="searchInput" placeholder="Search..."aria-label="Search" name="ch">
                                        </form>
                                    </div>
                                </a>
                            </li>

                            <li class="nav-item  dropdown">
                                <a class="nav-link active" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa-solid fa-user"></i>
                                </a>
                                <%
                                    if (u == null) {
                                %>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="Login.jsp"><i class="fa-solid fa-user"></i>&nbsp;Hello,Sign In</a></li>
                                    <li><a class="dropdown-item" href="Login.jsp"><i class="fa-solid fa-user-pen"></i>&nbsp;Edit Profile</a></li>
                                    <li><a class="dropdown-item" href="Login.jsp"><i class="fa-solid fa-gear"></i>&nbsp;Setting & Privacy</a></li>
                                    <li><a class="dropdown-item" href="Login.jsp"><i class="fa-solid fa-heart"></i>&nbsp;My Wishlist</a></li>

                                </ul>
                                <%
                                } else {

                                %>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">
                                            <%                                                User nuser = d.getUser(u.getId());
                                            %>
                                            <p class="ing">
                                                <img src="USER/<%=nuser.getPhoto()%>"/>
                                            </p><i class="fa-solid fa-user"></i>&nbsp;<%=nuser.getName()%>
                                        </a></li>
                                    <li><a class="dropdown-item" href="Edit_profile.jsp"><i class="fa-solid fa-user-pen"></i>&nbsp;Edit Profile</a></li>
                                    <li><a class="dropdown-item" href="Setting.jsp"><i class="fa-solid fa-gear"></i>&nbsp;Setting & Privacy</a></li>
                                    <li><a class="dropdown-item" href="wishlist.jsp"><i class="fa-solid fa-heart"></i>&nbsp;My Wishlist</a></li>
                                    <li><a class="dropdown-item" href="logout"><i class="fa-solid fa-right-from-bracket"></i>&nbsp;Logout</a></li>
                                </ul>
                                <%                                    }
                                %>

                            </li>
                            <%
                                if (u == null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link active" href="Login.jsp">
                                    <i class="fa-solid fa-cart-plus"></i>
                                </a>
                            </li>
                            <%
                            } else {
                            %>
                            <li class="nav-item">
                                <a class="nav-link active" href="Cart.jsp">
                                    <i class="fa-solid fa-cart-plus"></i>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>

                    </div>
                </div>
            </div>
        </nav>

        <!-- Cart Module -->




        <!-- Bootstrap JavaScript -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JavaScript to open modal when link is clicked -->
        <script type="text/javascript">
            $("#btn").on('click', function () {
                $("#exampleModalLong").modal('show');
            })
        </script>
        <script>

            document.getElementById('searchIcon').addEventListener('click', function () {
                var searchInput = document.getElementById('searchInput');
                searchInput.classList.toggle('active');
                if (searchInput.classList.contains('active')) {
                    searchInput.focus(); // Focus on input field when it becomes visible
                }
            });

            // Close search input when user clicks outside of it
            window.addEventListener('click', function (event) {
                var searchContainer = document.querySelector('.search-container');
                var searchInput = document.getElementById('searchInput');
                if (!searchContainer.contains(event.target) && !searchInput.contains(event.target)) {
                    searchInput.classList.remove('active');
                }
            });

        </script>




    </body>
</html>
