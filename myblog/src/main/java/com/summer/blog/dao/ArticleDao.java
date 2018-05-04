package com.summer.blog.dao;

import com.summer.blog.entities.Article;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: summer
 * @Date: 2018 18-3-24 上午10:35
 * @Project: myblog
 */
public interface ArticleDao {

  List<Article> getAllArticle();

  void addArticle(Article article);

  Article getArticleByTitle(String title);

  List<Article> getArticleByType(int type);

  List<Article> searchArticle(String keyWord);

  void saveContent(@Param("id") int id, @Param("content") String content);

  String showArticle(int id);

  List<Article> getArticleByLabel(String label);
}
