
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>IMS | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
     
    
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="resources/CSS/bootstrap.min.css">
     <!-- Font Awesome -->
     <link rel="stylesheet" href="resources/CSS/font-awesome.min.css">
     <!-- Ionicons -->
     <link rel="stylesheet" href="resources/CSS/ionicons.min.css">
     <!-- Theme style -->
     <link rel="stylesheet" href="resources/CSS/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="resources/CSS/plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <p><b>Login</b>Panel</p>
    </div>
    
    <c:choose>
        <c:when test="${sessionScope.sessionLoginCheck== false}">
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="">Invalid User id or Password </i></h4>
            </div>         
        </c:when>
        
        <c:when test="${sessionScope.sessionLoginCheck== true}">
            <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="">Authentication!<br> You Must Have Login First. </i></h4>
            </div>         
        </c:when>
        
        <c:otherwise>
            <c:remove var="sessionLoginCheck" scope="session"></c:remove>
        </c:otherwise>
        
    </c:choose>
    <c:remove var="sessionLoginCheck" scope="session"></c:remove>
    <c:remove var="sessionUserId" scope="session"></c:remove>
    <c:remove var="sessionUserType" scope="session"></c:remove>

    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to access your account</p>

        <form action="loginCheck" method="post" id="loginForm" name="loginForm">
            <div class="form-group has-feedback">
                <select class="form-control" id="usertype" name="usertype" required>
                    <option value="">Select Who you Are?</option>
                    <option value="1">Admin</option>
                    <option value="2">Sales</option>
                    <option value="3">Manager</option>
                    
                </select>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" id="userid" name="userid" placeholder="User ID" required>
                <span class="fa fa-user-secret form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <a href="#">I forgot my password</a><br>
                        </label>
                        
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" value="submit" class="btn btn-primary btn-block btn-flat" id="loginBtn" name="loginBtn">Sign In</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <!-- /.social-auth-links -->
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="resources/JS/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="resources/JS/bootstrap.min.js"></script>
    <!-- iCheck -->
     <script src="resources/plugins/iCheck/icheck.min.js"></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>
