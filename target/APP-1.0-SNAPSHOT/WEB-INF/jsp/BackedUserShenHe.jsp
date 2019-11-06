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
    <title>审核APP</title>
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

                    <form class="form-horizontal form-label-left"  action="" method="post" enctype="multipart/form-data">

                        <span class="section">审核APP</span>
                        <%--软件名称--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">软件名称 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="softwareName" placeholder="请输入软件名称" required="required" type="text" value="${appInfo.softwareName}" readonly="readonly">
                            </div>
                        </div>
                        <%--APK名称--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">APK名称 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="email" name="APKName" required="required" class="form-control col-md-7 col-xs-12" placeholder="请输入APK名称" value="${appInfo.APKName}" readonly="readonly">
                            </div>
                        </div>
                        <%--支持ROM--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">支持ROM <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="email2" name="supportROM" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12" placeholder="请输入支持的ROM" value="${appInfo.supportROM}" readonly="readonly">
                            </div>
                        </div>
                        <%--界面语言--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="interfaceLanguage">界面语言 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="interfaceLanguage" name="interfaceLanguage"  class="form-control col-md-7 col-xs-12" placeholder="请输入软件的界面语言" value="${appInfo.interfaceLanguage}" readonly="readonly">
                            </div>
                        </div>
                        <%--软件大小--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website"> 软件大小 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="website" name="softwareSize" required="required"  class="form-control col-md-7 col-xs-12" placeholder="请输入软件的大小，单位为MB" value="${appInfo.softwareSize}" readonly="readonly">
                            </div>
                        </div>
                        <%--下载次数--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">下载次数 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="occupation" type="text" name="downloads" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" placeholder="请输入软件的下载次数" value="${appInfo.downloads}" readonly="readonly">
                            </div>
                        </div>
                        <%--所属平台--%>
                        <div class="item form-group">
                            <label for="flatformName" class="control-label col-md-3">所属平台</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="flatformName" type="text" name="flatformName" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" placeholder="请输入软件的下载次数" value="${appInfo.flatformName}" readonly="readonly">
                            </div>
                        </div>
                        <%--所属分类--%>
                        <div class="item form-group">
                            <label for="categoryLevel" class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="categoryLevel" type="password" name="categoryLevel"  class="form-control col-md-7 col-xs-12" required="required" value="${appInfo.category1Name}->${appInfo.category2Name}->${appInfo.category3Name}" readonly="readonly">
                            </div>
                        </div>
                        <%--APP状态--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">APP状态<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="status" type="password" name="status"  class="form-control col-md-7 col-xs-12" required="required" value="${appInfo.statusName}" readonly="readonly">
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
                        <%--显示原LOGO图片--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">原LOGO图片<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">

         <img src="${pageContext.request.contextPath}/statics/uploadfiles/${appInfo.logoLocPath}" width="150" height="100">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="BackendUser/shenHe?appId=${appInfo.id}&status=2"><button type="button" class="btn btn-primary">审核通过</button></a>
                                <a  href="BackendUser/shenHe?appId=${appInfo.id}&status=3"><button id="send" type="button" class="btn btn-success">审核不通过</button></a>

                            </div>
                        </div>
                        <%--最新版本信息--%>
                        <span class="section">最新版本</span>
                        <%--版本号--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">版本号<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="versionNo" type="text" name="versionNO"  class="form-control col-md-7 col-xs-12" required="required" value="${appVersion.versionNo}" readonly="readonly">
                            </div>
                        </div>
                        <%--版本大小--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">版本大小<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="versionSize" type="text" name="versionSize"  class="form-control col-md-7 col-xs-12" required="required" value="${appVersion.versionSize}">
                            </div>
                        </div>
                        <%--发布状态--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">发布状态<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="publishStatus" type="text" name="publishStatus"  class="form-control col-md-7 col-xs-12" required="required" value="预发布">
                            </div>
                        </div>
                        <%--版本简介--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">版本简介<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="versionInfo" type="text" name="versionInfo"  class="form-control col-md-7 col-xs-12" required="required" value="${appVersion.versionInfo}">
                            </div>
                        </div>
                        <%--apk文件下载--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">apk文件下载<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="downloadLink" type="text" name="downloadLink"  class="form-control col-md-7 col-xs-12" required="required" value="${appVersion.downloadLink}">
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>


<%--js--%>
<script src="${pageContext.request.contextPath}/statics/js/APPAdd.js"></script>
</body>
</html>
