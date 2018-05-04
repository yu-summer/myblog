<#assign ctx = request.contextPath/>
<!--导航栏部分-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
              data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${ctx}/article/getArticlesByType.do">summer</a>
      <a class="navbar-brand"
         href="${ctx}/article/getArticlesByType.do">&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a class="navbar-brand" href="${ctx}/article/getArticlesByType.do">&nbsp;&nbsp;java</a>
      <a class="navbar-brand"
         href="${ctx}/article/getArticlesByType.do?type=2">&nbsp;&nbsp;linux</a>
      <a class="navbar-brand" href="${ctx}/article/getArticlesByType.do?type=3">&nbsp;&nbsp;电影</a>
      <a class="navbar-brand" href="${ctx}/article/getArticlesByType.do?type=4">&nbsp;&nbsp;闲谈</a>
      <a class="navbar-brand" href="${ctx}/article/getArticlesByType.do?type=5">&nbsp;&nbsp;test</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <@shiro.notAuthenticated>
        <li><a href="${ctx}/user/register.do" methods="post">注册</a></li>
        <li><a href="${ctx}/user/login.do" methods="post">登录</a></li>
      </@shiro.notAuthenticated>
      <@shiro.authenticated>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
             aria-haspopup="true" aria-expanded="false">
            <@shiro.principal/>
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <@shiro.hasAnyRoles name="admin, manager">
              <li><a href="${ctx}/article/toAddArticle.do">添加文章</a></li>
              <li><a href="#">修改文章</a></li>
            </@shiro.hasAnyRoles>
            <li><a href="${ctx}/user/toCheckUser.do">查看个人资料</a></li>
            <li><a href="${ctx}/user/toUpdateUser.do">修改个人资料
            </a></li>
            <li><a href="${ctx}/logout.do">注销登录</a></li>
          </ul>
        </li>
      </@shiro.authenticated>
      </ul>

      <div class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="search" id="searchKeyWord"/>
        </div>
        <button class="btn btn-default" onclick="searchProduct();">查找文章</button>
      </div>
    </div>
  </div>
</nav>
<script type="text/javascript">
  function searchProduct() {
    var keyWord = document.getElementById("searchKeyWord").value;
    if (keyWord != '') {
      var url = "${ctx}/article/searchArticle.do?searchKeyWord=" + keyWord;
      window.location.href = url;
    }
  }
</script>