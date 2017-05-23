$(document).ready(function(){

    
    var flagArray = {editBrandName:true,editDescription:true};
    var errMsgArray = {
        editBrandName:"Name char-length max:100 and min:3, digit & symbol not allowed.",
        editDescription: "Min & Max length: 3 & 150 letters, Symbols [,.:#-/\'&()] allowed"
    };
    var patternArray = {
        editBrandName: /^[a-zA-Z. '-]{3,100}$/,
        editDescription: /^[a-zA-Z0-9]+[a-zA-Z0-9.#&:(), \/'-/\r/\n]{3,150}$/
    };

    $("#editBrandName input").on("blur",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#editDescription textarea").on("keyup",function(event){
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
        $("#editBrand").trigger("change");
    }
    
    $("#editBrand").change(function(event){
        event.preventDefault();
        if(!flagArray.editBrandName || !flagArray.editDescription ){
            $("#editBrandSubmit").attr('disabled',true);
        }
        else{
            $("#editBrandSubmit").attr('disabled',false);
        }
    });
    
});

















