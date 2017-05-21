$(document).ready(function(){

    
    var flagArray = {editName:true,editEmail:true,editPhone:true,editAddress:true};
    var errMsgArray = {
        editName:"Name char-length max:100 and min:3, digit & symbol not allowed.",
        editEmail:"E.g. abc@example.com",
        editPhone:"Only mobile number & digit allowed.Min:11 and Max: 14",
        editAddress: "Min & Max length: 3 & 150 letters, Symbols [,.:#-/\'&()] allowed"
    };
    var patternArray = {
        editName: /^[a-zA-Z. '-]{3,100}$/,
        editEmail: /^[+a-zA-Z0-9._]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,9}$/,
        editPhone: /^[0-9\+]{11,14}$/,
        editAddress: /^[a-zA-Z0-9]+[a-zA-Z0-9.#&:(), \/'-/\r/\n]{3,150}$/
    };

    $("#editName input").on("blur",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#editEmail input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#editPhone input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#editAddress textarea").on("keyup",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    
    function validationForm(id, msg, pattern, element){
        if(!pattern.test($("#"+id+element).val())){
            flagArray[id]= false;
            $("#"+id).removeClass("has-success").addClass("has-error");
            $("#"+id+" i").removeClass("fa fa-check").addClass("fa fa-times-circle-o");
            $("#"+id+" span").remove();
            $("#"+id+element).after(function(){
                return '<span class="help-block">'+msg+'</span>';
            });
        }
        else{
            flagArray[id]= true;
            $("#"+id).removeClass("has-error").addClass("has-success");
            $("#"+id+" i").removeClass("fa fa-times-circle-o").addClass("fa fa-check");
            $("#"+id+" span").remove();
        }
        $("#editSupplier").trigger("change");
    }
    
    $("#editSupplier").change(function(event){
        event.preventDefault();
        if(!flagArray.editName || !flagArray.editEmail ||  !flagArray.editPhone || !flagArray.editAddress ){
            $("#editSupplierSubmit").attr('disabled',true);
        }
        else{
            $("#editSupplierSubmit").attr('disabled',false);
        }
    });
    
});

















