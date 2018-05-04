<!DOCTYPE html>
<html>
<head>
<#assign ctx = request.contextPath/>
  <title>login</title>
  <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="${ctx}/static/css/style.css" rel="stylesheet"/>

  <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/ajaxfileupload.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/layer.js" type="text/javascript"></script>
</head>
<body>
<!-- 中间内容 -->
<div class="container-fluid" style="padding-top: 80px;padding-bottom: 80px">

  <h1 class="title center">登录</h1>
  <br/>
  <div class="col-sm-offset-2 col-md-offest-2">
    <!-- 表单输入 -->
    <div class="form-horizontal">
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱/用户名</label>
        <div class="col-sm-6 col-md-6">
          <input type="text" class="form-control" id="inputEmail" placeholder="xxxxxx@xx.com"/>
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密码</label>
        <div class="col-sm-6 col-md-6">
          <input type="password" class="form-control" id="inputPassword" placeholder="禁止输入非法字符"/>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-6">
          <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="startLogin()">登录
          </button>
        </div>
      </div>
    </div>
    <br/>
  </div>
</div>


<script type="text/javascript">
  function startLogin() {
    var loading = layer.load(0);
    var user = {};
    var loginResult = "";
    user.userNameOrEmail = document.getElementById("inputEmail").value;
    user.password = document.getElementById("inputPassword").value;
    $.ajax({
      async: false,
      type: 'POST',
      url: '${ctx}/user/doLogin.do',
      data: user,
      dataType: 'json',
      success: function (result) {
        loginResult = result.result;
        layer.close(loading);
      },
      error: function (result) {
        layer.alert('查询用户错误');
      }
    });
    if (loginResult == 'success') {
      layer.msg('登录成功', {icon: 1});
      window.location.href = "${ctx}/article/getArticlesByType.do";
    }
    else if (loginResult == 'unexist') {
      layer.msg('是不是用户名记错了？', {icon: 2});
    }
    else if (loginResult == 'wrong') {
      layer.msg('密码不对哦，再想想~', {icon: 2});
    }
    else if (loginResult == 'fail') {
      layer.msg('服务器异常', {icon: 2});
    }
  }
</script>
</body>
</html>
