$(function () {

    //点击一级分类
    $("#categoryLevel1").change(function () {
       // 父级id
       var parentId=$("#categoryLevel1").val();
       var url="App/categoryLevel?parentId="+parentId;
        $.getJSON(url,function (data) {
            if(data!=null){
                $("#categoryLevel2").html("");
                $("#categoryLevel2").append("<option value='0'>请选择</option>");
                for(var i=0;i<data.length;i++){
                    $("#categoryLevel2").append("<option value="+data[i].id+">"+data[i].categoryName+"</option>");
                }
            }
        });
    });


    //点击一级分类
    $("#categoryLevel2").change(function () {
        // 父级id
        var parentId=$("#categoryLevel2").val();
        var url="App/categoryLevel?parentId="+parentId;
        $.getJSON(url,function (data) {
            if(data!=null){
                $("#categoryLevel3").html("");
                $("#categoryLevel3").append("<option value='0'>请选择</option>");
                for(var i=0;i<data.length;i++){
                    $("#categoryLevel3").append("<option value="+data[i].id+">"+data[i].categoryName+"</option>");
                }
            }
        });
    });
});