<%--
  Created by IntelliJ IDEA.
  User: 小樊
  Date: 2019/9/17
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String BasePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=BasePath%>">
    <title>查看APP信息</title>
    <!-- Bootstrap -->
    <link href="statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href=".statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="statics/css/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="statics/css/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="statics/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="statics/css/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="statics/css/starrr.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="statics/css/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
            <%--引入左侧边栏--%>
            <jsp:include page="sidebar.jsp" flush="true"/>
            <%--右侧--%>
            <div class="right_col" role="main">
                <div class="x_panel">
                    <div class="x_title">
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <form class="form-horizontal form-label-left"  action="javascript:;" method="post" enctype="multipart/form-data">

                            <span class="section">查看APP信息</span>
                            <%--软件名称--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">软件名称 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="softwareName"  required="required" type="text" readonly="readonly" value="${appInfo.softwareName}">
                                </div>
                            </div>
                            <%--APK名称--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">APK名称 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="email" name="APKName" required="required" class="form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.APKName}">
                                </div>
                            </div>
                            <%--支持ROM--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">支持ROM <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="email2" name="supportROM" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.supportROM}">
                                </div>
                            </div>
                            <%--界面语言--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="interfaceLanguage">界面语言 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="interfaceLanguage" name="interfaceLanguage"  class="form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.interfaceLanguage}">
                                </div>
                            </div>
                            <%--软件大小--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website"> 软件大小 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="website" name="softwareSize" required="required"  class="form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.softwareSize}">
                                </div>
                            </div>
                            <%--下载次数--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">下载次数 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="occupation" type="text" name="downloads" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.downloads}">
                                </div>
                            </div>
                            <%--所属平台--%>
                            <div class="item form-group">
                                <label for="flatformId" class="control-label col-md-3">所属平台</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="flatformId" type="text" name="downloads" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.flatformName}">
                                </div>
                            </div>

                            <%--所属分类--%>
                            <div class="item form-group">
                                <label for="flatformId" class="control-label col-md-3">所属分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.category1Name}-->${appInfo.category2Name}-->${appInfo.category3Name}">
                                </div>
                            </div>

                            <%--app状态--%>
                            <div class="item form-group">
                                <label for="status" class="control-label col-md-3">app状态</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="status" type="text" name="downloads" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" readonly="readonly" value="${appInfo.statusName}">
                                </div>
                            </div>


                            <%--应用简介--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="appInfo">应用简介<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea id="appInfo" required="required" name="appInfo" class="form-control col-md-7 col-xs-12" readonly="readonly">${appInfo.appInfo}</textarea>
                                </div>
                            </div>
                            <%--LOGO图片--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">LOGO图片<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <img src="${pageContext.request.contextPath}/statics/uploadfiles/${appInfo.logoLocPath}" width="150" height="100">
                                </div>
                            </div>
                            <%--<div class="ln_solid"></div>--%>
                            <%--<div class="form-group">--%>
                                <%--<div class="col-md-6 col-md-offset-3">--%>
                                    <%--<button type="submit" class="btn btn-primary">Cancel</button>--%>
                                    <%--<button id="send" type="submit" class="btn btn-success">Submit</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </form>

                        <%--历史版本--%>
                            <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <td>软件id</td>
                                    <td>软件名称</td>
                                    <th>版本号</th>
                                    <th>版本大小(单位：M)</th>
                                    <th>发布状态</th>
                                    <th>APK文件下载</th>
                                    <th>最近更新时间</th>
                                </tr>
                                </thead>
                                <c:forEach items="${appVersionList}" var="version">
                                    <thead>
                                    <tr>
                                        <td>${appInfo.id}</td>
                                        <td>${appInfo.softwareName}</td>
                                        <td>${version.versionNo}</td>
                                        <td>${version.versionSize}</td>
                                        <td>${version.publishStatusName}</td>
                                        <td>${version.apkFileName}</td>
                                        <td>${version.modifyDate}</td>
                                    </tr>
                                    </thead>
                                </c:forEach>

                            </table>

                        <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <a href="${pageContext.request.contextPath}/DevUser/manage"><input type="button" value="返回"></a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>


<%--js--%>
<script src="${pageContext.request.contextPath}/statics/js/APPAdd.js"></script>
</body>
</html>
