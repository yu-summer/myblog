<#--Created by IntelliJ IDEA.-->
<#--User: summer-->
<#--Date: 18-3-24-->
<#--Time: 上午10:20-->
<!-- Top navigation start -->
<#assign ctx = request.contextPath/>
<header>
  <div class='container'>
    <#--<div class='navbar-header'>-->
      <#--<a class='navbar-brand' href='/' onclick='recordId('/', 0)'>-->
      <#--<div class='hidden-xs b-nav-background'></div>-->
      <#--<ul class='b-logo-code'>-->
      <#--</ul>-->
      <#--<p class='b-logo-word'>summer</p>-->
      <#--<p class='b-logo-end'></p>-->
      <#--</a>-->
    <#--</div>-->
    <div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
      <ul class='nav navbar-nav b-nav-parent'>
        <li class='hidden-xs b-nav-mobile'></li>
        <li class='b-nav-cname b-nav-active'>
          <a href="${ctx}/article/getArticlesByType.do?type=1">summer</a>
        </li>
        <li class='b-nav-cname b-nav-active'>
          <a href="${ctx}/article/getArticlesByType.do?type=1">home</a>
        </li>
        <li class='b-nav-cname'>
          <a href="${ctx}/article/getArticlesByType.do?type=1">java</a>
        </li>
        <li class='b-nav-cname'>
          <a href="${ctx}/article/getArticlesByType.do?type=2" onclick=''>linux</a>
        </li>
        <li class='b-nav-cname'>
          <a href='${ctx}/article/getArticlesByType.do?type=3' onclick=''>闲谈</a>
        </li>
        <li class='b-nav-cname'>
          <a href='${ctx}/article/getArticlesByType.do?type=4' onclick=''>电影</a>
        </li>
        <li class='b-nav-cname'>
          <a href='${ctx}/article/getArticlesByType.do?type=5' onclick=''>test</a>
        </li>
      </ul>
      <ul id='b-login-word' class='nav navbar-nav navbar-right'>
        <li class='b-nav-cname b-nav-login'>
          <div class='hidden-xs b-login-mobile'></div>
          <a href='${ctx}/user/login.do' onclick=''>login</a>
        </li>
        <li class='b-nav-cname b-nav-login'>
          <div class='hidden-xs b-login-mobile'></div>
          <a href='${ctx}/user/login.do' onclick=''>register</a>
        </li>
      </ul>
    </div>
  </div>
</header>
<!-- Top navigation end -->
