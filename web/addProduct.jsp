<%-- 
    Document   : addProduct.jsp
    Created on : Mar 10, 2022, 5:38:22 PM
    Author     : Phi Long
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="sample.DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>   
        <title>AddProduct Page</title>
    </head>
    <body>

        <%UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <%  if (user == null || "US".equals(user.getRole()) == true) {
                response.sendRedirect("home.jsp");
            } else {%>

        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container row" id="heading">
                <a class="navbar-brand col-sm-6 mb-5" href="home.jsp"><h2>Kudamono Shoppu</h2></a>


                <div class="collapse navbar-collapse justify-content-end col-sm-6 " id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto ml-4 ">
                        <li class="nav-item ml-4">
                            <%if (session.getAttribute("LOGIN_USER") != null) {%>
                            <div  class="nav-link mt-1">
                                <h4>
                                    <span>
                                        <a class="nav-link" href="user.jsp"><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}</a> 
                                    </span>                                       
                                </h4>  
                            </div>

                            <%} else {%>
                            <a class="nav-link mt-1" href="login.jsp"><h4>Login</h4></a>
                            <%}%>
                        </li>
                        <li>
                            <div>
                                <%if (session.getAttribute("LOGIN_USER") != null) {%>
                                <div  class="nav-link ">
                                    <form action="MainController" method="POST">
                                        </ul>
                                        <li class="nav-item">
                                            <button class="btn btn-success  ml-3 mt-2" type="submit" name="action" value="LogOut"><span><i class="fa fa-sign-out" aria-hidden="true">|LogOut </i>  </span> </button>
                                        </li> 
                                        </ul>
                                    </form>
                                    <%}%>                           
                                </div>
                            </div>
                        </li>
                    </ul>  
                </div>
        </nav>

        <div class="">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Manage <b>Product</b></h2>
                        </div>


                        <div class="col-sm-4">
                            <a href="admin.jsp"  class="btn btn-success mr-2" ><i class="material-icons"></i> <span>Back to admin page</span></a>                       					
                        </div>
                    </div>
                </div>

                <div >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="MainController" method="POST">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add product</h4>

                                </div>
                                <div class="modal-body">					

                                    <div class="form-group">
                                        <label>Name (varchar(40))</label>${requestScope.ADD_PRODUCT_ERROR.name}
                                        <input type="text"name="ProductName" value="${param.ProductName}" class="form-control" required placeholder="varchar(40)">
                                    </div>
                                    <div class="form-group">
                                        <label>Image (nvarchar(max))</label>${requestScope.ADD_PRODUCT_ERROR.image}
                                        <input type="text" name="ProductImage" value="${param.ProductImage}" class="form-control" required placeholder="nvarchar(max)">
                                    </div>
                                    <div class="form-group">
                                        <label>Price (float)</label>${requestScope.ADD_PRODUCT_ERROR.price}
                                        <input type="number" name="ProductPrice"class="form-control" value="${param.ProductPrice}"  required placeholder="float">
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity (int)</label>${requestScope.ADD_PRODUCT_ERROR.quantity}
                                        <input type="number" name="ProductQuantity" class="form-control"  value="${param.ProductQuantity}" required placeholder="int">
                                    </div>

                                    <div class="form-group">
                                        <label>Category (choose form database)</label>${requestScope.ADD_PRODUCT_ERROR.category}<br>
                                        <select name ="ProductCategory">
                                            <%
                                                ArrayList<String> categoryList = (ArrayList<String>) session.getAttribute("CategoryList");
                                                for (int j = 0; j < categoryList.size(); j++) {%>
                                            <option value="<%=categoryList.get(j)%>"><%=categoryList.get(j)%> </option>                                        
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>ImportDate (YYYY-MM-DD)</label>${requestScope.ADD_PRODUCT_ERROR.importDate}
                                        <input type="text"name="ProductImportDate" class="form-control" value="${param.ProductImportDate}"  required placeholder="YYYY-MM-DD">
                                    </div>
                                    <div class="form-group">
                                        <label>UsingDate (YYYY-MM-DD)</label>${requestScope.ADD_PRODUCT_ERROR.usingDate}
                                        <input type="text"name="ProductUsingDate" class="form-control" value="${param.ProductUsingDate}"  required placeholder="YYYY-MM-DD">
                                    </div>
                                    <h1>
                                        ${requestScope.ADD_SUCCESS}
                                        ${requestScope.ADD_PRODUCT_ERROR.errorMessage}
                                    </h1>
                                </div>
                                <div class="modal-footer">
                                    <input  class="mr-4" type="reset" class="btn btn-default" data-dismiss="modal" value="Reset">
                                    <span> | </span>
                                    <input class="ml-4" type="submit" name="action" class="btn btn-info" value="AddProduct">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>
                </body>
                </html>
