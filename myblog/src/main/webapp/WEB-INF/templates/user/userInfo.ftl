<!DOCTYPE html>
<html lang="zh-CN">
<head>
<#assign ctx = request.contextPath/>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>summer</title>
  <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctx}/static/css/index.css" rel="stylesheet"/>

  <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/layer.js" type="text/javascript"></script>
  <!--[if lt IE 9]>
  <script src="${ctx}/static/js/html5shiv.min.js"></script>
  <script src="${ctx}/static/js/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<#include "../include/header1.ftl">
<!-- 中间内容 -->
<div class="container-fluid">
  <h1 class="title center" align="center">个人资料</h1>
  <br/>
  <div class="col-sm-offset-2 col-md-offest-2">
    <!-- 表单输入 -->
    <div class="form-horizontal">
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 col-md-2 control-label">用户名</label>
        <div class="col-sm-6 col-md-6">
          <input type="text" class="form-control" id="inputUserName" placeholder="请输入数字" readonly/>
        </div>
      </div>
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱</label>
        <div class="col-sm-6 col-md-6">
          <input type="email" class="form-control" id="inputEmail" placeholder="请输入正确的邮箱格式" readonly/>
        </div>
      </div>
    </div>
    <br/>
  </div>
</div>

<!--尾部-->
<script type="text/javascript">
  initData();
  function initData() {
    var userInfo = getUserByName();
    document.getElementById("inputUserName").value = userInfo.username;
    document.getElementById("inputEmail").value = userInfo.email;

  }

  function getUserByName() {
    var userResult = "";
    $.ajax({
      async : false, //设置同步
      url : '${ctx}/user/checkUserInfo.do',
      dataType : 'json',
      success : function(result) {
        userResult = result.result;
      },
      error : function(result) {
        layer.alert('查询错误');
      }
    });
    userResult = JSON.parse(userResult);
    return userResult;
  }
</script>
</body>
</html>