<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
 <jsp:include page="menu.jsp"/>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Brand Management
            <small>Insert,Update and Delete Brand Information</small>
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Brand Information</h3>
              <span class="searchCen"><input type="text" class="input-sm" id="searchBrand" name="search" placeholder="Search"></span>
              <div class="box-tools pull-right">
                  <button class="btn btn-box-tool" data-toggle="modal" data-target="#insertBrandModal" title="Insert New Brand"><i class="fa fa-user-plus"></i></button>
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
              
            <div class="box-body" id="brandData">
                
                <table class="table table-bordered table-striped">  
                    <tr><th><center>SL NO</center></th><th><center>Brand ID</center></th><th><center>Brand Name</center></th><th><center>Description</center></th><th><center>Action</center></th></tr>  
                       <c:forEach var="brand" items="${list}" varStatus="count">   
                       <tr>
                       <td><center>${count.count}</center></td> 
                       <td>${brand.brandid}</td>  
                       <td>${brand.brandName}</td>  
                       <td>${brand.description}</td>
                       <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editBrandPopUp" data-id="${brand.brandid}" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;
                           <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteBrandPopUp" data-id="${brand.brandid}" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>
                       </tr>  
                       </c:forEach>  
                  </table> 
            </div><!-- /.box-body -->
            <div class="box-footer">
                              <!-- Modal -->
                              <small>Footer</small>
             
             
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          
          <!-- Insert Brand Data -->
          <div class="modal fade" id="insertBrandModal" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Insert New Brand</h4>
                    </div>
                      
                      <form action="insertBrand" method="post" id="addBrand" name="addBrand">
                          <div class="modal-body" id="insertModalBody">
                        
                        <!-- Brand ID -->
                        <div class="form-group" id="brandid">
	                  <label class="control-label" for="brandid"><i></i> Brand ID</label>
                          <input type="text"  class="form-control" name="brandid" disabled>
	                </div>
                      
                        <!-- Brand Name -->
	                <div class="form-group" id="brandName">
	                  <label class="control-label" for="name"><i></i>Brand Name</label>
                          <input type="text" class="form-control" name="brandName" placeholder="Enter Brand Name" required> 
	                </div>

                         <!-- Description -->
	                <div class="form-group" id="description">
	                  <label class="control-label" for="description"><i></i> Description</label>
                          <textarea class="form-control" name="description" placeholder="Enter Description" ></textarea>
	                </div>
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="submitBrand" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          
          
          <!-- Edit Brand Data -->
          <div class="modal fade" id="editBrandPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Edit Brand Information</h4>
                    </div>
                      
                      <form action="editBrand" method="post" id="editBrand" name="editBrand">
                          <div class="modal-body" id="editModalBody">
                        
                        <!-- Brand ID -->
                        <div class="form-group" id="editBrandid">
	                  <label class="control-label" for="editBrandid"><i></i> Brand ID</label>
                          <input type="text"  class="form-control" name="editBrandid" disabled>
	                </div>
                        <input type="hidden" id="hiddenBrandID" name="brandid"/>
                        <!-- Brand Name -->
	                <div class="form-group" id="editBrandName">
	                  <label class="control-label" for="editBrandName"><i></i> Name</label>
                          <input type="text" class="form-control" name="brandName" placeholder="Enter Brand Name" required> 
	                </div>
                         
                         <!-- Description -->
	                <div class="form-group" id="editDescription">
	                  <label class="control-label" for="editDescription"><i></i> Description</label>
                          <textarea class="form-control" name="description" placeholder="Enter Description" ></textarea>
	                </div>
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="editBrandSubmit" name="editSubmit" class="btn btn-info">Edit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          <!-- Delete Brand Data -->
          <div class="modal fade" id="deleteBrandPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <center><h4 class="modal-title"><span>Are you sure, want to delete?</span></h4></center>
                    </div>
                      
                          <div class="modal-body" id="editModalBody">
                       
                              
                                  <form action="deleteBrand" method="post" id="deleteBrand" name="deleteBrand">
                                      <input type="hidden" id="hiddenBndID" name="brandid"/>
                                     <center> <button id="deleteBrandBtn" name="deleteBrandBtn" class="btn btn-danger">Delete</button>
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

