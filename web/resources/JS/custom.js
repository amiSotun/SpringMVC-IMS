$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editCustomerPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveCustomerInfo',
            type: 'post',
            data: {customerId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                console.log(fullData.address);
                $("#editCustomerid input").val(fullData.customerid);
                $("#hiddenID").val(fullData.customerid);
                $("#editName input").val(fullData.name);
                $("#editPhone input").val(fullData.phone);
                $("#editEmail input").val(fullData.email);
                $("#editAddress textarea").val(fullData.address);
                 
            }
        });   

    });
    
      $('#insertCustomerModal').on('shown.bs.modal',function(event){
        event.preventDefault();
        var request={
            url: 'newCustomerID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                $("#customerid input").val(response);         
            }
        });   

    });
    
    $('#deleteCustomerPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        var request={
            url: 'retriveCustomerInfo',
            type: 'post',
            data: {customerId: id}
        };
        $.ajax(request).done(function (response){
            if(response){
                var fullData=$.parseJSON(response);
                $("#hiddenCustomerID").val(fullData.customerid);
            }
        });   

    });
    
    // Search for Customer
    
    $('#searchCustomer').on("keyup",function(event){
        event.preventDefault();
        var searchVal=$(this).val();
        var request={
            url: 'searchCustomer',
            type: 'get',
            data: {searchVal: searchVal}
        };
        $.ajax(request).done(function (response){
            if(response){
                 $("#customerData").html("");
                var fullData=$.parseJSON(response);
               console.log(fullData.length);
                 if(fullData.length!==0){
                     var searchInfo='<table class="table table-bordered table-striped">\n\
                                    <tr><th><center>SL NO</center></th><th><center>Name</center></th><th><center>User ID</center></th><th><center>Phone</center></th><th><center>Email</center></th><th><center>Address</center></th><th><center>Action</center></th></tr>\n\ ';
               for(var i=0;i<fullData.length;i++){
                  searchInfo+='<tr>\n\
                                <td><center>'+(i+1)+'<center></td>\n\
                                <td>'+fullData[i].name+'</td>\n\
                                <td>'+fullData[i].customerid+'</td>\n\
                                <td>'+fullData[i].phone+'</td>\n\
                                <td>'+fullData[i].email+'</td>\n\
                                <td>'+fullData[i].address+'</td>\n\
                                <td><center><a class="btn btn-sm btn-default" target="_blank" data-toggle="modal" data-target="#editCustomerPopUp" data-id="'+fullData[i].customerid+'" title="Edit" data-original-title="Edit"><span title="Edit" class="fa fa-edit"></span></a>&nbsp;\n\
                                            <a class="btn btn-sm btn-danger" target="_blank" data-toggle="modal" data-target="#deleteCustomerPopUp" data-id="'+fullData[i].customerid+'" title="Delete" data-original-title="Delete"><span title="Delete" class="fa fa-times"></span></a></center> </td>\n\
                              </tr>';
               }
               $("#customerData").html(searchInfo);
                 }
                 else{
                $("#customerData").html('<h4><span class="text-info">No Search Found</span></h4>');
//                //window.location.href = 'customers';
                }
                
            }

        });   

    });
       
});


//var id=$(event.relatedTarget).data('id');