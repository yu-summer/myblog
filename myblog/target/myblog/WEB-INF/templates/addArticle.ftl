<#--Created by IntelliJ IDEA.-->
<#--User: summer-->
<#--Date: 18-3-24-->
<#--Time: 上午11:38-->
<#--To change this template use File | Settings | File Templates.-->
<html>
<head>
  <#assign ctx = request.contextPath/>
  <title>add article</title>
  <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctx}/static/css/index.css" rel="stylesheet"/>
  <link href="${ctx}/static/css/jquery-labelauty.css" rel="stylesheet"/>

  <style>
    ul {
      list-style-type: none;
    }

    li {
      display: inline-block;
    }

    li {
      margin: 10px 0;
    }

    input.labelauty + label {
      font: 12px "Microsoft Yahei";
    }
  </style>

</head>
<body>
<#include "include/header1.ftl">
<div class="col-md-12">
  <hr/>
  <div class="container-fluid">
    <h1 class="title center" align="center">添加文章</h1>
    <div class="col-sm-offset-2 col-md-offset-2">
      <!--表单输入-->
      <div class="form-horizontal">
        <div class="form-group">
          <label for="articleTitle" class="col-sm-2 col-md-2 control-label">文章标题</label>
          <div class="col-sm-6 col-md-6">
            <input type="text" class="form-control" id="articleTitle" placeholder="title">
          </div>
        </div>
        <div class="form-group">
          <label for="author" class="col-sm-2 col-md-2 control-label">作者</label>
          <div class="col-sm-6 col-md-6">
            <input type="text" class="form-control" id="author" placeholder="author">
          </div>
        </div>
        <div class="form-group">
          <label for="articleType" class="col-sm-2 col-md-2 control-label">文章类型</label>
          <div class="col-sm-6 col-md-6">
            <#--<select name="articleType" id="articleType" class="form-control">-->
            <#--<option value="1">java</option>-->
            <#--<option value="2">linux</option>-->
            <#--<option value="3">闲谈</option>-->
            <#--<option value="4">电影</option>-->
            <#--<option value="5">test</option>-->
            <#--</select>-->
            <ul class="dowebok">
              <li><input type="radio" name="radio" data-labelauty="java" value="1"></li>
              <li><input type="radio" name="radio" data-labelauty="linux" value="2"></li>
              <li><input type="radio" name="radio" data-labelauty="电影" value="4"></li>
              <li><input type="radio" name="radio" data-labelauty="闲谈" value="3"></li>
              <li><input type="radio" name="radio" data-labelauty="test" value="5"></li>
            </ul>
          </div>
        </div>
        <div class="form-group">
          <label for="author" class="col-sm-2 col-md-2 control-label">选择标签</label>
          <div class="col-sm-6 col-md-6">
            <ul class="dowebok">
              <#if labels?exists>
              <#list labels as label>
              <li><input type="checkbox" name="checkbox" data-labelauty="${label.labelName}" value="${label.labelName}">
              </li>
              </#list>
              </#if>
            </ul>
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 col-md-2 control-label">描述</label>
          <div class="col-sm-6 col-md-6">
            <textarea class="form-control" rows="3" id="description"
                      placeholder="description"></textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="articleImgUpload" class="col-sm-2 col-md-2 control-label" accept="image/jpg">文章图片</label>
          <div class="col-sm-6 col-md-6">
            <input name="articleImgUpload" type="file" id="articleImgUpload">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-6" id="imgPreSee"></div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-6">
            <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="addArticle()">
              添加文章
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/layer.js" type="text/javascript"></script>
<script src="${ctx}/static/js/jquery-labelauty.js" type="text/javascript"></script>
<script src="${ctx}/static/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function () {
    $(':input').labelauty();
  });

  function addArticle() {
    var article = {};
    article.title = document.getElementById("articleTitle").value;
    article.author = document.getElementById("author").value;
    article.type = getRadio().join();
    article.labels = getCheckbox().join(",");
    article.description = document.getElementById("description").value;
    var addResult = "";
    $.ajax({
      async: false,
      type: 'POST',
      url: '${ctx}/article/addArticle.do',
      data: article,
      dataType: 'JSON',
      success: function (result) {
        addResult = result.result;
      },
      error: function (result) {
        layer.alert("添加文章出错");
      }
    });
    if (addResult == "success") {
      fileUpload();
      layer.msg('添加文章成功', {icon: 1, time: 1000});
//            layer.close(loadings);
    }
  }

  function fileUpload() {
    var results = "";
    var title = document.getElementById("articleTitle").value;
    $.ajaxFileUpload({
      url: '${ctx}/article/uploadFile.do?title=' + title,
      secureuri: false,
      fileElementId: 'articleImgUpload',
      type: 'POST',
      dataType: 'text',
      success: function (result) {
        result = result.replace(/<pre.*?>/g, '');
        result = result.replace(/<PRE.*?>/g, '');
        result = result.replace("<PRE>", '');
        result = result.replace("<pre>", '');
        result = result.replace("</pre>", '');
        result = JSON.parse(result);
        results = result.result;
        if (results == "success") {
          layer.msg("图片上传成功", {icon: 1});
          var url = "${ctx}/article/toWriteArticle.do?title=" + title;
          window.location.href = url;
        } else {
          layer.msg("图片上传失败", {icon: 0});
        }
      },
      error: function () {
        layer.alert("上传错误");
      }
    })
  }

  //获取radio
  function getRadio() {
    var obj = document.getElementsByName("radio");
    var check_val = [];
    for (k in obj) {
      if (obj[k].checked) {
        check_val.push(obj[k].value);
      }
    }
    return check_val;
  }

  //获取checkbox
  function getCheckbox() {
    var obj = document.getElementsByName("checkbox");
    var check_val = [];
    for (k in obj) {
      if (obj[k].checked) {
        check_val.push(obj[k].value);
      }
    }
    return check_val;
  }
</script>
</body>
</html>