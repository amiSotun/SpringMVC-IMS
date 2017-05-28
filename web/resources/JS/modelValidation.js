$(document).ready(function(){

    $("#submitModel").attr('disabled',true);
    var flagArray = {modelid:false,brand:false,category:false};
    var errMsgArray = {
        modelid:"Insert valid Model Id or Name.",
        brand:"Select any Brand",
        category:"Select any Category.",
    };
    var patternArray = {
        category: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{5,10}$/,
        brand: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{5,10}$/,
        modelid: /^[a-zA-Z0-9]+[a-zA-Z0-9.#&:(), \/'-/\r/\n]{2,100}$/
    };

    $("#modelid input").on("blur",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#brand select").on("change",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#category select").on("change",function(event){
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
        $("#addModel").trigger("change");
    }
    $("#addModel").change(function(event){
        event.preventDefault();
        if(!flagArray.modelid || !flagArray.brand ||  !flagArray.category ){
            $("#submitModel").attr('disabled',true);
        }
        else{
            $("#submitModel").attr('disabled',false);
        }
    });
    
});

















