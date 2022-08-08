<%-- 
    Document   : myOrder.jsp
    Created on : Mar 11, 2022, 10:15:41 PM
    Author     : Phi Long
--%>

<%@page import="sample.DTO.OrderListDTO"%>
<%@page import="sample.DTO.UserDTO"%>
<%@page import="sample.DTO.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.DAO.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <%if (user == null || "AD".equals(user.getRole()) == true) {
                response.sendRedirect("login.jsp");
            } else {%>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container" id="heading">
                <a class="navbar-brand" href="home.jsp"><h2>Kudamono Shoppu</h2></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <%if (session.getAttribute("LOGIN_USER") != null) {%>
                            <div  class="nav-link">
                                <h4>
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav navbar-nav navbar-right">
                                            <li class="dropdown">
                                                <a class="nav-link" href="user.jsp"data-toggle="dropdown" class="dropdown-toggle"  ><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}<b class="caret"></b> </a>           
                                                <ul class="dropdown-menu subMenuUser">
                                                    <li><a class="btn btn-lg btn-outline-primary  active mb-1 " href="user.jsp"  > About me </a></li>
                                                    <li><a class=" btn btn-lg btn-outline-primary  active mb-1 " href="cart.jsp"  ><i class="fa fa-shopping-cart"> My cart</i> </a></li>
                                                    <form action="MainController">
                                                        <li><button class="btn btn-lg btn-outline-primary  active mb-1" type="submit" name="action" value="MyOrder"><span>My Order  </span> </button></li>
                                                        <li><button class="btn btn-lg btn-outline-primary  active " type="submit" name="action" value="LogOut"><span><i class="fa fa-sign-out" aria-hidden="true">|LogOut </i>  </span> </button></li>
                                                    </form>             
                                                </ul>

                                            </li>
                                        </ul>
                                    </div><!-- /.navbar-collapse -->                                   
                                </h4>  
                            </div>
                            <%} else {%>
                            <a class="nav-link m-auto" href="login.jsp"><h4>Login</h4></a>
                            <%}%>
                        </li>
                        <ul class="mt-2">
                            <li class="nav-item">
                                <div class="nav-item">
                                    <a class="btn btn-success  ml-3 mt-1 " href="home.jsp">                           
                                        <i class="fa fa-shopping-cart"></i> BACK TO SHOPPING                             
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </ul>
                </div>
        </nav>

        <section class="jumbotron text-center">
            <div class="container">
                <a class="navbar-brand" href="home.jsp"><h1 class="jumbotron-heading">Kudamono Shoppu</h1></a>              
                <p class="lead text-muted mb-0">Provide you with fresh fruit and vegetable from best farm in JAPAN!</p>
            </div>
        </section>

        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="cart.jsp">My Order</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <h4>${requestScope.CONFIRM_ERROR}</h4>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">OrderID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">OrderDate</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">UserID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Received</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Confirm</div>
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%! float VAT =0; float ship=0;%>
                                            <% OrderListDTO orderList= (OrderListDTO) session.getAttribute("ORDER_LIST");
                                                if (orderList != null) {
                                                    if (orderList.getList().size() > 0) {
                                                        for (int i = 0; i < orderList.getList().size(); i++) {
                                                            
                                            %>
                                        <form action="MainController" method="POST">

                                            <tr>
                                                <td class="align-middle"><strong><%=orderList.getList().get(i).getOrderID()%></strong></td>
                                                <td class="align-middle"><strong><%=orderList.getList().get(i).getOrderDate()%></strong></td>
                                                <td class="align-middle"><strong><%=orderList.getList().get(i).getUserID()%></strong></td>
                                                <td class="align-middle"><strong><%=orderList.getList().get(i).getTotal()%></strong></td>
                                                <td class="align-middle"><strong><%if(orderList.getList().get(i).getStatus()==false){out.print("Not received");}else{out.print("Received");}%></strong></td>
                                                <td class="align-middle"><a href="#" class="text-dark">
                                                        <input type="hidden" name="OrderID" value="<%=orderList.getList().get(i).getOrderID()%>"/>
                                                        <button type="submit" name="action" value="Confirm" class="btn btn-danger">Confirm as received</button>
                                                    </a>
                                                </td>
                                            </tr> 

                                        </form>
                                        <%
                                                    }
                                                }
                                            }%>                                        
                                        </tbody>

                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--footer-->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h5>Others links</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i> My company</li>
                            <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                            <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                            <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                        </ul>
                    </div>
                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                        <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p>
                    </div>
                </div>
            </div>
        </footer>
        <%}%>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>

</html>
</html>
