<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
 <jsp:include page="menu.jsp"/>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Model Management
            <small>Insert,Update and Delete Model Information</small>
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Model Information</h3>
              <span class="searchCen"><input type="text" class="input-sm" id="searchModel" name="search" placeholder="Search"></span>
              <div class="box-tools pull-right">
                  <button class="btn btn-box-tool" data-toggle="modal" data-target="#insertModelModal" title="Insert New Model"><i class="fa fa-user-plus"></i></button>
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
                        <strong>Error!</strong> Data Added Fail. Duplicate Model ID/name;
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
              
            <div class="box-body" id="modelData">
                
                <table class="table table-bordered table-striped">  
                    <tr><th><center>SL NO</center></th><th><center>Brand</center></th><th><center>Category</center></th><th><center>Model</center></th><th><center>Details</center></th><th><center>Action</center></th></tr>  
                       <c:forEach var="model" items="${list}" varStatus="count">   
                       <tr>
                       <td><center>${count.count}</center></td> 
                       <td>${model.brandname}</td>  
                       <td>${model.catname}</td>  
                       <td>${model.modelid}</td>  
                       <td>${model.details}</td>
                       <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editModelPopUp" data-id="${model.modelid}" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;
                           <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteModelPopUp" data-id="${model.modelid}" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>
                       </tr>  
                       </c:forEach>  
                  </table> 
            </div><!-- /.box-body -->
            <div class="box-footer">
                              <!-- Modal -->
                              <small>Footer</small>
             
             
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          
          <!-- Insert Model Data -->
          <div class="modal fade" id="insertModelModal" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Insert New Model</h4>
                    </div>
                      
                      <form action="insertModel" method="post" id="addModel" name="addModel">
                          <div class="modal-body" id="insertModalBody">
                        
                        
                      
                         
                         <!-- Brand -->
	                <div class="form-group" id="brand">
	                  <label class="control-label" for="brandList"><i></i>Brand</label>
	                    <select class="form-control" id="brandList" name="brandid" required>
                                <option value="">Select Brand?</option> 
                            </select>
	                </div>
                         
                         <!-- Category -->
	                <div class="form-group" id="category">
	                  <label class="control-label" for="catList"><i></i> Category</label>
                         <select class="form-control" id="catList" name="catid" required>
                                <option value="">Select Category?</option> 
                            </select>
	                </div>
                         
                         <!-- Model Name -->
                        <div class="form-group" id="modelid">
	                  <label class="control-label" for="modelid"><i></i> Model ID/Name</label>
                          <input type="text"  class="form-control" name="modelid" placeholder="Model Name Required">
	                </div>
                         
                         <!-- Details -->
	                <div class="form-group" id="details">
	                  <label class="control-label" for="details"><i></i> Details</label>
                          <textarea class="form-control" name="details" placeholder="Enter Details Information(Optional)" ></textarea>
	                </div>
                         
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="submitModel" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          
          
         <!-- Edit Model Data -->
          <div class="modal fade" id="editModelPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Edit Model Information</h4>
                    </div>
                      
                      <form action="editModel" method="post" id="editModel" name="editModel">
                          <div class="modal-body" id="editModalBody">
                        
                        
                      
                         
                         <!-- Brand -->
	                <div class="form-group" id="editBrand">
	                  <label class="control-label" for="editBrandList"><i></i>Brand</label>
	                    <select class="form-control" id="editBrandList" name="brandid" required>
                                <option value="">Select Brand?</option> 
                            </select>
	                </div>
                         
                         <!-- Category -->
	                <div class="form-group" id="editCategory">
	                  <label class="control-label" for="editCatList"><i></i> Category</label>
                         <select class="form-control" id="editCatList" name="catid" required>
                                <option value="">Select Category?</option> 
                            </select>
	                </div>
                         
                         <!-- Model Name -->
                        <div class="form-group" id="editModelid">
	                  <label class="control-label" for="editModelid"><i></i> Model ID/Name</label>
                          <input type="text"  class="form-control" name="modelid" placeholder="Model Name Required" disabled>
                          <input type="hidden" id="hiddenID" name="modelid"/>
	                </div>
                         
                         <!-- Details -->
	                <div class="form-group" id="editDetails">
	                  <label class="control-label" for="editDetails"><i></i> Details</label>
                          <textarea class="form-control" name="details" placeholder="Enter Details Information(Optional)" ></textarea>
	                </div>
                        
                     </div>
                          
                     <div class="modal-footer">
                            <button id="editSubmitModel" name="submit" class="btn btn-info">Submit</button>
                      </div>
                        
                    </form>
                      
               
                  </div>
                </div>
            </div>
          
          <!-- Delete Model Data -->
          <div class="modal fade" id="deleteModelPopUp" role="dialog">
                <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <center><h4 class="modal-title"><span>Are you sure, want to delete?</span></h4></center>
                    </div>
                      
                          <div class="modal-body" id="editModalBody">
                       
                              
                                  <form action="deleteModel" method="post" id="deleteModel" name="deleteModel">
                                      <input type="hidden" id="hiddenModelID" name="modelid"/>
                                     <center> <button id="deleteModelBtn" name="deleteModelBtn" class="btn btn-danger">Delete</button>
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

