package com.summer.blog.entities;

import lombok.Data;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-5-2 下午7:34 Project: myblog Package: com.summer.blog.entities
 * Desc:
 */
@Data
public class Label {
  private int id;
  private String labelName;
  private int counts;

  public Label() {
  }

  public Label(int id, String labelName, int counts) {
    this.id = id;
    this.labelName = labelName;
    this.counts = counts;
  }
}
