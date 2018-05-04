package com.summer.blog.controller;

import com.summer.blog.entities.Article;
import com.summer.blog.service.ArticleService;
import com.summer.blog.service.LabelService;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-3-24 上午11:00 Project: myblog Package: com.summer.blog.controller Desc:
 */
@RequestMapping("article")
@Controller
public class ArticleController {

  @Autowired
  private ArticleService articleService;
  @Autowired
  private LabelService labelService;

  @RequestMapping("main.do")
  public String toMain() {
    return "main";
  }

  @RequestMapping(value = "toWriteArticle.do", method = RequestMethod.GET)
  public String toWrite(String title, HttpServletRequest request) {
    request.getSession().setAttribute("title", title);
    return "write";
  }

  @RequestMapping("toAddArticle.do")
  public String toAddArticle() {
    return "addArticle";
  }


  /**
   * @Author: summer
   * @Date: 18-3-24 下午6:16
   * @Param: String title, String author, int type, String description
   * @Return: Map<String                               ,                                                               Object>
   * @Desc: 用于响应添加文章请求
   */
  //success
  @RequestMapping(value = "addArticle.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> addArticle(String title, String author, int type, String labels,
      String description) {
    String result = "fail";
    Date date = new Date();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    Article article = new Article(title, author, simpleDateFormat.format(date), type, labels,
        description);
    articleService.addArticle(article);
    result = "success";
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("result", result);
    return resultMap;
  }

  /**
   * @Author: summer
   * @Date: 18-3-24 下午6:18
   * @Param: MultipartFile articleImgUpload,String title, HttpServletRequest request
   * @Return: Map<String   ,   Object>
   * @Desc: 用于响应文章图片上传
   */
  //success
  @RequestMapping(value = "uploadFile.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> uploadFile(MultipartFile articleImgUpload, String title,
      HttpServletRequest request) {
    String result = "fail";
    try {
      if (articleImgUpload != null && !articleImgUpload.isEmpty()) {
        String fileRealPath = request.getSession().getServletContext()
            .getRealPath("/static/title_Img");
        int id = articleService.getArticleByTitle(title).getId();
        String fileName = id + ".jpg";
        File fileFolder = new File(fileRealPath);
        System.out.println("fileRealPath=" + fileRealPath + "/" + fileName);
        if (!fileFolder.exists()) {
          fileFolder.mkdir();
        }
        File file = new File(fileFolder, fileName);
        articleImgUpload.transferTo(file);
        result = "success";
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("result", result);
    return resultMap;
  }

  @RequestMapping(value = "searchArticle.do", method = RequestMethod.GET)
  public String searchArticle(String searchKeyWord, HttpServletRequest request) {
    List<Article> articleList = articleService.searchArticle(searchKeyWord);
    request.getSession().setAttribute("articles", articleList);
    return "main";
  }

  @RequestMapping(value = "getArticleByLabel.do", method = RequestMethod.GET)
  public String getArticleByLabel(String label, HttpServletRequest request) {
    List<Article> articleList = articleService.getArticleByLabel(label);
    request.getSession().setAttribute("articles", articleList);
    return "main";
  }

  //success
  @RequestMapping(value = "getArticlesByType.do", method = RequestMethod.GET)
  public String getArticlesByTitle(@RequestParam(value = "type", defaultValue = "1") int type,
      HttpServletRequest request) {
    List<Article> articleList = articleService.getArticleByType(type);
    request.getSession().setAttribute("articles", articleList);
    return "main";
  }

  @RequestMapping(value = "uploadImage.do", method = RequestMethod.POST)
  public void hello(HttpServletRequest request, HttpServletResponse response,
      @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {
    try {
      request.setCharacterEncoding("utf-8");
      response.setHeader("Content-Type", "text/html");
      String rootPath = request.getSession().getServletContext().getRealPath("/static/article_Img");

      /**
       * 文件路径不存在则需要创建文件路径
       */
      File filePath = new File(rootPath);
      if (!filePath.exists()) {
        filePath.mkdirs();
      }

      //最终文件名
      File realFile = new File(rootPath + File.separator + attach.getOriginalFilename());
      FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

      response.getWriter().write(
          "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/static/article_Img/" + attach
              .getOriginalFilename() + "\"}");

    } catch (Exception e) {
      try {
        response.getWriter().write("{\"success\":0}");
      } catch (IOException e1) {
        e1.printStackTrace();
      }
    }
  }

  @RequestMapping(value = "saveArticleToHtml.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> saveArticle(String title, String content) {
    String result = "fail";
    int id = articleService.getArticleByTitle(title).getId();
    articleService.saveContent(id, content);
    result = "success";
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("result", result);
    return resultMap;
  }

  @RequestMapping(value = "showArticle.do", method = RequestMethod.GET)
  public String showArticle(String title, HttpServletRequest request) {
    int id = articleService.getArticleByTitle(title).getId();
    request.getSession().setAttribute("content", articleService.showArticle(id));
    request.getSession().setAttribute("title", title);
    return "article";
  }
}
