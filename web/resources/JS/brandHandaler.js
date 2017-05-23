$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editBrandPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveBrandInfo',
            type: 'post',
            data: {brandId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
               // console.log(fullData);
                $("#editBrandid input").val(fullData.brandid);
                $("#hiddenBrandID").val(fullData.brandid);
                $("#editBrandName input").val(fullData.brandName);
                $("#editDescription textarea").val(fullData.description);
                 
            }
        });   

    });
    
      $('#insertBrandModal').on('shown.bs.modal',function(event){
        event.preventDefault();
        var request={
            url: 'newBrandID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#brandid input").val(response);         
            }
            else
                $("#brandid input").val("");
        });   

    });
    
    $('#deleteBrandPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveBrandInfo',
            type: 'post',
            data: {brandId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                //console.log(fullData.brandid);
                $("#hiddenBndID").val(fullData.brandid);
            }
        });   

    });
    
    // Search for Brand
    
    $('#searchBrand').on("keyup",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        var request={
            url: 'searchBrand',
            type: 'get',
            data: {searchVal: searchVal}
        };
        $.ajax(request).done(function (response){
            if(response){
                 $("#brandData").html("");
                var fullData=$.parseJSON(response);
               //console.log(fullData.length);
                 if(fullData.length!==0){
                     var searchInfo='<table class="table table-bordered table-striped">\n\
                                    <tr><th><center>SL NO</center></th><th><center>Brand ID</center></th><th><center>Brand Name</center></th><th><center>Description</center></th><th><center>Action</center></th></tr>\n\ ';
               for(var i=0;i<fullData.length;i++){
                  searchInfo+='<tr>\n\
                                <td><center>'+(i+1)+'<center></td>\n\
                                <td>'+fullData[i].brandid+'</td>\n\
                                <td>'+fullData[i].brandName+'</td>\n\
                                <td>'+fullData[i].description+'</td>\n\
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editBrandPopUp" data-id="'+fullData[i].brandid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteBrandPopUp" data-id="'+fullData[i].brandid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
                              </tr>';
               }
               $("#brandData").html(searchInfo);
                 }
                 else{
                $("#brandData").html('<h4><span class="text-info">No Search Found</span></h4>');
//                //window.location.href = 'brands';
                }
                
            }

        });   

    });
       
});


//var id=$(event.relatedTarget).data('id');