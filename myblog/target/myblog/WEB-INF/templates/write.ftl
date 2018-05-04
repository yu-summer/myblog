<html>
<head>
  <#assign ctx = request.contextPath/>
  <title>写博客</title>
  <script src="${ctx}/static/js/jquery.min.js"></script>
  <script src="${ctx}/static/editormd/editormd.min.js"></script>
  <link rel="stylesheet" href="${ctx}/static/editormd/css/editormd.min.css"/>
  <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico"
        type="image/x-icon"/>
</head>
<body>
<h1 align="center" id="title">${title}</h1>
<div class="editormd" id="test-editormd">
  <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
  <textarea class="editormd-html-textarea" name="text" id="articleContent"></textarea>
</div>
<button type="submit" onclick="saveArticle()">发表</button>
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/editormd/lib/marked.min.js"></script>
<script src="${ctx}/static/editormd/lib/prettify.min.js"></script>
<script src="${ctx}/static/editormd/editormd.min.js"></script>
<script src="${ctx}/static/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function () {
    editormd("test-editormd", {
      width: "90%",
      height: 640,
      syncScrolling: "single",
      path: "${ctx}/static/editormd/lib/",
      imageUpload: true,
      imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
      imageUploadURL: "${ctx}/article/uploadImage.do",
      saveHTMLToTextarea: true,

      emoji: true,//emoji表情，默认关闭
      taskList: true,
      tocm: true, // Using [TOCM]
      tex: true,// 开启科学公式TeX语言支持，默认关闭

      flowChart: true,//开启流程图支持，默认关闭
      sequenceDiagram: true,//开启时序/序列图支持，默认关闭,

      //下面这一行将使用dark主题
      previewTheme: "dark",
    });
  });

  function saveArticle() {
    var article = {};
    article.title = $('#title').text();
    article.content = document.getElementById("articleContent").value;
    var saveResult = null;
    $.ajax({
      async: false,
      type: 'POST',
      url: '${ctx}/article/saveArticleToHtml.do',
      data: article,
      dataType: 'JSON',
      success: function (result) {
        saveResult = result.result;
      },
      error: function (result) {
        layer.alert("发表文章出错");
      }
    });
    if (saveResult == 'success') {
      layer.msg('发表文章成功', {icon: 1});
      window.location.href = "${ctx}/article/getArticlesByType.do";
    } else if (saveResult == 'fail') {
      layer.msg('服务器异常', {icon: 2});
    }
  }
</script>
</body>
</html>