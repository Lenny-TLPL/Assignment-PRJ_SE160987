<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : Phi Long
--%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="sample.DTO.ProductDTO"%>
<%@ page import="sample.DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>   
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <%UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <%  if (request.getAttribute("PRODUCT_LIST") == null) {
                response.sendRedirect("MainController");
            } else if (user == null || "US".equals(user.getRole()) == true) {
                response.sendRedirect("home.jsp");
            } else {%>

        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container row" id="heading">
                <a class="navbar-brand col-sm-6 mb-4" href="home.jsp"><h2>Kudamono Shoppu</h2></a>


                <div class="collapse navbar-collapse justify-content-end col-sm-6" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto ml-4">
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
                    </ul>

                    <%if (session.getAttribute("LOGIN_USER") != null) {%>
                    <div  class="nav-link">
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
        </nav>

        <div class="">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Manage <b>Product</b></h2>
                        </div>

                        <div class="col-sm-4">
                            <%   if (session.getAttribute("DELETE_ERROR") != null) {
                                    String deleteError = (String) session.getAttribute("DELETE_ERROR");
                                    session.removeAttribute("DELETE_ERROR");
                                    out.println(deleteError);
                                }%>
                        </div>
                        <div class="col-sm-4">
                            <a href="addProduct.jsp"  class="btn btn-success mr-2" ><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>                       					
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</br>${sessionScope.UPDATE_PRODUCT_ERROR.name}</th>
                            <th>Image</br>${sessionScope.UPDATE_PRODUCT_ERROR.image}</th>
                            <th>Price</br>${sessionScope.UPDATE_PRODUCT_ERROR.price}</th>
                            <th>Quantity</br>${sessionScope.UPDATE_PRODUCT_ERROR.quantity}</th>
                            <th>Category</br>${sessionScope.UPDATE_PRODUCT_ERROR.category}</th>
                            <th>ImportDate</br>${sessionScope.UPDATE_PRODUCT_ERROR.importDate}</th>
                            <th>UsingDate</br>${sessionScope.UPDATE_PRODUCT_ERROR.usingDate}</th>
                            <th>Actions</br>${sessionScope.UPDATE_PRODUCT_ERROR.errorMessage}${requestScope.UPDATE_SUCCESS}</th>
                        </tr>
                    </thead>
                    <%session.removeAttribute("UPDATE_SUCCESS");
                        session.removeAttribute("UPDATE_PRODUCT_ERROR");%>
                    <tbody>
                        <%  ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("PRODUCT_LIST");
                            if (productList != null) {
                                if (productList.size() > 0) {
                                    for (int i = 0; i < productList.size(); i++) {%>
                    <form action="MainController" method="POST">

                        <tr>
                            <td> <input type="text" name="ProductID" value="<%=productList.get(i).getID()%>" readonly="readonly"/></td>
                            <td> <input type="text" name="ProductName" value="<%=productList.get(i).getName()%>" required="" /> </td>
                            <td> <input type="text" name="ProductImage" value="<%=productList.get(i).getImage()%>" required=""/></td>
                            <td> <input type="number" name="ProductPrice" value="<%=productList.get(i).getPrice()%>" required=""/></td>
                            <td> <input type="number" name="ProductQuantity" value="<%=productList.get(i).getQuantity()%>" required=""/></td>
                            <td>
                                <select name ="ProductCategory">                                   
                                    <%
                                        ArrayList<String> categoryList = (ArrayList<String>) session.getAttribute("CategoryList");
                                        for (int j = 0; j < categoryList.size(); j++) {%>

                                    <option value="<%=categoryList.get(j)%>"><%=categoryList.get(j)%> </option>                                        
                                    <%}%>
                                </select>
                            </td>
                            <td> <input type="text" name="ProductImportDate" value="<%=productList.get(i).getImportDate()%>" required="" /></td>
                            <td> <input type="text" name="ProductUsingDate" value="<%=productList.get(i).getUsingDate()%>" required="" /></td>        
                            <td>
                                <input type="submit" name="action" value="Delete" />
                                <hr>
                                <input type="submit" name="action" value="Update" />
                            </td>
                        </tr>
                    </form>    
                    <%}
                                            }
                                        }%>

                    </tbody>
                </table>

            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>ID</label>
                                <input type="text"name="ProductID" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="email"name="ProductName" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="ProductImage" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" name="ProductPrice"class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="text" name="ProductQuantity" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" name="ProductCategory"class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>ImportDate</label>
                                <input type="text"name="ProductImportDate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>UsingDate</label>
                                <input type="text"name="ProductUsingDate" class="form-control" required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form >
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
        </script>
        <%}%>
    </body>
</html>