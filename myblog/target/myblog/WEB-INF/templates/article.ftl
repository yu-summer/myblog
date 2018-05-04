<!doctype html>
<html lang="en">
<head>
  <#assign ctx = request.contextPath/>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="${ctx}/static/editormd/css/editormd.preview.min.css"/>
  <link rel="stylesheet" href="${ctx}/static/editormd/css/editormd.css"/>
  <title>${title}</title>
</head>
<body>
<div class="content" id="content">${content}</div>
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/editormd/lib/marked.min.js"></script>
<script src="${ctx}/static/editormd/lib/prettify.min.js"></script>
<script src="${ctx}/static/editormd/editormd.min.js"></script>
<script type="text/javascript">
  editormd.markdownToHTML("content");
</script>
</body>
</html>