$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editProductPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        
        
        // For Retrive Brand Information
        var request={
            url: 'retriveBrandList',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            //console.log("msg");
            if(response){
               var fullData=$.parseJSON(response);
                if(fullData.length!==0){
                   var brandOption='<option value="">Select Brand?</option> ';
                   for(var i=0;i<fullData.length;i++){
                       brandOption+='<option value="'+fullData[i].brandid+'">'+fullData[i].brandName+'</option> ';
                   }
                   $("#editBrandList").html(brandOption);           
                }
            }
        });
        
        //For Retrive Category Information
        var request={
            url: 'retriveCategoryList',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (data){
            if(data){
               var fullData=$.parseJSON(data);
                if(fullData.length!==0){
                   var catOption='<option value="">Select Category?</option> ';
                   for(var i=0;i<fullData.length;i++){
                       catOption+='<option value="'+fullData[i].catid+'">'+fullData[i].catName+'</option> ';
                   }
                   $("#editCatList").html(catOption);           
                }
            }
        });   
        
        // For Retrive Product Information
        console.log(id);
        var request={
            url: 'retriveProductInfo',
            type: 'post',
            data: {modelId: id}
        };
        $.ajax(request).done(function (response){
            console.log(response);
            if(response){
                var fullData=$.parseJSON(response);
               // console.log(fullData.address);
                $("#editProductid input").val(fullData.modelid);
                $("#hiddenID").val(fullData.modelid);
                $("#editCatList").val(fullData.catid).change();
                $("#editBrandList").val(fullData.brandid).change();
                $("#editDetails textarea").val(fullData.details);
                 
            }
        });   

    });
    
    // Insert Product PopUp................................................................
    
      $('#insertProductModal').on('shown.bs.modal',function(event){
        event.preventDefault();
        
        // Create New Stock Id
         var request={
            url: 'newStockID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#stockid input").val(response);  
                $("#hiddenStockId").val(response);
            }
        }); 
        
        // Create New Entry Id
        var request={
            url: 'newEntryID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#entryid input").val(response);  
                $("#hiddenEntryId").val(response);
            }
        }); 
        
         // Retrive Supplier List
        var request={
            url: 'retriveSupplierList',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            //console.log("msg");
            if(response){
               var fullData=$.parseJSON(response);
                if(fullData.length!==0){
                   var supplierOption='<option value="">Select Supplier?</option> ';
                   for(var i=0;i<fullData.length;i++){
                       supplierOption+='<option value="'+fullData[i].supplierid+'">'+fullData[i].name+'</option> ';
                   }
                   $("#supplierList").html(supplierOption);           
                }
            }
        });
        
        // Retrive Brand List
        var request={
            url: 'retriveBrandList',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            //console.log("msg");
            if(response){
               var fullData=$.parseJSON(response);
                if(fullData.length!==0){
                   var brandOption='<option value="">Select Brand?</option> ';
                   for(var i=0;i<fullData.length;i++){
                       brandOption+='<option value="'+fullData[i].brandid+'">'+fullData[i].brandName+'</option> ';
                   }
                   $("#brandList").html(brandOption);           
                }
            }
        });
        
        //Retrive Category List
        var request={
            url: 'retriveCategoryList',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (data){
            if(data){
               var fullData=$.parseJSON(data);
                if(fullData.length!==0){
                   var catOption='<option value="">Select Category?</option> ';
                   for(var i=0;i<fullData.length;i++){
                       catOption+='<option value="'+fullData[i].catid+'">'+fullData[i].catName+'</option> ';
                   }
                   $("#catList").html(catOption);           
                }
            }
        });   

    });  
    
    
    //Retrive Model List if Category Change..............................
    
    $('#catList').on("change",function(event){
        event.preventDefault();
        var brand=$("#brandList").val().trim();
        var category=$("#catList").val().trim();
        if(brand && category){
            var request={
            url: 'retriveModelList',
            type: 'post',
            data: {brandId: brand,catId:category}
        };
        $.ajax(request).done(function (data){
            if(data){
                $("#modelList").html('<option value="">Select Model?</option>');
               var fullData=$.parseJSON(data);
                if(fullData.length!==0){
                   var modelOption='<option value="">Select Model?</option>';
                   for(var i=0;i<fullData.length;i++){
                       modelOption+='<option value="'+fullData[i].modelid+'">'+fullData[i].modelid+'</option> ';
                   }
                   $("#modelList").html(modelOption);    
                }
            }
        });  
        }
        else{
            $("#modelList").html('<option value="">Select Model?</option>');
        }
    });
    
    //Retrive Model List if Brand Change..............................
    
    $('#brandList').on("change",function(event){
        event.preventDefault();
        var brand=$("#brandList").val().trim();
        var category=$("#catList").val().trim();
        if(brand && category){
            var request={
            url: 'retriveModelList',
            type: 'post',
            data: {brandId: brand,catId:category}
        };
        $.ajax(request).done(function (data){
            if(data){
                $("#modelList").html('<option value="">Select Model?</option>');
               var fullData=$.parseJSON(data);
                if(fullData.length!==0){
                   var modelOption='<option value="">Select Model?</option>';
                   for(var i=0;i<fullData.length;i++){
                       modelOption+='<option value="'+fullData[i].modelid+'">'+fullData[i].modelid+'</option> ';
                   }
                   $("#modelList").html(modelOption);    
                }
            }
        });  
        }
        else{
            $("#modelList").html('<option value="">Select Model?</option>');
        }
    });
    
    // Delete Product Details....................................................................
    
    $('#deleteProductPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveProductInfo',
            type: 'post',
            data: {modelId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                $("#hiddenProductID").val(fullData.modelid);
            }
        });   

    });
    
    // Search for Product
    
    $('#searchProduct').on("",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        console.log(searchVal);
        var request={
            url: 'searchProduct',
            type: 'get',
            data: {searchVal: searchVal}
        };
        $.ajax(request).done(function (response){
            console.log(response);
            if(response){
                 $("#modelData").html("");
                var fullData=$.parseJSON(response);
               //console.log(fullData.length);
                 if(fullData.length!==0){
                     var searchInfo='<table class="table table-bordered table-striped">\n\
                                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>\n\ ';
               for(var i=0;i<fullData.length;i++){
                  searchInfo+='<tr>\n\
                                <td><center>'+(i+1)+'<center></td>\n\
                                <td>'+fullData[i].name+'</td>\n\
                                <td>'+fullData[i].modelid+'</td>\n\
                                <td>'+fullData[i].phone+'</td>\n\
                                <td>'+fullData[i].email+'</td>\n\
                                <td>'+fullData[i].address+'</td>\n\
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editProductPopUp" data-id="'+fullData[i].modelid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteProductPopUp" data-id="'+fullData[i].modelid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
                              </tr>';
               }
               $("#modelData").html(searchInfo);
                 }
                 else{
                $("#modelData").html('<h4><span class="text-info">No Search Found</span></h4>');
//                //window.location.href = 'models';
                }
                
            }

        });   

    });
       
});


//var id=$(event.relatedTarget).data('id');