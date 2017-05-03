$(function(){
    $('.cancel').on('click', function(){
        window.history.back();
    });
    
    $('#editCustomerPopUp').on('shown.bs.modal',function(event){
        event.preventDefault();
        var id=$(event.relatedTarget).data('id');
        console.log(id);
       
        //console.log('editCustomerPopUp');
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
                $("#editName input").val(fullData.name);
                $("#editPhone input").val(fullData.phone);
                $("#editEmail input").val(fullData.email);
                $("#editAddress textarea").val(fullData.address);
                 
            }
        });   

    });
    
      $('#insertCustomerModal').on('shown.bs.modal',function(event){
        event.preventDefault();
       // alert('editCustomerPopUp');
        console.log('insertCustomerModal');;
        var request={
            url: 'newCustomerID',
            type: 'post',
            data: {action: 'show'}
        };
        $.ajax(request).done(function (response){
            if(response){
                //alert(response);
                $("#customerid input").val(response);
               
            }
        });   

    });
//    $('#insertCustomerModal').on('hidden.bs.modal', function (e) {
//        var target = $(e.target);
//        target.removeData('bs.modal')
//        .find(".clearable-content").html('');
//    });
       
});


//var id=$(event.relatedTarget).data('id');