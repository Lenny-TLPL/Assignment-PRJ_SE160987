<%-- 
    Document   : signUp
    Created on : Mar 12, 2022, 12:01:40 PM
    Author     : Phi Long
--%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page import="sample.DTO.UserError"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <title>SignUp Form</title>
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin" action="MainController" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign up</h1>
                Enter userName(for login) ${requestScope.CREATE_ERROR.userName}
                <input name="UserName"  type="text" id="inputEmail" class="form-control" placeholder="UserName" required="" autofocus=""><hr>
                Enter password ${requestScope.CREATE_ERROR.password}
                <input name="Password"  type="password" id="inputPassword" class="form-control" placeholder="Password" required=""><hr>
                Confirm password ${requestScope.CREATE_ERROR.confirm}
                <input name="Confirm"  type="password" id="inputPassword" class="form-control" placeholder="Confirm password"required=""><hr>           
                Enter fullName ${requestScope.CREATE_ERROR.fullName}
                <input name="FullName"  type="text" id="inputPassword" class="form-control" placeholder="FullName" required=""><hr>   
                Enter address ${requestScope.CREATE_ERROR.address}
                <input name="Address"  type="text" id="inputEmail" class="form-control" placeholder="Address" required="" autofocus=""><hr>
                Enter birthday ${requestScope.CREATE_ERROR.birthdayError}
                <input name="Birthday"  type="text" id="inputPassword" class="form-control" placeholder="Birthday" required=""><hr>
                Enter phone ${requestScope.CREATE_ERROR.phone}
                <input name="Phone"  type="text" id="inputEmail" class="form-control" placeholder="Phone" required="" autofocus=""><hr>
                Enter email ${requestScope.CREATE_ERROR.email}
                <input name="Email"  type="text" id="inputEmail" class="form-control" placeholder="Email" required="">
                ${requestScope.CREATE_SUCCESS}
                ${requestScope.CREATE_ERROR.errorMessage}</br>
                <%session.removeAttribute("LOGIN_ERROR");%>
                <button class="btn btn-success btn-block" type="submit" name="action" value="SignUp"><i class="fas fa-user-plus signUp"></i>Sign Up </button>
                <hr>
                <a href="login.jsp" class="btn btn-primary btn-block" ><h5 class="signUp"> Back to login</h5> </a>
            </form>

            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
    </body>
</html>