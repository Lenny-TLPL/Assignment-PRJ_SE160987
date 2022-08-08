<%-- 
    Document   : home
    Created on : Mar 5, 2022, 5:12:19 PM
    Author     : Phi Long
--%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="sample.DTO.ProductDTO"%>
<%@ page import="sample.DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kudamono Shoppu</title>
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
        <% if (request.getAttribute("PRODUCT_LIST") == null && request.getAttribute("SEARCH_ERROR") == null) {
                response.sendRedirect("MainController");
            } else if (user == null || "AD".equals(user.getRole()) == false) {%>
        <!--Menu and heading section-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container" id="heading">
                <a class="navbar-brand" href="home.jsp"><h2>Fruit and Vegetable</h2></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">

                    <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="Search" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...." value="${param.Search}">
                            <div class="input-group-append">
                                <button type="submit" name="action" value="Search" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>                      
                    </form>
                    <ul class="navbar-nav m-auto ">
                        <li class="nav-item mt-1">
                            <%if (session.getAttribute("LOGIN_USER") != null) {%>
                            <div  class="nav-link">
                                <h4>
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav navbar-nav navbar-right">
                                            <li class="dropdown">
                                                <a class="nav-link" href="user.jsp"data-toggle="dropdown" class="dropdown-toggle"  ><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}<b class="caret"></b> </a>           
                                                <ul class="dropdown-menu subMenuUser">
                                                    <li><a class="btn btn-lg btn-outline-primary  active mb-1 " href="user.jsp"  > About me </a></li>
                                                    <li><a class=" btn btn-lg btn-outline-primary  active mb-1 " href="cart.jsp"  ><i class="fa fa-shopping-cart"> My cart</i>  </a></li>
                                                    <li><a class=" btn btn-lg btn-outline-primary  active mb-1 " href="myOrder.jsp">My Order </a></li>
                                                    <form action="MainController">                                      
                                                        <li><button class="btn btn-lg btn-outline-primary  active " type="submit" name="action" value="LogOut"><span><i class="fa fa-sign-out" aria-hidden="true">|LogOut </i>  </span> </button></li>
                                                    </form>             
                                                </ul>

                                            </li>
                                        </ul>
                                    </div><!-- /.navbar-collapse -->                                   
                                </h4>  
                            </div>

                            <%} else {%>
                            <a class="nav-link mt-1" href="login.jsp"><h4>Login</h4></a>
                            <%}%>
                        </li>

                        <li class="nav-item">
                            <div class="nav-item">
                                <%! String reDirect = "";%>
                                <%if (session.getAttribute("LOGIN_USER") == null) {
                                        this.reDirect = "login.jsp";
                                    } else {
                                        this.reDirect = "cart.jsp";
                                    }%>
                                <a class="btn btn-success  ml-3 mt-2 mb-2 " href="<%=this.reDirect%>">                           
                                    <i class="fa fa-shopping-cart mt-2"></i> Cart
                                    <span class="badge badge-light">
                                        <%if (session.getAttribute("CART") == null) {%>
                                        <%=0%>
                                        <%}%><%else {%>
                                        ${sessionScope.CART.getCart().size()}
                                        <%}%>
                                    </span>
                                    <p> <%   if (session.getAttribute("MESSAGE") != null) {
                                            String message = (String) session.getAttribute("MESSAGE");
                                            session.removeAttribute("MESSAGE");
                                            out.println(message);
                                        }%>
                                    </p>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
        </nav>
        <!--end of menu-->

        <!-- page title-->
        <section class="jumbotron text-center">
            <div class="container">
                <a class="navbar-brand" href="home.jsp"><h1 class="jumbotron-heading">Kudamono Shoppu</h1></a>              
                <p class="lead text-muted mb-0">Provide you with fresh fruit and vegetable from best farm in JAPAN!</p>
            </div>
        </section>
        <!--end first section-->

        <!-- sub menu-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!--side bar -->
        <div class="container"> 
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCC}" var="o">
                                <li class="list-group-item text-white"><a href="#">${o.cname}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${p.image}" />
                            <h5 class="card-title">${p.name}</h5>
                            <p class="card-text">${p.title}</p>
                            <p class="bloc_left_price">${p.price} $</p>
                        </div>
                    </div>
                </div>

                <!-- Main product display -->  
                <div class="col-sm-9">
                    <div class="row"> 
                        <%  ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("PRODUCT_LIST");
                            if (productList != null) {
                                if (productList.size() > 0) {
                                    for (int i = 0; i < productList.size(); i++) {
                                        if (productList.get(i).getQuantity() > 0) {%>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="<%=productList.get(i).getImage()%>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="MainController?action=Detail&ProductID=<%= productList.get(i).getID()%>" title="View Product"><%=productList.get(i).getName()%></a></h4>
                                    <h6 class="card-text show_txt">Category: <%=productList.get(i).getCategory()%></h6>
                                    <span class="card-text show_txt"> Price: <%=productList.get(i).getPrice()%>$/kg   </span>
                                    <span class="card-text show_txt"> Remain:<%=productList.get(i).getQuantity()%>kg  </span>
                                    <form action="MainController" method="POST">
                                        <div class="row">
                                            <span class="col" >Quantity:                                                        
                                                <select name ="ProductQuantity" > 
                                                    <option value="1">1kg </option>
                                                    <option value="2">2kg </option>
                                                    <option value="3">3kg </option>
                                                    <option value="4">4kg </option>
                                                    <option value="5">5kg </option>
                                                    <option value="6">6kg </option>
                                                    <option value="7">7kg </option>
                                                    <option value="8">8kg </option>
                                                    <option value="9">9kg </option>
                                                    <option value="10">10kg </option>                                                                   
                                                </select>
                                            </span>  
                                            <span class="col" >
                                                <input type="hidden" name="ProductID" value="<%=productList.get(i).getID()%>"/>
                                                <input type="hidden" name="ProductName" value="<%=productList.get(i).getName()%>"/>
                                                <input type="hidden" name="ProductPrice" value="<%=productList.get(i).getPrice()%>"/>
                                                <input type="hidden" name="ProductImage" value="<%=productList.get(i).getImage()%>"/>
                                                <input class="btn btn-lg btn-outline-primary text-uppercase active" type="submit"  name="action" value="Add"  />     
                                            </span>                                                             
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <%}
                                    }
                                }
                            }%>
                        <h4>${requestScope.SEARCH_ERROR.getErrorMessage()}</h4>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
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
        <%} else {
                response.sendRedirect("admin.jsp");
            }%>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
