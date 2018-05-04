package com.summer.blog.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-3-24 上午10:33 Project: myblog Package: com.summer.blog.entities Desc:
 */
@Data
@NoArgsConstructor
public class Article {

  private int id;
  private String title;
  private String author;
  private String time;
  private int type;
  private String labels;
  private String description;

  public Article(String title, String author, String time, int type, String labels,
      String description) {
    this.title = title;
    this.author = author;
    this.time = time;
    this.type = type;
    this.labels = labels;
    this.description = description;
  }
}
