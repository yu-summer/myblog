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
  <h1 class="title center" align="center">注册</h1>
  <br/>
  <div class="col-sm-offset-2 col-md-offest-2">
    <!-- 表单输入 -->
    <div class="form-horizontal">
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 col-md-2 control-label">用户名</label>
        <div class="col-sm-6 col-md-6">
          <input type="text" class="form-control" id="inputUserName" placeholder="请输入数字"/>
        </div>
      </div>
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱</label>
        <div class="col-sm-6 col-md-6">
          <input type="email" class="form-control" id="inputEmail" placeholder="请输入正确的邮箱格式"/>
        </div>
      </div>

      <div class="form-group">
        <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密码</label>
        <div class="col-sm-6 col-md-6">
          <input type="password" class="form-control" id="inputPassword" placeholder="禁止输入非法字符"/>
        </div>
      </div>
      <div class="form-group">
        <label for="confirmPassword" class="col-sm-2 col-md-2 control-label">确认密码</label>
        <div class="col-sm-6 col-md-6">
          <input type="password" class="form-control" id="confirmPassword" placeholder="禁止输入非法字符"/>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-6">
          <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="startRegister()">
            注册
          </button>
        </div>
      </div>
    </div>
    <br/>
  </div>
</div>

<!--尾部-->
<script type="text/javascript">
  function startRegister() {
    var user = {};
    user.userName = document.getElementById("inputUserName").value;
    user.email = document.getElementById("inputEmail").value;
    user.password = document.getElementById("inputPassword").value;
    user.confirmPassword = document.getElementById("confirmPassword").value;
    if (user.userName == '') {
      layer.msg('用户名不能为空', {icon: 2});
      return;
    }
    else if (user.userName.length >= 12) {
      layer.msg('用户名长度不能超过12个字符', {icon: 2});
      return;
    }
    if (user.email == '') {
      layer.msg('邮箱不能为空', {icon: 2});
      return;
    }
    else if (!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(
            user.email)) {
      layer.msg('请输入正确的邮箱地址', {icon: 2});
      return;
    }
    else if (user.password == '') {
      layer.msg('密码不能为空', {icon: 2});
      return;
    }
    else if (user.password.length >= 20) {
      layer.msg('密码长度不能超过20个字符', {icon: 2});
      return;
    }
    else if (user.password != user.confirmPassword) {
      layer.msg('两次密码不一致', {icon: 2});
      return;
    }
    var registerResult = null;
    $.ajax({
      async: false, //设置同步
      type: 'POST',
      url: '${ctx}/user/doRegister.do',
      data: user,
      dataType: 'json',
      success: function (result) {
        registerResult = result.result;
      },
      error: function (result) {
        layer.alert('查询用户错误');
      }
    });
    if (registerResult == 'success') {
      layer.msg('注册成功', {icon: 1});
      window.location.href = "${ctx}/user/login.do";
    }
    else if (registerResult == 'nameExist') {
      layer.msg('这个用户名已经被占用啦！', {icon: 2});
    }
    else if (registerResult == 'emailExist') {
      layer.msg('这个用户名已经注册啦！', {icon: 2});
    }
    else if (registerResult == 'fail') {
      layer.msg('服务器异常', {icon: 2});
    }
  }
</script>
</body>
</html>