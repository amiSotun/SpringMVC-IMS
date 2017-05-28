$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editModelPopUp').on('shown.bs.modal',function(event){
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
        
        // For Retrive Model Information
        console.log(id);
        var request={
            url: 'retriveModelInfo',
            type: 'post',
            data: {modelId: id}
        };
        $.ajax(request).done(function (response){
            console.log(response);
            if(response){
                var fullData=$.parseJSON(response);
               // console.log(fullData.address);
                $("#editModelid input").val(fullData.modelid);
                $("#hiddenID").val(fullData.modelid);
                $("#editCatList").val(fullData.catid).change();
                $("#editBrandList").val(fullData.brandid).change();
                $("#editDetails textarea").val(fullData.details);
                 
            }
        });   

    });
    
    // Insert Model PopUp
      $('#insertModelModal').on('shown.bs.modal',function(event){
        event.preventDefault();
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
    
    $('#deleteModelPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveModelInfo',
            type: 'post',
            data: {modelId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                $("#hiddenModelID").val(fullData.modelid);
            }
        });   

    });
    
    // Search for Model
    
    $('#searchModel').on("",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        console.log(searchVal);
        var request={
            url: 'searchModel',
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
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editModelPopUp" data-id="'+fullData[i].modelid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteModelPopUp" data-id="'+fullData[i].modelid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
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