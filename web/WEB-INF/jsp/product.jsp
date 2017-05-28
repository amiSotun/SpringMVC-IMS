<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
 <jsp:include page="menu.jsp"/>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Product Management
            <small>Insert,Update and Delete Product Information</small>
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Product Information</h3>
              <span class="searchCen"><input type="text" class="input-sm" id="searchProduct" name="search" placeholder="Search"></span>
              <div class="box-tools pull-right">
                  <button class="btn btn-box-tool" data-toggle="modal" data-target="#insertProductModal" title="Insert New Product"><i class="fa fa-user-plus"></i></button>
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
              
            <div class="box-body" id="productData">
                
                <table class="table table-bordered table-striped">  
                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>  
                       <c:forEach var="product" items="${list}" varStatus="count">   
                       <tr>
                       <td><center>${count.count}</center></td> 
                       <td>${product.name}</td>  
                       <td>${product.productid}</td>  
                       <td>${product.phone}</td>  
                       <td>${product.email}</td>
                       <td>${product.address}</td>
                       <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editProductPopUp" data-id="${product.productid}" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;
                           <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteProductPopUp" data-id="${product.productid}" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>
                       </tr>  
                       </c:forEach>  
                  </table> 
            </div><!-- /.box-body -->
            <div class="box-footer">
                              <!-- Modal -->
                              <small>Footer</small>
             
             
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          
          <!-- Insert Product Data -->
          <div class="modal fade" id="insertProductModal" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Insert New Product</h4>
                    </div>
                      
                      <form action="insertProduct" method="post" id="addProduct" name="addProduct">
                          <div class="modal-body" id="insertModalBody">
                        
                        <!-- Entry ID -->
                        <div class="col-lg-6 form-group" id="entryid">
	                  <label class="control-label" for="entryid"><i></i> Entry ID</label>
                          <input type="text"  class="form-control" name="entryid" disabled>
                          <input type="hidden" id="hiddenEntryId" name="entryid"/>
	                </div>
                        
                        <!-- Stock ID -->
                        <div class="col-lg-6 form-group" id="stockid">
	                  <label class="control-label" for="stockid"><i></i> Stock ID</label>
                          <input type="text"  class="form-control" name="stockid" disabled>
                          <input type="hidden" id="hiddenStockId" name="stockid"/>
	                </div>
                        
                        <!-- Invoice No -->
                        <div class="col-lg-6 form-group" id="invoice">
	                  <label class="control-label" for="invoice"><i></i> Invoice No</label>
                          <input type="text"  class="form-control" name="invoice" >
	                </div>
                        
                        <!-- Invoice Date -->
                        <div class="col-lg-6 form-group" id="invoiceData">
	                  <label class="control-label" for="invoiceData"><i></i> Invoice Date</label>
                          <input type="date"  class="datepicker form-control" name="invoiceData" placeholder="Enter Invoice Date" >
	                </div>
                        
                         
                         
                         <!-- Brand -->
	                <div class="col-lg-6 form-group" id="brand">
	                  <label class="control-label" for="brandList"><i></i>Brand</label>
	                    <select class="form-control" id="brandList" name="brandid" required>
                                <option value="">Select Brand.</option> 
                            </select>
	                </div>
                         
                          <!-- Reorder Level -->
	                <div class="col-lg-6 form-group" id="reorderlevel">
	                  <label class="control-label" for="reorderlevel"><i></i> Reorder Level</label>
                          <input type="text" class="form-control" name="reorderlevel" placeholder="Enter Reorder Level" required> 
	                </div>
                         
                         <!-- Category -->
	                <div class="col-lg-6 form-group" id="category">
	                  <label class="control-label" for="catList"><i></i> Category</label>
                         <select class="form-control" id="catList" name="catid" required>
                                <option value="">Select Category.</option> 
                                <option value="CAT-44"> Brand</option> 
                            </select>
	                </div>
                         
                        <!-- Quantity -->
	                <div class="col-lg-6 form-group" id="quantity">
	                  <label class="control-label" for="quantity"><i></i> Quantity</label>
                          <input type="text" class="form-control" name="quantity" placeholder="Enter Quantity" required>
	                </div>
                         
                         <!-- Model Name -->
                        <div class="col-lg-6 form-group" id="modelid">
	                  <label class="control-label" for="modelList"><i></i> Model ID/Name</label>
                          <select class="form-control" id="modelList" name="modelid" required>
                                <option value="">Select Model.</option> 
                               
                            </select>
	                </div>
                        
                         <!-- Price Per Unit -->
	                <div class="col-lg-6 form-group" id="ppi">
	                  <label class="control-label" for="ppi"><i></i> Price Per Item(PPI)</label>
	                  <input type="text" class="form-control" name="ppi" placeholder="Enter Price">
	                </div>
                         
                           
                        <!-- Supplier -->
                        <div class="col-lg-6 form-group" id="supplier">
	                  <label class="control-label" for="supplierList"><i></i> Supplier</label>
                          <select class="form-control" id="supplierList" name="supplierid" required>
                                <option value="">Select Supplier.</option> 
                                <option value="SUP-11"> Brand</option> 
                            </select>
	                </div>
                           

                         <!-- Sales Per Unit -->
	                <div class="col-lg-6 form-group" id="spi">
	                  <label class="control-label" for="spi"><i></i> Sales Per Item(SPI)</label>
	                  <input type="text" class="form-control" name="spi" placeholder="Enter Price">
	                </div>
                         
                     </div>
                          
                     <div class="modal-footer">
                            <button id="submitProduct" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          
          
          <!-- Edit Product Data -->
          <div class="modal fade" id="editProductPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Edit Product Information</h4>
                    </div>
                      
                      <form action="editProduct" method="post" id="editProduct" name="editProduct">
                          <div class="modal-body" id="editModalBody">
                        
                        <!-- Product ID -->
                        <div class="form-group" id="editProductid">
	                  <label class="control-label" for="editProductid"><i></i> Product ID</label>
                          <input type="text"  class="form-control" name="editProductid" disabled>
	                </div>
                        <input type="hidden" id="hiddenID" name="productid"/>
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
                            <button id="editProductSubmit" name="editSubmit" class="btn btn-info">Edit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          <!-- Delete Product Data -->
          <div class="modal fade" id="deleteProductPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <center><h4 class="modal-title"><span>Are you sure, want to delete?</span></h4></center>
                    </div>
                      
                          <div class="modal-body" id="editModalBody">
                       
                              
                                  <form action="deleteProduct" method="post" id="deleteProduct" name="deleteProduct">
                                      <input type="hidden" id="hiddenProductID" name="productid"/>
                                     <center> <button id="deleteProductBtn" name="deleteProductBtn" class="btn btn-danger">Delete</button>
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

