<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DAO.BookDAOImp" %>
<%@ page import="java.sql.Connection" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
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
            /* CSS for layout */
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: flex-start;
                height: 100vh;
                margin-top: 50px; /* Add margin from the top */
            }

            .image-container {
                flex: 1 1 100%;
                max-width: 400px; /* Limit image width for smaller screens */
                margin-bottom: 20px; /* Add some space between image and details on smaller screens */
            }

            .details-container {
                flex: 1 1 100%;
                max-width: 400px; /* Limit details width for smaller screens */
                padding: 0 20px;
            }

            .details-container h3 {
                font-size: 26px;
                font-family: "DM sans";
                color:#413E65;
                font-weight: 600;
            }

            .details-container p {
                margin-bottom: 20px;
                font-weight: 400;
            }

            .details-container button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
            }
            .details-container p font{
                font-size: 22.5px;
                font-family: "DM sans";
                color: #52506A;
            }
            .btn{
                border-radius: 50px;
                width: 80%;
            }
            .option p{
                font-size: 16px;
                font-weight: 600;

            }
            b{
                font-weight: 200;
                margin-right: 10px;

            }
            /* Media query for smaller screens */
            @media (min-width: 900px) {
                .container {
                    justify-content: space-around;
                }

                .image-container {
                    margin-bottom: 0px; /* Remove margin for larger screens */
                }
                .container{
                    margin-bottom: 0;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="../Navbar/navbar.jsp" %>
        <div class="container">
            <%

                int id = Integer.parseInt(request.getParameter("id"));
                BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
                BookDtls b = dao.ViewBook(id);
            %>
            <div class="image-container">
                <img src="BOOK/<%=b.getPhotoName()%>" alt="Placeholder Image" width="400">
            </div>
            <div class="details-container mb-4">
                <h3><%=b.getBookName()%></h3>
                <div class="option mt-4">
<!--                    <p><b>Publisher</b><%=b.getAuthor()%></p>
                    <p><b>Category</b><%=b.getBookCategory()%></p>
                    <p><b>Status</b><%=b.getStatus()%></p> 
                    <p><b>Price</b><%=b.getPrice()%></p>-->
                    <div class="row">
                        <div class="col-md-4">
                            <p><b>Publisher</b></p>
                            <p><b>Category</b></p>
                            <p><b>Status</b></p> 
                            <p><b>Price</b></p>
                        </div>
                        <div class="col-md-6">
                            <p><%=b.getAuthor()%></p>
                            <p><%=b.getBookCategory()%></p>
                            <p><%=b.getStatus()%></p> 
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>&nbsp;<%=b.getPrice()%></p>
                        </div>
                    </div>
                </div>

                <a href="Cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-outline-danger mb-3">Add To Cart</a>
            </div>
        </div>
            <%@include file="../Navbar/footer.jsp" %>
    </body>
</html>
