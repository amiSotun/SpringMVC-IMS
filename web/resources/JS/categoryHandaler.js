$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editCategoryPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveCategoryInfo',
            type: 'post',
            data: {catId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
               // console.log(fullData);
                $("#editCategoryid input").val(fullData.catid);
                $("#hiddenCategoryID").val(fullData.catid);
                $("#editCategoryName input").val(fullData.catName);
                $("#editDescription textarea").val(fullData.description);
                 
            }
        });   

    });
    
      $('#insertCategoryModal').on('shown.bs.modal',function(event){
        event.preventDefault();
        var request={
            url: 'newCategoryID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#catid input").val(response);         
            }
            else
                $("#catid input").val("");
        });   

    });
    
    $('#deleteCategoryPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveCategoryInfo',
            type: 'post',
            data: {catId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                //console.log(fullData.catid);
                $("#hiddenCatID").val(fullData.catid);
            }
        });   

    });
    
    // Search for Category
    
    $('#searchCategory').on("keyup",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        var request={
            url: 'searchCategory',
            type: 'get',
            data: {searchVal: searchVal}
        };
        $.ajax(request).done(function (response){
            if(response){
                 $("#catData").html("");
                var fullData=$.parseJSON(response);
               //console.log(fullData.length);
                 if(fullData.length!==0){
                     var searchInfo='<table class="table table-bordered table-striped">\n\
                                    <tr><th><center>SL NO</center></th><th><center>Category ID</center></th><th><center>Category Name</center></th><th><center>Description</center></th><th><center>Action</center></th></tr>\n\ ';
               for(var i=0;i<fullData.length;i++){
                  searchInfo+='<tr>\n\
                                <td><center>'+(i+1)+'<center></td>\n\
                                <td>'+fullData[i].catid+'</td>\n\
                                <td>'+fullData[i].catName+'</td>\n\
                                <td>'+fullData[i].description+'</td>\n\
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editCategoryPopUp" data-id="'+fullData[i].catid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteCategoryPopUp" data-id="'+fullData[i].catid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
                              </tr>';
               }
               $("#catData").html(searchInfo);
                 }
                 else{
                $("#catData").html('<h4><span class="text-info">No Search Found</span></h4>');
//                //window.location.href = 'cat';
                }
                
            }

        });   

    });
       
});


//var id=$(event.relatedTarget).data('id');