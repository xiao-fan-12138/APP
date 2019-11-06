<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2019/9/11
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String BasePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=BasePath%>">
    <title>APP信息管理维护</title>

    <!-- Bootstrap -->
    <link href="statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="statics/css/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="statics/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="statics/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="statics/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="statics/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="statics/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="statics/css/custom.min.css" rel="stylesheet">
    <style>
        .table_input select{
            width: 182px;
        }
        .table_input td{
            width: 200px;
            height: 50px;
        }
        .table_input td:nth-child(odd){
            text-align: right;
        }
        .div_caozuo a{
            display: block;
            line-height: 25px;
            width: 100px;
        }
        .div_caozuo div{
            display: none;
            position: absolute;
            background: #FFFFFF;
        }
    </style>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
            <jsp:include page="sidebar.jsp" flush="true"/>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>APP信息管理维护<small>${sessionScope.userCode}-您可以通过搜索或者其他的筛选项对APP信息进行修改、删除等管理操作😊</small></h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <form method="get" action="App/select">
                                    <table class="table_input">
                                        <tr>
                                            <td>软件名称：</td>
                                            <td><input type="text" name="softwareName"></td>
                                            <td>app状态：</td>
                                            <td>
                                                <select name="status">
                                                    <option value="0">-请选择-</option>
                                                    <option value="1">待审核</option>
                                                    <option value="2">审核通过</option>
                                                    <option value="3">未通过</option>
                                                    <option value="4">已上架</option>
                                                    <option value="5">已下架</option>
                                                </select>
                                            </td>
                                            <td>所属平台：</td>
                                            <td>
                                                <select name="flatformId" class="platform">
                                                    <option value="0">-请选择-</option>
                                                    <option value="1">通用</option>
                                                    <option value="2">手机</option>
                                                    <option value="3">平板</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>一级分类：</td>
                                            <td>
                                                <select name="categoryLevel1" class="leve1">
                                                    <option value="0">-请选择-</option>
                                                </select>
                                            </td>
                                            <td>二级分类：</td>
                                            <td>
                                                <select name="categoryLevel2">
                                                    <option value="0">-请选择-</option>
                                                </select>
                                            </td>
                                            <td>三级分类：</td>
                                            <td>
                                                <select name="categoryLevel3">
                                                    <option value="0">-请选择-</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" value="查询"/></td>
                                        </tr>

                                    </table>
                                </form>
                            </div>
                            <a href="${pageContext.request.contextPath}/App/Add"><input type="button" value="新增APP基础信息"></a>
                            <div class="x_content">
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <td>软件id</td>
                                        <th>软件名称</th>
                                        <th>APK名称</th>
                                        <th>软件大小(单位：M)</th>
                                        <th>所属平台</th>
                                        <th>所属分类(一级分类、二级分类、三级分类)</th>
                                        <th>状态</th>
                                        <th>下载次数</th>
                                        <th>最新版本号</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <c:forEach items="${appList}" var="AppInfo">
                                        <tr>
                                            <td>${AppInfo.id}</td>
                                            <td>${AppInfo.softwareName}</td>
                                            <td>${AppInfo.APKName}</td>
                                            <td>${AppInfo.softwareSize}</td>
                                            <td>
                                                <c:if test="${AppInfo.flatformId==1}">通用</c:if>
                                                <c:if test="${AppInfo.flatformId==2}">手机</c:if>
                                                <c:if test="${AppInfo.flatformId==3}">平板</c:if>
                                            </td>
                                            <td>${AppInfo.category1Name}->${AppInfo.category2Name}->${AppInfo.category3Name}</td>
                                            <td>
                                                <c:if test="${AppInfo.status==1}">待审核</c:if>
                                                <c:if test="${AppInfo.status==2}">审核通过</c:if>
                                                <c:if test="${AppInfo.status==3}">未通过</c:if>
                                                <c:if test="${AppInfo.status==4}">已上架</c:if>
                                                <c:if test="${AppInfo.status==5}">已下架</c:if>
                                            </td>
                                            <td>${AppInfo.downloads}</td>
                                            <td>${AppInfo.versionId}</td>

                                            <td>
                                                <div class="div_caozuo">
                                                    <p class="div_caozuo_click">点击操作</p>
                                                    <div>
                                                        <a href="App/versionAdd?appId=${AppInfo.id}">新增版本</a>
                                                        <c:if test="${AppInfo.status==1 || AppInfo.status==3}"> <a href="version/updateVersion?appId=${AppInfo.id}">修改版本</a></c:if>
                                                        <c:if test="${AppInfo.status==1 || AppInfo.status==3}">
                                                            <a href="App/update?appId=${AppInfo.id}" class="appUpdate">修改</a>
                                                        </c:if>
                                                        <a href="javascript:;" class="appDel">删除</a>
                                                        <a href="App/lookInfo?appId=${AppInfo.id}">查看</a>
                                                        <c:if test="${AppInfo.status==2 || AppInfo.status==5}">
                                                            <a href="">上架</a>
                                                        </c:if>
                                                        <c:if test="${AppInfo.status==2 || AppInfo.status==4}">
                                                            <a href="">下架</a>
                                                        </c:if>
                                                    </div>

                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


            </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>


<!-- jQuery -->
<script src="static/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="static/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="static/js/fastclick.js"></script>
<!-- NProgress -->
<script src="static/js/nprogress.js"></script>
<!-- iCheck -->
<script src="static/js/icheck.min.js"></script>
<!-- Datatables -->
<script src="static/js/jquery.dataTables.min.js"></script>
<script src="static/js/dataTables.bootstrap.min.js"></script>
<script src="static/js/dataTables.buttons.min.js"></script>
<script src="static/js/buttons.bootstrap.min.js"></script>
<script src="static/js/buttons.flash.min.js"></script>
<script src="static/js/buttons.html5.min.js"></script>
<script src="static/js/buttons.print.min.js"></script>
<script src="static/js/dataTables.fixedHeader.min.js"></script>
<script src="static/js/dataTables.keyTable.min.js"></script>
<script src="static/js/dataTables.responsive.min.js"></script>
<script src="static/js/responsive.bootstrap.js"></script>
<script src="static/js/datatables.scroller.min.js"></script>
<script src="static/js/jszip.min.js"></script>
<script src="static/js/pdfmake.min.js"></script>
<script src="static/js/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="static/js/custom.min.js"></script>
<!-- Datatables -->
<script>
    $(document).ready(function() {
        //点击操作
        $(".div_caozuo_click").click(function () {
            $(this).next().toggle(500);
        });

        //删除APP
        $(".appDel").click(function () {
            var name=$(this).parents("tr").children("td").first().next().text();
            var id=$(this).parents("tr").children("td").first().text();
            if(confirm("是否删除软件'"+name)){
                //删除
                $.getJSON("App/delApp?id="+id,function (data) {
                    if(data[0]=="true"){
                        //删除成功
                        alert("删除成功！！");
                        window.location.href="/APP/DevUser/manage";
                    }else{
                        alert("删除失败！！");
                    }
                });
            }
        });
            
        var handleDataTableButtons = function() {
            if ($("#datatable-buttons").length) {
                $("#datatable-buttons").DataTable({
                    dom: "Bfrtip",
                    buttons: [
                        {
                            extend: "copy",
                            className: "btn-sm"
                        },
                        {
                            extend: "csv",
                            className: "btn-sm"
                        },
                        {
                            extend: "excel",
                            className: "btn-sm"
                        },
                        {
                            extend: "pdfHtml5",
                            className: "btn-sm"
                        },
                        {
                            extend: "print",
                            className: "btn-sm"
                        },
                    ],
                    responsive: true
                });
            }
        };

        TableManageButtons = function() {
            "use strict";
            return {
                init: function() {
                    handleDataTableButtons();
                }
            };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
            keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
            ajax: "js/datatables/json/scroller-demo.json",
            deferRender: true,
            scrollY: 380,
            scrollCollapse: true,
            scroller: true
        });

        $('#datatable-fixed-header').DataTable({
            fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
            'order': [[ 1, 'asc' ]],
            'columnDefs': [
                { orderable: false, targets: [0] }
            ]
        });
        $datatable.on('draw.dt', function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_flat-green'
            });
        });

        TableManageButtons.init();
    });
</script>
<!-- /Datatables -->
</body>
</html>
