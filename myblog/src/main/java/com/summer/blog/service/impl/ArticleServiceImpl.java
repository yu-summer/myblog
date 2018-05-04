package com.summer.blog.service.impl;

import com.summer.blog.dao.ArticleDao;
import com.summer.blog.entities.Article;
import com.summer.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-3-24 下午3:11 Project: myblog Package: com.summer.blog.service.impl Desc:
 */
@Service
public class ArticleServiceImpl implements ArticleService {

  @Autowired
  private ArticleDao articleDao;

  @Override
  public void addArticle(Article article) {
	articleDao.addArticle(article);
  }

  @Override
  public List<Article> getAllArticle() {
	return articleDao.getAllArticle();
  }

  @Override
  public Article getArticleByTitle(String title) {
	return articleDao.getArticleByTitle(title);
  }

  @Override
  public List<Article> getArticleByType(int type) {
	return articleDao.getArticleByType(type);
  }

  @Override
  public List<Article> searchArticle(String keyWord) {
	return articleDao.searchArticle(keyWord);
  }

  @Override
  public void saveContent(int id, String content) {
	articleDao.saveContent(id, content);
  }

  @Override
  public String showArticle(int id) {
	return articleDao.showArticle(id);
  }

  @Override
  public List<Article> getArticleByLabel(String label) {
    return articleDao.getArticleByLabel(label);
  }
}
