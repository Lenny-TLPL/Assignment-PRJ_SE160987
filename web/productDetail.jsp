<%-- 
    Document   : productDetail.jsp
    Created on : Mar 9, 2022, 5:35:51 PM
    Author     : Phi Long
--%>
<%@ page import="sample.DTO.ProductDTO"%>
<%@ page import="sample.DTO.UserDTO"%>
<%@ page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>

        <%UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <%
            boolean check = true;
            if (user == null) {
                check = true;
            } else if ("AD".equals(user.getRole()) == true) {
                check = false;
            }
            if (check = false) {
                    response.sendRedirect("login.jsp");
                } else {%>
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
                            <a class="nav-link" href="login.jsp"><h4>Login</h4></a>
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
                                <a class="btn btn-success  ml-3  " href="<%=this.reDirect%>">                           
                                    <i class="fa fa-shopping-cart"></i> Cart
                                    <span class="badge badge-light">
                                        <%if (session.getAttribute("CART") == null) {%>
                                        <%=0%>
                                        <%}%><%else {%>
                                        ${sessionScope.CART.getCart().size()}
                                        <%}%>
                                    </span>
                                    <p> <%   if (session.getAttribute("MESSAGE") != null) {
                                            String message = (String) session.getAttribute("MESSAGE");
                                            out.println(message);
                                            session.removeAttribute("MESSAGE");
                                        }%>
                                    </p>
                                </a>
                            </div>
                        </li>
                    </ul>

                    <%if (session.getAttribute("LOGIN_USER") != null) {%>
                    <div  class="nav-link">
                        <form action="MainController" method="POST">
                            </ul>
                            <li class="nav-item">
                                <div class="nav-item">
                                    <a class="btn btn-success  ml-3  " href="home.jsp">                           
                                        <i class="fa fa-shopping-cart"></i> BACK TO SHOPPING                             
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item mt-1">
                                <button class="btn btn-success  ml-3" type="submit" name="action" value="LogOut"><span><i class="fa fa-sign-out" aria-hidden="true">|LogOut </i>  </span> </button>
                            </li> 
                            </ul>
                        </form>
                        <%}%>                           
                    </div>
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

        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Product Detail</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>        

        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${ALLCate}" var="o">
<!--                                <li class="list-group-item text-white"><a href="#">${o.name}</a></li>
                            </c:forEach>-->
                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${last.image}" />
                            <h5 class="card-title">${last.name}</h5>
                            <p class="card-text">${last.description}</p>
                            <p class="bloc_left_price">${last.price} $</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="${requestScope.PRODUCT_DETAIL.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                            <div class="item-gallery"> <img src="${requestScope.PRODUCT_DETAIL.image}"> </div>
                                            <div class="item-gallery"> <img src="${requestScope.PRODUCT_DETAIL.image}"> </div>
                                            <div class="item-gallery"> <img src="${requestScope.PRODUCT_DETAIL.image}"> </div>
                                            <div class="item-gallery"> <img src="${requestScope.PRODUCT_DETAIL.image}"> </div>
                                        </div> <!-- slider-nav.// -->
                                        <hr>
                                        <div>
                                            <h3 class="title mb-3 ml-4 text-uppercase">${requestScope.PRODUCT_DETAIL.name}</h3>
                                            <h5 class="title mb-3 ml-4">Category: ${requestScope.PRODUCT_DETAIL.category}</h5>
                                        </div>
                                        <hr>
                                        <%!String usingDate = "";
                                            String importDate = "";%>
                                        <%
                                            ProductDTO product = (ProductDTO) request.getAttribute("PRODUCT_DETAIL");
                                            Date importDate = product.getImportDate();
                                            Date usingDate = product.getUsingDate();
                                            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                            this.usingDate = formatter.format(importDate);
                                            this.importDate = formatter.format(usingDate);
                                        %>
                                        <div>
                                            <h5 class="title mb-3 ml-4">Import date:<%=this.importDate%></h5>
                                            <h5 class="title mb-3 ml-4">Expired: <%=this.usingDate%></h5>
                                        </div>

                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">



                                        <dl class="item-property">
                                            <dt>Description:</dt>
                                            <dd><p>Our product always have the best quality. Chosen from the most qualified farm in JAPAN. We can make sure the vegetable shipped to your house is always fresh as seen in images. </p></dd>
                                            <dd><p>Qualitfied by the world wide organic vegetable organization. </p></dd>
                                        </dl>

                                        <dl class="param param-feature">
                                            <dt>Delivery from:</dt>
                                            <dd>Russia, USA, Europe and Japan</dd>
                                        </dl> 
                                        <form action="MainController" method="POST">
                                            <hr>
                                            <dt class="card-text show_txt"> Remain: ${requestScope.PRODUCT_DETAIL.quantity}kg  </dt>
                                            <p class="price-detail-wrap"> 
                                                <span class="price h3 text-warning"> 
                                                    <span class="currency"></span><span class="num">${requestScope.PRODUCT_DETAIL.price} $/kg</span>
                                                </span> 

                                            </p>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <dl class="param param-inline">
                                                        <dt>Quantity: </dt>
                                                        <dd>
                                                            <select name ="ProductQuantity" class="form-control form-control-sm" style="width:70px;">
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
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <hr>
                                            <div >
                                                <dd >
                                                    <input type="hidden" name="ProductID" value="<%=product.getID()%>"/>
                                                    <input type="hidden" name="ProductName" value="<%=product.getName()%>"/>
                                                    <input type="hidden" name="ProductPrice" value="<%=product.getPrice()%>"/>
                                                    <input type="hidden" name="ProductImage" value="<%=product.getImage()%>"/>
                                                    <input type="hidden" name="QuantityRemain" value="<%=product.getQuantity()%>"/>
                                                    <input class="btn btn-lg btn-outline-primary " type="submit"  name="action" value="Add" />  
                                                </dd>   
                                            </div> 

                                        </form>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


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
        <%}%>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
