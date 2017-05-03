<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
 <jsp:include page="menu.jsp"/>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Customer Management
            <small>add delete and update new customer</small>
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Title</h3>
              <div class="box-tools pull-right">
                  <button class="btn btn-box-tool" data-toggle="modal" data-target="#insertCustomerModal" title="Insert New Customer"><i class="fa fa-user-plus"></i></button>
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div>
              
            <!--Success/Error Message-->  
              <c:choose>
                 <c:when test="${queryResult=='1'}">
                     <p></p>
                      <div class="alert alert-success alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success !</strong> Data Added Successfully.
                    </div>
                 </c:when>
                 <c:when test="${queryResult=='0'}">
                     <p></p>
                     <div class="alert alert-danger alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Data Added Fail.
                    </div>
                 </c:when>
                 <c:otherwise>
                 </c:otherwise>
             </c:choose>
                     
            </div>
              
            <div class="box-body">
                
                <table class="table table-bordered table-striped">  
                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>  
                       <c:forEach var="customer" items="${list}" varStatus="count">   
                       <tr>
                       <td><center>${count.count}</center></td> 
                       <td>${customer.name}</td>  
                       <td>${customer.customerid}</td>  
                       <td>${customer.phone}</td>  
                       <td>${customer.email}</td>
                       <td>${customer.address}</td>
                       <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editCustomerPopUp" data-id="${customer.customerid}" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;
                           <a class="btn btn-sm btn-danger" href="customerDelete?id=${customer.customerid}" target="_blank" data-toggle="tooltip" title="" data-original-title="Delete"><span class="fa fa-times"></span></a></center> </td>
                       </tr>  
                       </c:forEach>  
                  </table> 
            </div><!-- /.box-body -->
            <div class="box-footer">
                              <!-- Modal -->
             Footer
             
             
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          
          <!-- Insert Customer Data -->
          <div class="modal fade" id="insertCustomerModal" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Modal Header</h4>
                    </div>
                      
                      <form action="insertCustomer" method="post" id="addCustomer" name="addCustomer">
                          <div class="modal-body" id="insertModalBody">
                        
                        <!-- Customer ID -->
                        <div class="form-group" id="customerid">
	                  <label class="control-label" for="customerid"><i></i> Customer ID</label>
                          <input type="text"  class="form-control" name="customerid" disabled>
	                </div>
                      
                        <!-- Name -->
	                <div class="form-group" id="name">
	                  <label class="control-label" for="name"><i></i> Name</label>
                          <input type="text" class="form-control" name="name" placeholder="Enter Name" required> 
	                </div>
                         
                         <!-- Email -->
	                <div class="form-group" id="email">
	                  <label class="control-label" for="email"><i></i> Email</label>
	                  <input type="text" class="form-control" name="email" placeholder="Enter Email Address">
	                </div>
                         
                         <!-- Phone -->
	                <div class="form-group" id="phone">
	                  <label class="control-label" for="phone"><i></i> Phone</label>
                          <input type="text" class="form-control" name="phone" placeholder="Enter Phone Number" required>
	                </div>
                         
                         <!-- Address -->
	                <div class="form-group" id="address">
	                  <label class="control-label" for="address"><i></i> Address</label>
                          <textarea class="form-control" name="address" placeholder="Enter Address" ></textarea>
	                </div>
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="submitCustomer" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          
          
          <!-- Edit Customer Data -->
          <div class="modal fade" id="editCustomerPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Edit Customer Information</h4>
                    </div>
                      
                      <form action="editCustomer" method="post" id="editCustomer" name="editCustomer">
                          <div class="modal-body" id="editModalBody">
                        
                        <!-- Customer ID -->
                        <div class="form-group" id="editCustomerid">
	                  <label class="control-label" for="editCustomerid"><i></i> Customer ID</label>
                          <input type="text"  class="form-control" name="customerid" disabled>
	                </div>
                      
                        <!-- Name -->
	                <div class="form-group" id="editName">
	                  <label class="control-label" for="editName"><i></i> Name</label>
                          <input type="text" class="form-control" name="name" placeholder="Enter Name" required> 
	                </div>
                         
                         <!-- Email -->
	                <div class="form-group" id="editEmail">
	                  <label class="control-label" for="email"><i></i> Email</label>
	                  <input type="text" class="form-control" name="editEmail" placeholder="Enter Email Address">
	                </div>
                         
                         <!-- Phone -->
	                <div class="form-group" id="editPhone">
	                  <label class="control-label" for="editPhone"><i></i> Phone</label>
                          <input type="text" class="form-control" name="phone" placeholder="Enter Phone Number" required>
	                </div>
                         
                         <!-- Address -->
	                <div class="form-group" id="editAddress">
	                  <label class="control-label" for="editAddress"><i></i> Address</label>
                          <textarea class="form-control" name="address" placeholder="Enter Address" ></textarea>
	                </div>
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="editCustomerSubmit" name="editSubmit" class="btn btn-info">Edit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
 
 <jsp:include page="footer.jsp"/>

