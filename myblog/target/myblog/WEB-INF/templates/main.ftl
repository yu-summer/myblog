<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
<#assign ctx = request.contextPath/>
  <title>summer blog</title>
  <meta name="keywords" content="blog, summer, linux, java"/>
  <meta name="'description" content="summer的个人技术博客,分享自己的一些技术心得"/>
  <meta name="author" content="lijiahaosummer@gmail.com"/>
  <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctx}/static/css/index.css" rel="stylesheet"/>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        rel="stylesheet">

  <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/js/layer.js" type="text/javascript"></script>

  <style>
    body {
      background: url("${ctx}/static/images/background.jpg") no-repeat;
      background-size: cover;
      min-height: 960px;
    }
  </style>
</head>
<body>
<div id="background"></div>
<#include "include/header1.ftl">
<div id="b-content" class="container">
  <div class="row">
  <#--左侧列表开始-->
    <div class="col-xs-12 col-md-12 col-lg-8">
    <#if articles?exists>
    <#--article cycle start -->
      <#list articles as article>
        <div class="row b-one-article">
          <h3 class="col-xs-12 col-md-12 col-lg-12">
            <a class="b-oa-title"
               href="${ctx}/article/showArticle.do?title=${article.title}">${article.title}</a>
          </h3>
          <div class="col-xs-12 col-md-12 col-lg-12 b-date">
            <ul class="row list-unstyled">
              <li class="col-xs-5 col-md-2 col-lg-3">
                <i class="fa fa-user"></i>${article.author}
              </li>
              <li class="col-xs-5 col-md-2 col-lg-3">
                <i class="fa fa-calendar"></i>${article.time}
              </li>
              <li class="col-xs-5 col-md-2 col-lg-3">
                <i class="fa fa-list-alt"></i><a href="#" target="_blank">
                  <#if article.type = 1>
                    java
                  <#elseif article.type = 2>
                    linux
                  <#elseif article.type = 4>
                    闲谈
                  <#elseif article.type = 5>
                    电影
                  <#else>
                    test
                  </#if>
              </a>
              </li>
              <li class="col-xs-5 col-md-2 col-lg-3">
                <i class="fa fa-tags"></i>
                <#list article.labels?split(",") as label>
                  <a class="b-tag-name" href="${ctx}/article/getArticleByLabel.do?label=${label}" target="_blank">${label}</a>
                </#list>
              </li>
            </ul>
          </div>
          <div class="col-xs-12 col-md-12 col-lg-12">
            <div class="row">
              <div class="col-sm-6 col-md-6 col-lg-4 hidden-xs">
                <figure class="b-oa-pic b-style1">
                  <a href="${ctx}/article/showArticle.do?title=${article.title}" target="_blank">
                    <img alt="" src="${ctx}/static/title_Img/${article.id}.jpg"/>
                  </a>
                  <figcaption>
                    <a href="#" target="_blank"></a>
                  </figcaption>
                </figure>
              </div>
              <!-- 文章描述start -->
              <div class="col-xs-12 col-sm-6 col-lg-8 b-des-read">${article.description}</div>
              <!-- 文章描述end -->
            </div>
          </div>
          <a class="b-readall" href="${ctx}/article/showArticle.do?title=${article.title}"
             target="_blank">show all</a>
        </div>
      </#list>
    <#--article cycle end -->
    </#if>
    <#if (articles?size ==  0)>
      <h1>nothing</h1>
    </#if>
    </div>
    <div id="b-public-right" class="col-lg-4 hidden-xs hidden-sm hidden-md">
      <div class="b-search">
        <form class="form-inline" role="form" action="${ctx}/article/searchArticle.do"
              method="get">
          <input class="b-search-text" type="text" name="searchKeyWord">
          <input class="b-search-submit" type="submit" value="全站搜索">
        </form>
      </div>
      <div class="b-tags">
        <h4 class="b-title">加入组织</h4>
        <ul class="b-all-tname">
          <li class="b-qun-or-code">
            <img src="https://baijunyao.com/uploads/images/default.png" alt="QQ">
          </li>
          <li class="b-qun-word">
            <p class="b-qun-nuber">
              1. 手Q扫左侧二维码
            </p>
            <p class="b-qun-nuber">
              2. 搜Q群：259335267
            </p>
            <p class="b-qun-code">
              3. 点击<a
                href="#"
                target="_blank" rel="nofollow"><img border="0"
                                                    src="//pub.idqqimg.com/wpa/images/group.png"
                                                    alt="个人博客测试群" title="个人博客测试群"></a>
            </p>
          </li>
        </ul>
      </div>
      <div class="b-tags">
        <h4 class="b-title">热门标签</h4>
        <ul class="b-all-tname">
            <#if labels?exists>
              <#assign x = 1/>
              <#list labels as label>
                  <li class="b-tname" style="list-style-type: none">
                    <a class="tstyle-${x}" href="${ctx}/article/getArticleByLabel.do?label=${label.labelName}"
                       onclick="#"> ${label.labelName}</a>
                  </li>
                <#assign x = x + 1/>
                <#if x == 5>
                  <#assign x = 1/>
                </#if>
              </#list>
            </#if>
        </ul>
      </div>
      <div class="b-recommend">
        <h4 class="b-title">置顶推荐</h4>
        <p class="b-recommend-p">
              <#if recommends?exists>
                  <#list recommends as recommend>
                    <a class="b-recommend-a" href=${recommend.link} target="_blank"><span
                        class="fa fa-th-list b-black"></span> ${recommend.title}</a>
                  </#list>
              </#if>
        </p>
      </div>
    </div>
  </div>
</div>
<canvas id="reactive-bg-canvas"></canvas>
<#--<script src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js" type="text/javascript"></script>　-->
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.bootcss.com/gsap/latest/TweenLite.min.js"></script>
<script src="${ctx}/static/js/background.js"></script>
<script type="text/javascript">
  showLabelAndLink();

  function showLabelAndLink() {
    $.ajax({
      async: false,
      type: 'GET',
      url: '${ctx}/getAllLabels.do',
      success: function (result) {
      },
      error: function (result) {
        layer.alert("显示标签错误");
      }
    });
  }

  function random_move() {
    $.magicCanvas.draw({
      type: "random-move",
      rgb: function (circlePos) {
        var px = circlePos.x;
        var py = circlePos.y;
        // do some computation....
        return {r: parseInt(px % 255), g: parseInt(py % 255), b: 203};
      }
    })
  };
  random_move();
</script>
</body>
</html>