<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Blank Page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Loader CSS add -->
     <link href="<c:url value="/resources/CSS/loader.css" />" rel="stylesheet">
     <!-- Bootstrap 3.3.5 -->
     <link href="<c:url value="/resources/CSS/bootstrap.min.css" />" rel="stylesheet">
     <!-- Font Awesome -->
     <link href="<c:url value="/resources/CSS/font-awesome.min.css" />" rel="stylesheet">
     <!-- bootstrap datepicker -->
     <link href="<c:url value="/resources/plugins/datepicker/datepicker.css" />" rel="stylesheet">
     <!-- Font Awesome -->
     <link href="<c:url value="/resources/CSS/font-awesome.min.css" />" rel="stylesheet">
     <!-- Ionicons -->
     <link href="<c:url value="/resources/CSS/ionicons.min.css" />" rel="stylesheet">
          <!-- GoogleFont -->
     <link href="<c:url value="/resources/CSS/googlefont.css" />" rel="stylesheet">
     <!-- Theme style -->
     <link href="<c:url value="/resources/CSS/AdminLTE.min.css" />" rel="stylesheet">
      <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
     <link href="<c:url value="/resources/CSS/_all-skins.min.css" />" rel="stylesheet">
      
     <link href="<c:url value="/resources/sweetalert/sweetalert.css" />" rel="stylesheet">
     
     <link href="<c:url value="/resources/CSS/custom.css" />" rel="stylesheet">


  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>C</b>T</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Code</b>Tech</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
             
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="resources/Image/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">Alexander Pierce</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="resources/Image/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      Alexander Pierce - Web Developer
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="loader05"></div>
                    <div class="pull-right">
                      <a href="#" id="user_logout" name="user_logout" class="btn btn-default btn-flat">Log out</a>
                    </div>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>
        </nav>
      </header>

      <!-- =============================================== -->