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
       
});


//var id=$(event.relatedTarget).data('id');