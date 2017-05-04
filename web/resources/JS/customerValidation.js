$(document).ready(function(){

    $("#submitCustomer").attr('disabled',true);
    var flagArray = {name:false,email:false,phone:false,address:false};
    var errMsgArray = {
        name:"Name char-length max:100 and min:3, digit & symbol not allowed.",
        email:"E.g. abc@example.com",
        phone:"Only mobile number & digit allowed.",
        address: "Min & Max length: 4 & 150 letters, Symbols [,.:#-/\'&()] allowed"
    };
    var patternArray = {
        name: /^[a-zA-Z. '-]{3,100}$/,
        email: /^[+a-zA-Z0-9._]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,9}$/,
        phone: /^[0-9\+]{11,14}$/,
        address: /^[a-zA-Z0-9]+[a-zA-Z0-9.#&:(), \/'-/\r/\n]{3,150}$/
    };

    $("#name input").on("blur",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#email input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#phone input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#address textarea").on("keyup",function(event){
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
        $("#addCustomer").trigger("change");
    }
    $("#addCustomer").change(function(event){
        event.preventDefault();
        if(!flagArray.name || !flagArray.email ||  !flagArray.phone || !flagArray.address ){
            $("#submitCustomer").attr('disabled',true);
        }
        else{
            $("#submitCustomer").attr('disabled',false);
        }
    });
    
});

















