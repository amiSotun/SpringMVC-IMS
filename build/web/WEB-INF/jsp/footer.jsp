<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="main-footer">
        <div class="pull-right hidden-xs">
<!--          <b>Version</b> 2.3.0-->
        </div>
        <strong>Copyright &copy; 2017 <a href="http://facebook.com/amiSotun">Humayun Kabir Sotun</a>.</strong> All rights reserved.
      </footer>

      
      
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="resources/JS/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="resources/JS/bootstrap.min.js"></script>
    <!-- bootstrap datepicker -->
    <script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- SlimScroll -->
    <script src="resources/JS/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="resources/JS/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="resources/JS/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="resources/sweetalert/sweetalert.js"></script>
    <script src="resources/sweetalert/sweetalert.min.js"></script>
    <c:choose>
        <c:when test="${result=='customers'}">
            <script src="resources/JS/customerHandaler.js"></script>
            <script src="resources/JS/customerValidation.js"></script>
            <script src="resources/JS/customerEditValidation.js"></script>
         </c:when>
            
          <c:when test="${result=='suppliers'}">
            <script src="resources/JS/supplierHandaler.js"></script>
            <script src="resources/JS/supplierValidation.js"></script>
            <script src="resources/JS/supplierEditValidation.js"></script>
         </c:when> 
            
        <c:when test="${result=='brand'}">
            <script src="resources/JS/brandHandaler.js"></script>
            <script src="resources/JS/brandValidation.js"></script>
            <script src="resources/JS/brandEditValidation.js"></script>
         </c:when>
            
        <c:when test="${result=='category'}">
            <script src="resources/JS/categoryHandaler.js"></script>
            <script src="resources/JS/categoryValidation.js"></script>
            <script src="resources/JS/categoryEditValidation.js"></script>
         </c:when>
            
         <c:when test="${result=='model'}">
            <script src="resources/JS/modelHandaler.js"></script>
            <script src="resources/JS/modelValidation.js"></script>
<!--            <script src="resources/JS/categoryEditValidation.js"></script>-->
         </c:when>

        <c:when test="${result=='product'}">
            <script src="resources/JS/productHandaler.js"></script>
            <script src="resources/JS/productValidation.js"></script>
            <!--<script src="resources/JS/categoryEditValidation.js"></script>-->
         </c:when>
            
            <c:otherwise>
                
            </c:otherwise>
    </c:choose>
    
   

    <script>
        //Date picker
        $('#invoiceData input').datepicker({
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    </script>
  </body>
</html>
