 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Left side column. contains the sidebar -->
 <% 
     String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="resources/Image/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li <c:if test="${result=='dashboard'}">class="active" </c:if> >
            <a href="dashboard">
              <!-- <a href="<?php //echo BASE_URL; ?>"> -->
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
              </a>
            </li>
            
             <li <c:if test="${result=='customers'}">class="active" </c:if> >
              <a href="customers" >
                <i class="fa fa-user"></i> <span>Customers</span>
              </a>
            </li>
            
            <li <c:if test="${result=='suppliers'}">class="active" </c:if> >
              <a href="suppliers" >
                <i class="fa fa-tasks"></i> <span>Suppliers</span>
              </a>
            </li>

          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
             
      <!-- =============================================== -->