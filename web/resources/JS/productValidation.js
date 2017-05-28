$(document).ready(function(){

    $("#submitProduct").attr('disabled',true);
    var flagArray = {invoice:false,invoiceData:false,brand:false,reorderlevel:false,category:false,quantity:false,modelid:false,ppi:false,spi:false,supplier:false};
    var errMsgArray = {
        invoice:"Enter valid invoice id.",
        invoiceData:"Please Fillup invoice date.",
        brand:"Select any Brand",
        category:"Select any Category",
        modelid:"Select any Model",
        supplier:"Select Supplier",
        reorderlevel:"Enter reorder level only digit.",
        quantity:"Enter Valid quantity, only Digit allowed",
        ppi: "Only Digit Allowed, Enter valid Price",
        spi: "Only Digit Allowed, Enter valid Price"
    };
    var patternArray = {
        reorderlevel: /^[1-9\+]{1,10}$/,
        quantity: /^[1-9\+]{1,10}$/,
        invoice: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{2,10}$/,
        invoiceData: /^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/,
        ppi: /^[0-9]+(?:\.[0-9]+)?$/,
        spi: /^[0-9]+(?:\.[0-9]+)?$/,
        category: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{1,10}$/,
        brand: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{1,10}$/,
        supplier: /^[a-zA-Z0-9]+[a-zA-Z0-9-]{1,10}$/,
        modelid: /^[a-zA-Z0-9]+[a-zA-Z0-9.#&:(), \/'-/\r/\n]{1,100}$/
    };
    
    $("#modelid select").on("change",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#supplier select").on("change",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#brand select").on("change",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#category select").on("change",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#spi input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#ppi input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#reorderlevel input").on("blur",function(event){
        //event.preventDefault();
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#quantity input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#invoice input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    $("#invoiceData input").on("blur",function(event){
        var parentId = $(this).parent().attr("id"), element = event.target.nodeName.toLowerCase();
        validationForm(parentId,errMsgArray[parentId],patternArray[parentId]," "+element);
    });
    
    function validationForm(id, msg, pattern, element){
        if(!pattern.test($("#"+id+element).val())){
            flagArray[id]= false;
            $("#"+id).removeClass("has-success").addClass("has-error");
            $("#"+id+" i").removeClass("fa fa-check").addClass("fa fa-times-circle-o");
            //$("#"+id+" span").remove();
//            $("#"+id+element).after(function(){
//                return '<span class="help-block">'+msg+'</span>';
//            });
        }
        else{
            flagArray[id]= true;
            $("#"+id).removeClass("has-error").addClass("has-success");
            $("#"+id+" i").removeClass("fa fa-times-circle-o").addClass("fa fa-check");
            //$("#"+id+" span").remove();
        }
        $("#addProduct").trigger("change");
    }
    $("#addProduct").change(function(event){
        event.preventDefault();
        if(!flagArray.supplier ||  !flagArray.modelid ||!flagArray.ppi || !flagArray.spi ||  !flagArray.brand || !flagArray.category || !flagArray.reorderlevel || !flagArray.quantity ||  !flagArray.invoice || !flagArray.invoiceData ){
            $("#submitProduct").attr('disabled',true);
        }
        else{
            $("#submitProduct").attr('disabled',false);
        }
    });
    
    
    
});

















