<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
 <jsp:include page="menu.jsp"/>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Supplier Management
            <small>Insert,Update and Delete Supplier Information</small>
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Supplier Information</h3>
              <span class="searchCen"><input type="text" class="input-sm" id="searchSupplier" name="search" placeholder="Search"></span>
              <div class="box-tools pull-right">
                  <button class="btn btn-box-tool" data-toggle="modal" data-target="#insertSupplierModal" title="Insert New Supplier"><i class="fa fa-user-plus"></i></button>
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div>
              
            <!--Success/Error Message-->  
              <c:choose>
                  <c:when test="${sessionScope.sessionSuccessMsg=='1'}">
                     <p></p>
                      <div class="alert alert-success alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success !</strong> Data Added Successfully.
                    </div>
                 </c:when>
                     
                 <c:when test="${sessionScope.sessionSuccessMsg=='0'}">
                     <p></p>
                     <div class="alert alert-danger alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Data Added Fail.
                    </div>
                 </c:when>
                     
                     <c:when test="${sessionScope.sessionSuccessMsg=='3'}">
                     <p></p>
                      <div class="alert alert-success alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success !</strong> Data Update Successfully.
                    </div>
                 </c:when>
                     
                 <c:when test="${sessionScope.sessionSuccessMsg=='2'}">
                     <p></p>
                     <div class="alert alert-danger alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Data Update Fail.
                    </div>
                 </c:when>
                     
                     <c:when test="${sessionScope.sessionSuccessMsg=='5'}">
                     <p></p>
                      <div class="alert alert-success alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success !</strong> Data Delete Successfully.
                    </div>
                 </c:when>
                     
                 <c:when test="${sessionScope.sessionSuccessMsg=='4'}">
                     <p></p>
                     <div class="alert alert-danger alert-dismissible">
                        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Data Delete Fail.
                    </div>
                 </c:when>
                 <c:otherwise>
                     <c:remove var="sessionSuccessMsg" scope="session"></c:remove>
                 </c:otherwise>
             </c:choose>
                <c:remove var="sessionSuccessMsg" scope="session"></c:remove>     
            </div>
              
            <div class="box-body" id="supplierData">
                
                <table class="table table-bordered table-striped">  
                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>  
                       <c:forEach var="supplier" items="${list}" varStatus="count">   
                       <tr>
                       <td><center>${count.count}</center></td> 
                       <td>${supplier.name}</td>  
                       <td>${supplier.supplierid}</td>  
                       <td>${supplier.phone}</td>  
                       <td>${supplier.email}</td>
                       <td>${supplier.address}</td>
                       <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editSupplierPopUp" data-id="${supplier.supplierid}" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;
                           <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteSupplierPopUp" data-id="${supplier.supplierid}" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>
                       </tr>  
                       </c:forEach>  
                  </table> 
            </div><!-- /.box-body -->
            <div class="box-footer">
                              <!-- Modal -->
                              <small>Footer</small>
             
             
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          
          <!-- Insert Supplier Data -->
          <div class="modal fade" id="insertSupplierModal" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Insert New Supplier</h4>
                    </div>
                      
                      <form action="insertSupplier" method="post" id="addSupplier" name="addSupplier">
                          <div class="modal-body" id="insertModalBody">
                        
                        <!-- Supplier ID -->
                        <div class="form-group" id="supplierid">
	                  <label class="control-label" for="supplierid"><i></i> Supplier ID</label>
                          <input type="text"  class="form-control" name="supplierid" disabled>
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
                            <button id="submitSupplier" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          
          
          <!-- Edit Supplier Data -->
          <div class="modal fade" id="editSupplierPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Edit Supplier Information</h4>
                    </div>
                      
                      <form action="editSupplier" method="post" id="editSupplier" name="editSupplier">
                          <div class="modal-body" id="editModalBody">
                        
                        <!-- Supplier ID -->
                        <div class="form-group" id="editSupplierid">
	                  <label class="control-label" for="editSupplierid"><i></i> Supplier ID</label>
                          <input type="text"  class="form-control" name="editSupplierid" disabled>
	                </div>
                        <input type="hidden" id="hiddenID" name="supplierid"/>
                        <!-- Name -->
	                <div class="form-group" id="editName">
	                  <label class="control-label" for="editName"><i></i> Name</label>
                          <input type="text" class="form-control" name="name" placeholder="Enter Name" required> 
	                </div>
                         
                         <!-- Email -->
	                <div class="form-group" id="editEmail">
	                  <label class="control-label" for="editEmail"><i></i> Email</label>
	                  <input type="text" class="form-control" name="email" placeholder="Enter Email Address">
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
                            <button id="editSupplierSubmit" name="editSubmit" class="btn btn-info">Edit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          <!-- Delete Supplier Data -->
          <div class="modal fade" id="deleteSupplierPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <center><h4 class="modal-title"><span>Are you sure, want to delete?</span></h4></center>
                    </div>
                      
                          <div class="modal-body" id="editModalBody">
                       
                              
                                  <form action="deleteSupplier" method="post" id="deleteSupplier" name="deleteSupplier">
                                      <input type="hidden" id="hiddenSupplierID" name="supplierid"/>
                                     <center> <button id="deleteSupplierBtn" name="deleteSupplierBtn" class="btn btn-danger">Delete</button>
                                  </form>
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                              </center>
                        </div>
                      <div class="modal-footer"></div>
                          
                  </div>
                </div>
            </div>
          
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
 
 <jsp:include page="footer.jsp"/>

