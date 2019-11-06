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
    <title>修改APP基础信息</title>
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

                    <form class="form-horizontal form-label-left"  action="App/UpdateApp?id=${updateApp.id}" method="post" enctype="multipart/form-data">

                        <span class="section">修改APP基础信息</span>
                        <%--软件名称--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">软件名称 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="softwareName" placeholder="请输入软件名称" required="required" type="text" value="${updateApp.softwareName}">
                            </div>
                        </div>
                        <%--APK名称--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">APK名称 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="email" name="APKName" required="required" class="form-control col-md-7 col-xs-12" placeholder="请输入APK名称" value="${updateApp.APKName}">
                            </div>
                        </div>
                        <%--支持ROM--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">支持ROM <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="email2" name="supportROM" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12" placeholder="请输入支持的ROM" value="${updateApp.supportROM}">
                            </div>
                        </div>
                        <%--界面语言--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="interfaceLanguage">界面语言 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="interfaceLanguage" name="interfaceLanguage"  class="form-control col-md-7 col-xs-12" placeholder="请输入软件的界面语言" value="${updateApp.interfaceLanguage}">
                            </div>
                        </div>
                        <%--软件大小--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website"> 软件大小 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="website" name="softwareSize" required="required"  class="form-control col-md-7 col-xs-12" placeholder="请输入软件的大小，单位为MB" value="${updateApp.softwareSize}">
                            </div>
                        </div>
                        <%--下载次数--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">下载次数 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="occupation" type="text" name="downloads" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" placeholder="请输入软件的下载次数" value="${updateApp.downloads}">
                            </div>
                        </div>
                        <%--所属平台--%>
                        <div class="item form-group">
                            <label for="flatformId" class="control-label col-md-3">所属平台</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="flatformId" name="flatformId">
                                    <option value="0">-请选择-</option>
                                    <c:choose>
                                        <c:when test="${updateApp.flatformId==1}">
                                            <option value="1" selected>手机</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2">平板</option>
                                            <option value="3">通用</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.flatformId==2}">
                                            <option value="2" selected>平板</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">手机</option>
                                            <option value="3">通用</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.flatformId==3}">
                                            <option value="3" selected>通用</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2">平板</option>
                                            <option value="1">手机</option>
                                        </c:otherwise>
                                    </c:choose>

                                </select>
                            </div>
                        </div>
                        <%--一级分类--%>
                        <div class="item form-group">
                            <label for="categoryLevel1" class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="categoryLevel1" name=categoryLevel1">
                                    <option value="0">请选择</option>
                                    <c:forEach items="${categoryLevel1}" var="category">
                                        <c:choose>
                                            <c:when test="${updateApp.categoryLevel1==category.id}">
                                                <option value="${category.id}" selected>${category.categoryName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.id}">${category.categoryName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <%--<option value="${category.id}">${category.categoryName}</option>--%>
                                    </c:forEach>
                                </select>
                                <%--<input id="password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">--%>
                            </div>
                        </div>
                        <%--二级分类--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="categoryLevel2">二级分类 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="categoryLevel2" name="categoryLevel2">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                        <%--三级分类--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="categoryLevel3">三级分类 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="categoryLevel3" name="categoryLevel3">
                                    <option value="0">-请选择-</option>
                                </select>
                                <%--<textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>--%>
                            </div>
                        </div>
                        <%--APP状态--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">APP状态<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="status" name="status">
                                    <c:choose>
                                        <c:when test="${updateApp.status==1}">
                                            <option value="1" selected>待审核</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2">审核通过</option>
                                            <option value="3">审核不通过</option>
                                            <option value="4">已上架</option>
                                            <option value="5">已下架</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.status==2}">
                                            <option value="2" selected>审核通过</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">待审核</option>
                                            <option value="3">审核不通过</option>
                                            <option value="4">已上架</option>
                                            <option value="5">已下架</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.status==3}">
                                            <option value="3" selected>审核不通过</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">待审核</option>
                                            <option value="2">审核通过</option>
                                            <option value="4">已上架</option>
                                            <option value="5">已下架</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.status==4}">
                                            <option value="4" selected>已上架</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2">审核通过</option>
                                            <option value="3">审核不通过</option>
                                            <option value="1">待审核</option>
                                            <option value="5">已下架</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${updateApp.status==5}">
                                            <option value="5" selected>已下架</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2">审核通过</option>
                                            <option value="3">审核不通过</option>
                                            <option value="4">已上架</option>
                                            <option value="1">待审核</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                        <%--应用简介--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="appInfo">应用简介<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="appInfo" required="required" name="appInfo" class="form-control col-md-7 col-xs-12">${updateApp.appInfo}</textarea>
                            </div>
                        </div>
                        <%--显示原LOGO图片--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">原LOGO图片<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">

         <img src="${pageContext.request.contextPath}/statics/uploadfiles/${updateApp.logoLocPath}" width="150" height="100">
                            </div>
                        </div>
                        <%--LOGO图片--%>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="appInfo">LOGO图片<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="file" name="multipartFile" id="logoLocPath">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <button type="submit" class="btn btn-primary">Cancel</button>
                                <button id="send" type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--js--%>
<script src="${pageContext.request.contextPath}/statics/js/APPAdd.js"></script>
</body>
</html>
