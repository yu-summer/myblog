package com.summer.blog.dao;

import com.summer.blog.entities.Label;
import com.summer.blog.entities.Recommend;
import java.util.List;

/**
 * @Author: summer
 * @Date: 2018 18-5-2 下午7:37
 * @Project: myblog
 */
public interface LabelDao {
  List<Label> getAllLabel();
  List<Recommend> getAllRecommends();
  List<String> showLabels(String title);
}
