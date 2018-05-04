package com.summer.blog.service;

import com.summer.blog.entities.Article;

import java.util.List;

/**
 * @Author: summer
 * @Date: 2018 18-3-24 下午3:10
 * @Project: myblog
 */
public interface ArticleService {

  void addArticle(Article article);

  List<Article> getAllArticle();

  Article getArticleByTitle(String title);

  List<Article> getArticleByType(int type);

  List<Article> searchArticle(String keyWord);

  void saveContent(int id, String content);

  String showArticle(int id);

  List<Article> getArticleByLabel(String label);
}
