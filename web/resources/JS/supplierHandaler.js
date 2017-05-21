$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editSupplierPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveSupplierInfo',
            type: 'post',
            data: {supplierId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
               // console.log(fullData.address);
                $("#editSupplierid input").val(fullData.supplierid);
                $("#hiddenID").val(fullData.supplierid);
                $("#editName input").val(fullData.name);
                $("#editPhone input").val(fullData.phone);
                $("#editEmail input").val(fullData.email);
                $("#editAddress textarea").val(fullData.address);
                 
            }
        });   

    });
    
      $('#insertSupplierModal').on('shown.bs.modal',function(event){
        event.preventDefault();
        var request={
            url: 'newSupplierID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#supplierid input").val(response);         
            }
            else
                $("#supplierid input").val("");
        });   

    });
    
    $('#deleteSupplierPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveSupplierInfo',
            type: 'post',
            data: {supplierId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                $("#hiddenSupplierID").val(fullData.supplierid);
            }
        });   

    });
    
    // Search for Supplier
    
    $('#searchSupplier').on("keyup",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        var request={
            url: 'searchSupplier',
            type: 'get',
            data: {searchVal: searchVal}
        };
        $.ajax(request).done(function (response){
            if(response){
                 $("#supplierData").html("");
                var fullData=$.parseJSON(response);
               //console.log(fullData.length);
                 if(fullData.length!==0){
                     var searchInfo='<table class="table table-bordered table-striped">\n\
                                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>\n\ ';
               for(var i=0;i<fullData.length;i++){
                  searchInfo+='<tr>\n\
                                <td><center>'+(i+1)+'<center></td>\n\
                                <td>'+fullData[i].name+'</td>\n\
                                <td>'+fullData[i].supplierid+'</td>\n\
                                <td>'+fullData[i].phone+'</td>\n\
                                <td>'+fullData[i].email+'</td>\n\
                                <td>'+fullData[i].address+'</td>\n\
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editSupplierPopUp" data-id="'+fullData[i].supplierid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteSupplierPopUp" data-id="'+fullData[i].supplierid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
                              </tr>';
               }
               $("#supplierData").html(searchInfo);
                 }
                 else{
                $("#supplierData").html('<h4><span class="text-info">No Search Found</span></h4>');
//                //window.location.href = 'suppliers';
                }
                
            }

        });   

    });
       
});


//var id=$(event.relatedTarget).data('id');