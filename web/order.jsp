<%-- 
    Document   : order.jsp
    Created on : Mar 11, 2022, 10:15:12 PM
    Author     : Phi Long
--%>
<%@ page import="sample.DTO.UserDTO"%>
<%@ page import="sample.DTO.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
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
                                                    <li><a class="btn btn-lg btn-outline-primary  active mb-1  " href="user.jsp"  > About me </a></li>
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
                            <li class="breadcrumb-item"><a href="cart.jsp">My cart</a></li>
                            <li class="breadcrumb-item"><a href="cart.jsp">Order</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
                            <div><h4>${requestScope.ORDER_ERROR}</h4></div>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <h4>${requestScope.USER_ERROR.errorMessage}</h4>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Product</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%! float VAT = 0; float ship = 0;%> 
                                            <% CartDTO cart = (CartDTO) session.getAttribute("CART");
                                                float totalPrice = 0;
                                                if (cart != null) {
                                                    if (cart.getCart().size() > 0) {
                                                        for (int i = 0; i < cart.getCart().size(); i++) {
                                                            totalPrice += cart.getCart().get(i).getPrice();
                                            %>
                                            <tr>
                                                <th scope="row">
                                                    <div class="p-2">
                                                        <img src="<%=cart.getCart().get(i).getImage()%>" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                        <div class="ml-3 d-inline-block align-middle">
                                                            <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block"><%=cart.getCart().get(i).getName()%></a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="align-middle"><strong><%=cart.getCart().get(i).getPrice()%>$</strong></td>  
                                                <td class="align-middle"><strong><%= cart.getCart().get(i).getQuantity()%>kg</strong></td>                                        
                                            </tr> 

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
                        <form action="MainController" method="POST">                
                        <div class="container row py-5 p-4 bg-white rounded shadow-sm">
                            <div class=" col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Ship to:</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" name="Address" required="" aria-describedby="button-addon3" class="form-control border-0" value="${sessionScope.LOGIN_USER.address}"/>                                  
                                    </div>
                                </div>
                            </div> 
                            
                                              
                            <div class=" col-lg-6 ">                                
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Payment:</div>
                                <div class="row">
                                    <div class="p-4 col-lg-6">
                                        <div class="input-group mb-4 border rounded-pill p-2">
                                            <input type="radio" name="Payment" value="CreditCard" id="cbxShow"/><label for="cbxShow">|Pay by card</label>
                                        </div>
                                    </div>
                                    <div class="p-4 col-lg-6">
                                        <div class="input-group mb-4 border rounded-pill p-2">
                                            <input type="radio" name="Payment" value="Direct" id="cbxHide"/><label for="cbxHide">|Pay when receive</label>
                                        </div>
                                    </div>
                                </div>
                                <div id="block">
                                    Bank Name:
                                    <select name ="BankName" aria-describedby="button-addon3" class="form-control border-0">
                                        <option value="1">AGRIBANK </option>
                                        <option value="2">SACOMBANK </option>
                                        <option value="3">TPBANK </option>
                                        <option value="4">SCB BANK </option>
                                    </select>
                                    Billing Adress:<input type="text" name="BillingAdress" aria-describedby="button-addon3" class="form-control border-0"/></br>
                                    Card Number:<input type="text" name="CardNmuber" aria-describedby="button-addon3" class="form-control border-0"/></br>
                                    Card Owner's Name:<input type="text" name="OwnerName"  aria-describedby="button-addon3" class="form-control border-0"/>
                                </div>
                            </div>  
                        </div>                

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Enter Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Use</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">BILLING</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">All Products Price:</strong><strong><%=totalPrice%>$</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping fee: </strong><strong><%=this.ship%>$</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT: </strong><strong><%=this.VAT%>%</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total Price:</strong>
                                            <input type="hidden" name="TotalPrice" value="<%=this.ship+totalPrice + (this.VAT * totalPrice)%>"/>
                                   
                                            <h5 class="font-weight-bold"><%=this.ship+totalPrice + (this.VAT * totalPrice)%>$</h5>
                                        </li>
                                    </ul>
                                        <button class="btn btn-dark rounded-pill py-2 btn-block" type="submit" name="action" value="Order">ORDER</button>
                                </div>
                            </div>
                        </div>
                        </form> 
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
